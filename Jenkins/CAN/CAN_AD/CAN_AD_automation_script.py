import os
from time import sleep as wait
import win32com.client

print("Starting CANoe...Ignore below 'ERROR' if comes as this is due to if canoe is not already open")
# Step 1: Kill existing CANoe
os.system("taskkill /f /im canoe64.exe")
wait(5)

# Step 2: Start CANoe via COM
canoe_app = win32com.client.Dispatch("CANoe.Application")
wait(5)

# Step 3: Open CANoe configuration
cfg_path = r'D:\Jenkins\workspace\CGVCU_BSW_Mcore\M_Core\CAN\CAN_AD\CAN_AD_Configuration.cfg'
print(f"Opening configuration: {cfg_path}")
canoe_app.Open(cfg_path)
wait(10)

# Step 4: Start measurement
print("Starting measurement...")
canoe_app.Measurement.Start()

# Step 5: Wait for CAPL to complete via system variable
print("Waiting for CAPL completion (TestAutomation.TestDone)...")
test_env = canoe_app.System.Namespaces("TestAutomation")
test_done_var = test_env.Variables("TestDone")

# Wait until system variable is set to 1 by CAPL
timeout_sec = 240
elapsed = 0
while test_done_var.Value != 1 and elapsed < timeout_sec:
    wait(1)
    elapsed += 1

if test_done_var.Value == 1:
    print("CAPL execution completed.")
    exit_code = 0
else:
    print("Timeout: CAPL did not finish in time.")
    exit_code = 1

# Step 6: Stop measurement and close CANoe
print("Stopping measurement...")
canoe_app.Measurement.Stop()
wait(5)
print("Closing CANoe...")
canoe_app.Quit()
print("Automation complete.")
