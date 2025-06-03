#!/usr/bin/env python3
import sys
import subprocess
import serial
import time
import os
import glob
import logging
import pyautogui
import serial.tools.list_ports
from pyftdi.gpio import GpioController

# ── Setup a basic logger ───────────────────────────────────────────────────────
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s %(levelname)-8s %(message)s',
    datefmt='%H:%M:%S'
)
subprocess.run(
    ["taskkill", "/F", "/IM", "MobaXterm.exe"],
    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
)
MOBAXTERM = r"C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe"

proc_check_1 = subprocess.Popen([MOBAXTERM])
time.sleep(3)
proc_check_1.terminate()

# Relay Control functions
current_state = 0x00

def relay_1_on(gpio):
    global current_state
    current_state |= 0x03
    gpio.write(current_state)
    logging.info("Relay 1 ON")

def relay_1_off(gpio):
    global current_state
    current_state &= ~0x03
    gpio.write(current_state)
    logging.info("Relay 1 OFF")

def relay_2_on(gpio):
    global current_state
    current_state |= 0x0C
    gpio.write(current_state)
    logging.info("Relay 2 ON")

def relay_2_off(gpio):
    global current_state
    current_state &= ~0x0C
    gpio.write(current_state)
    logging.info("Relay 2 OFF")

def relay_3_on(gpio):
    global current_state
    current_state |= 0x30
    gpio.write(current_state)
    logging.info("Relay 3 ON (Power-ON-Reset)")

def relay_3_off(gpio):
    global current_state
    current_state &= ~0x30
    gpio.write(current_state)
    logging.info("Relay 3 OFF")

def relay_4_on(gpio):
    global current_state
    current_state |= 0xC0
    gpio.write(current_state)
    logging.info("Relay 4 ON")

def relay_4_off(gpio):
    global current_state
    current_state &= ~0xC0
    gpio.write(current_state)
    logging.info("Relay 4 OFF")

def power_on_reset():
    relay_3_on(gpio)
    time.sleep(2)
    relay_3_off(gpio)
    time.sleep(2)

def switch_to_flash_mode():
    relay_1_on(gpio)
    relay_2_off(gpio)
    time.sleep(1)
    logging.info("Switched to FLASH mode")

def switch_to_boot_mode():
    relay_1_off(gpio)
    relay_2_on(gpio)
    time.sleep(1)
    logging.info("Switched to BOOT mode")

def run_cmd(cmd, err_msg):
    logging.info(f"Running: {' '.join(cmd)}")
    try:
        subprocess.run(cmd, check=True)
    except subprocess.CalledProcessError:
        logging.error(err_msg)
        sys.exit(1)

find_cli_root = r"C:\NXP\S32DS.3.5\S32DS\tools\S32FlashTool"

def pick_file(pattern, descr):
    matches = glob.glob(pattern)
    if len(matches) != 1:
        logging.error(f"Expected one {descr}, found {len(matches)}: {pattern}")
        sys.exit(1)
    return matches[0]

def get_ch9102_port():
    candidates = ["Silicon Labs CP210x", "USB-Enhanced-SERIAL CH9102"]
    for name in candidates:
        try:
            return next(serial.tools.list_ports.grep(name)).device
        except StopIteration:
            pass

    for p in serial.tools.list_ports.comports():
        for name in candidates:
            if name in p.description or name in p.hwid:
                return p.device
    raise IOError("Cannot find the board!")

def main():
    bin_dir = r"D:\Jenkins\Flashing\F5\F5_Cyber_Security"

    port = get_ch9102_port()
    logging.info(f"Using serial port: {port}")

    target_bin   = os.path.join(find_cli_root, "targets", "S32G3xxx.bin")
    alg_nor_bin  = os.path.join(find_cli_root, "flash", "MX25UW51245G.bin")
    alg_emmc_bin = os.path.join(find_cli_root, "flash", "EMMC.bin")

    bootloader_core_minimal = pick_file(os.path.join(bin_dir, "Bootloader_core_minimal.bin"), "bootloader")
    fip_core                = pick_file(os.path.join(bin_dir, "fip_core.s32-sdcard"), "FIP core")
    core_minimal_img        = pick_file(os.path.join(bin_dir, "core-image-minimal-*.rootfs.sdcard"), "minimal image")
    delivered_bootloader    = pick_file(os.path.join(bin_dir, "F5_TLS_SEC_BOOTLODER.bin"), "delivered_bootloader")
    # mcore_bin               = pick_file(os.path.join(bin_dir, "f5_Mcore.bin"), "M-core app")
    bl2_file                = pick_file(os.path.join(bin_dir, "bl2_w_dtb.s32-sdcard"), "A-core FIP")

    def nor_erase():
        run_cmd([
            "S32FlashTool", "-t", target_bin,
            "-i", "uart", "-p", port,
            "-a", alg_nor_bin,
            "-ferase", "-addr", "0x0", "-size", "0xb90000"
        ], "NOR erase failed")
        logging.info("NOR erase complete")

    def nor_program(file, addr):
        run_cmd([
            "S32FlashTool", "-t", target_bin,
            "-i", "uart", "-p", port,
            "-a", alg_nor_bin,
            "-fprogram", "-f", file,
            "-addr", addr
        ], f"NOR program {file} failed")
        logging.info(f"NOR programmed {os.path.basename(file)} @ {addr}")

    def emmc_erase():
        run_cmd([
            "S32FlashTool", "-t", target_bin,
            "-i", "uart", "-p", port,
            "-a", alg_emmc_bin,
            "-ferase", "-addr", "0x0", "-size", "0xb9000000"
        ], "eMMC erase failed")
        logging.info("eMMC erase complete")

    def emmc_program(file, addr):
        run_cmd([
            "S32FlashTool", "-t", target_bin,
            "-i", "uart", "-p", port,
            "-a", alg_emmc_bin,
            "-fprogram", "-f", file,
            "-addr", addr
        ], f"eMMC program {file} failed")
        logging.info(f"eMMC programmed {os.path.basename(file)} @ {addr}")

    # ──Execution flow ────────────────────────────────────────────────────────────
    global gpio
    gpio = GpioController()
    gpio.configure('ftdi://::/1', direction=0xFF)
    gpio.write(0x00)

    logging.info("Switching to Flash mode")
    time.sleep(2)
    switch_to_flash_mode()
    power_on_reset()

    nor_erase()
    nor_program(bootloader_core_minimal, "0x0")
    nor_program(fip_core,               "0x600000")

    logging.info("Performing POWER-ON-RESET")
    time.sleep(2)
    power_on_reset()

    emmc_erase()
    emmc_program(core_minimal_img, "0x0")
    switch_to_boot_mode()

    # ── ROS Flashing in MobaXterm ─────────────────────────────────────────────
    logging.info("Launching MobaXterm for ROS flash")
    MOBAXTERM = r"C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe"
    proc = subprocess.Popen([MOBAXTERM, "-bookmark", port])

    # wait and interact
    time.sleep(1)
    power_on_reset()
    time.sleep(30)
    pyautogui.press('enter', presses=3, interval=2)
    pyautogui.press('f2')
    time.sleep(120)

    # cleanly close MobaXterm
    logging.info("Terminating MobaXterm")
    proc.terminate()
    try:
        proc.wait(timeout=3)
    except subprocess.TimeoutExpired:
        proc.kill()
        proc.wait()

    proc_check_2 = subprocess.Popen([MOBAXTERM])
    time.sleep(5)
    proc_check_2.terminate()

    # ensure no lingering MobaXterm.exe holds COM port
    subprocess.run(
        ["taskkill", "/F", "/IM", "MobaXterm.exe"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
    )
    logging.info("Killed any stray MobaXterm instances")
    time.sleep(3)

    logging.info("MobaXterm closed, resuming flash flow")

    # ── Return to Flash mode & continue ──────────────────────────────────────
    switch_to_flash_mode()
    power_on_reset()
    power_on_reset()

    nor_erase()
    nor_program(delivered_bootloader, "0x0")
    # nor_program(mcore_bin,            "0x50000")
    nor_program(bl2_file,             "0x600000")

    logging.info("Switching back to Boot mode")
    switch_to_boot_mode()
    power_on_reset()

    # launch final serial session
    subprocess.Popen([MOBAXTERM, "-bookmark", port])
    time.sleep(1)
    power_on_reset()
    power_on_reset()

    logging.info("All done — please reboot and verify.")

if __name__ == "__main__":
    main()
