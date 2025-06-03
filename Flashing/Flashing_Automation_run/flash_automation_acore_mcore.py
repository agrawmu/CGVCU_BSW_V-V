#!/usr/bin/env python3
import sys, os, time, glob, subprocess, logging, serial.tools.list_ports, pyautogui
from pyftdi.gpio import GpioController

# ── Configuration ─────────────────────────────────────────────────────────────
MOBAXTERM = r"C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe"
Flash_tool = r"C:\NXP\S32DS.3.5\S32DS\tools\S32FlashTool"
Bin_Dir = r"D:\Jenkins\Flashing\F5\F5_Acore_Mcore"
Candidates = ["Silicon Labs CP210x", "USB-Enhanced-SERIAL CH9102"]

logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)-8s %(message)s', datefmt='%H:%M:%S')

# ── Relay Control ─────────────────────────────────────────────────────────────
current_state = 0x00
def relay_control(mask, enable=True):
    global current_state
    current_state = (current_state | mask) if enable else (current_state & ~mask)
    gpio.write(current_state)

relay_1_on  = lambda g: (relay_control(0x03, True), logging.info("Relay 1 ON"))
relay_1_off = lambda g: (relay_control(0x03, False), logging.info("Relay 1 OFF"))
relay_2_on  = lambda g: (relay_control(0x0C, True), logging.info("Relay 2 ON"))
relay_2_off = lambda g: (relay_control(0x0C, False), logging.info("Relay 2 OFF"))
relay_3_on  = lambda g: (relay_control(0x30, True), logging.info("Relay 3 ON (Power-ON-Reset)"))
relay_3_off = lambda g: (relay_control(0x30, False), logging.info("Relay 3 OFF"))
relay_4_on  = lambda g: (relay_control(0xC0, True), logging.info("Relay 4 ON"))
relay_4_off = lambda g: (relay_control(0xC0, False), logging.info("Relay 4 OFF"))

def power_on_reset():
    relay_3_on(gpio); time.sleep(2)
    relay_3_off(gpio); time.sleep(2)

def switch_to_flash_mode():
    relay_1_on(gpio); relay_2_off(gpio)
    time.sleep(1); logging.info("Switched to FLASH mode")

def switch_to_boot_mode():
    relay_1_off(gpio); relay_2_on(gpio)
    time.sleep(1); logging.info("Switched to BOOT mode")

# ── Utility Functions ─────────────────────────────────────────────────────────
def run_cmd(cmd, err_msg):
    logging.info(f"Running: {' '.join(cmd)}")
    try: subprocess.run(cmd, check=True)
    except subprocess.CalledProcessError: logging.error(err_msg); sys.exit(1)

def pick_file(pattern, descr):
    matches = glob.glob(pattern)
    if len(matches) != 1:
        logging.error(f"Expected one {descr}, found {len(matches)}: {pattern}")
        sys.exit(1)
    return matches[0]

def get_board_port():
    for name in Candidates:
        try: return next(serial.tools.list_ports.grep(name)).device
        except StopIteration: pass
    for p in serial.tools.list_ports.comports():
        if any(name in p.description or name in p.hwid for name in Candidates):
            return p.device
    raise IOError("Cannot find the board!")

# ── Flash Functions ───────────────────────────────────────────────────────────
def nor_erase():
    run_cmd(["S32FlashTool", "-t", target_bin, "-i", "uart", "-p", port, "-a", alg_nor_bin,
             "-ferase", "-addr", "0x0", "-size", "0xb90000"], "NOR erase failed")
    logging.info("NOR erase complete")

def nor_program(file, addr):
    run_cmd(["S32FlashTool", "-t", target_bin, "-i", "uart", "-p", port, "-a", alg_nor_bin,
             "-fprogram", "-f", file, "-addr", addr], f"NOR program {file} failed")
    logging.info(f"NOR programmed {os.path.basename(file)} @ {addr}")

def emmc_erase():
    run_cmd(["S32FlashTool", "-t", target_bin, "-i", "uart", "-p", port, "-a", alg_emmc_bin,
             "-ferase", "-addr", "0x0", "-size", "0xb9000000"], "eMMC erase failed")
    logging.info("eMMC erase complete")

def emmc_program(file, addr):
    run_cmd(["S32FlashTool", "-t", target_bin, "-i", "uart", "-p", port, "-a", alg_emmc_bin,
             "-fprogram", "-f", file, "-addr", addr], f"eMMC program {file} failed")
    logging.info(f"eMMC programmed {os.path.basename(file)} @ {addr}")

# ── Main Flow ─────────────────────────────────────────────────────────────────
def main():
    global gpio, port, target_bin, alg_nor_bin, alg_emmc_bin

    port = get_board_port()
    logging.info(f"Using serial port: {port}")

    target_bin   = os.path.join(Flash_tool, "targets", "S32G3xxx.bin")
    alg_nor_bin  = os.path.join(Flash_tool, "flash", "MX25UW51245G.bin")
    alg_emmc_bin = os.path.join(Flash_tool, "flash", "EMMC.bin")

    delivered_bootloader    = pick_file(os.path.join(Bin_Dir, "F5_Bootloader.bin"), "delivered_bootloader")
    mcore_bin               = pick_file(os.path.join(Bin_Dir, "f5_Mcore.bin"), "M-core app")
    bl2_file                = pick_file(os.path.join(Bin_Dir, "bl2_w_dtb.s32-sdcard"), "A-core FIP")

    # Kill MobaXterm sessions
    logging.info("Killing any open MobaXterm session ..")
    subprocess.run(["taskkill", "/F", "/IM", "MobaXterm.exe"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    proc_check_1 = subprocess.Popen([MOBAXTERM])
    time.sleep(3)
    proc_check_1.terminate()

    # GPIO Init
    gpio = GpioController()
    gpio.configure('ftdi://::/1', direction=0xFF)
    gpio.write(0x00)

    # Flashing: Delivered Bootloader + M-core + BL2
    logging.info("MobaXterm closed, resuming flash flow..")
    switch_to_flash_mode(); power_on_reset(); power_on_reset()
    nor_erase()
    nor_program(delivered_bootloader, "0x0")
    nor_program(mcore_bin, "0x50000")
    nor_program(bl2_file, "0x600000")

    logging.info("Switching back to Boot mode")
    switch_to_boot_mode(); power_on_reset()

    # Final verification
    subprocess.Popen([MOBAXTERM, "-bookmark", port])
    time.sleep(1); power_on_reset(); power_on_reset()

    logging.info("All done — please reboot and verify.")

if __name__ == "__main__":
    main()
