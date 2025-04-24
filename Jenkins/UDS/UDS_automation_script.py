from py_canoe import CANoe
import os
from time import sleep as wait

# Step 1: Kill existing CANoe
os.system("taskkill /f /im canoe64.exe")
wait(5)

# Step 2: Start CANoe
canoe_inst = CANoe()
wait(10)

# Step 3: Open config
canoe_inst.open(r'D:\Jenkins\workspace\MCore_Vector_AutoTest\M_Core\UDS\UDS_Configuration.cfg')
wait(10)

# Step 4: Start Measurement
print("Starting measurement...")
canoe_inst.start_measurement()

# Step 5: Wait for CAPL event completion
print("Waiting for CAPL to finish...")

timeout = 120  # max wait time in seconds
elapsed = 0

while elapsed < timeout:
    capl_status = canoe_inst.get_env_var("testDone")
    if capl_status == 1:
        print("CAPL script finished successfully.")
        break
    wait(1)
    elapsed += 1
else:
    print("Timeout: CAPL did not finish in expected time.")

# Step 6: Stop and close
canoe_inst.stop_measurement()
canoe_inst.quit()
print("CANoe closed.")
