import subprocess
import json

with open('config.json') as user_file:
    data = json.load(user_file)
print(data)

batteryBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/battery.bat"
appversionBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/appVersion.bat"
deviceConfigBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/deviceConfig.bat"
ddtBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/ddt.bat"
utilityFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/utility.bat"
updateExcelFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/reference_file.bat"
appVeradbBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/appVeradb.bat"


print("-------------------------\nGlobal parameters:\n-------------------------")
# run through the "Global" parameters
for item in data['Global']:
    print(item + ":" + data['Global'][item])
print("\n-------------------------\nTest Cases to run\n-------------------------")

for item in data['TestCase']:
    # Run the Battery Test n times
    if item == "BatteryTestRepeat" and data['TestCase']['BatteryTest'] == "True":
        print("\tBattery Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Battery Test: " + str(n+1))
            subprocess.call(batteryBatFileLocation)

    # Run the Utility Test n times
    if item == "UtilityTestRepeat" and data['TestCase']['UtilityTest'] == "True":
        print("\tUtility Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Battery Test: " + str(n + 1))
            subprocess.call(utilityFileLocation)

    # Run the Ddt Test n times
    if item == "DdtTestRepeat" and data['TestCase']['DdtTest'] == "True":
        print("\tDdt Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Battery Test: " + str(n + 1))
            subprocess.call(ddtBatFileLocation)

    # Run the Device config Test n times
    if item == "DeviceConfigTestRepeat" and data['TestCase']['DeviceConfigTest'] == "True":
        print("\tDevice Config Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Utility Test: " + str(n+1))
            subprocess.call(deviceConfigBatFileLocation)

    # Run the Apk Test n times
    if item == "ApkTestRepeat" and data['TestCase']['ApkTest'] == "True":
        print("\tApk Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Apk Test: " + str(n+1))
            subprocess.call(appversionBatFileLocation)

    # Run the Apk Test Method n times
    if item == "ApkADBTestRepeat" and data['TestCase']['ApkADBTest'] == "True":
        print("\tApk ADB Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Apk ADB Test: " + str(n + 1))
            subprocess.call(appVeradbBatFileLocation)
