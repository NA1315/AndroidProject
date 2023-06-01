import subprocess
import json

from robot import rebot

with open('config.json') as user_file:
    data = json.load(user_file)
print(data)

print("\n-------------------------\nTest Cases to run\n-------------------------")

test_case_to_merge = []

for item in data['TestCase']:
    # Run the Battery Test n times
    if item == "BatteryTestRepeat" and data['TestCase']['BatteryTest'] == "True":
        print("\tBattery Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Battery Test: " + str(n + 1))
            for gitem in data['Global']:
                if gitem == "batteryBatFileLocation":
                    print(str(data['Global'][gitem]))
                    subprocess.call(data['Global'][gitem])
                    test_case_to_merge.append("battery.xml")

    # Run the Utility Test n times
    if item == "UtilityTestRepeat" and data['TestCase']['UtilityTest'] == "True":
        print("\tUtility Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Battery Test: " + str(n + 1))
            for gitem in data['Global']:
                if gitem == "utilityFileLocation":
                    print(str(data['Global'][gitem]))
                    subprocess.call(data['Global'][gitem])
                    test_case_to_merge.append("utility.xml")

    # Run the Ddt Test n times
    if item == "DdtTestRepeat" and data['TestCase']['DdtTest'] == "True":
        print("\tDdt Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Battery Test: " + str(n + 1))
            for gitem in data['Global']:
                if gitem == "ddtBatFileLocation":
                    print(str(data['Global'][gitem]))
                    subprocess.call(data['Global'][gitem])
                    test_case_to_merge.append("ddt.xml")

    # Run the Device config Test n times
    if item == "DeviceConfigTestRepeat" and data['TestCase']['DeviceConfigTest'] == "True":
        print("\tDevice Config Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Utility Test: " + str(n + 1))
            for gitem in data['Global']:
                if gitem == "deviceConfigBatFileLocation":
                    print(str(data['Global'][gitem]))
                    subprocess.call(data['Global'][gitem])
                    test_case_to_merge.append("deviceConfig.xml")

    # Run the Apk Test n times
    if item == "ApkTestRepeat" and data['TestCase']['ApkTest'] == "True":
        print("\tApk Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Apk Test: " + str(n + 1))
            for gitem in data['Global']:
                if gitem == "appversionBatFileLocation":
                    print(str(data['Global'][gitem]))
                    subprocess.call(data['Global'][gitem])
                    test_case_to_merge.append("appVersion.xml")

    # Run the Apk Test Method n times
    if item == "ApkADBTestRepeat" and data['TestCase']['ApkADBTest'] == "True":
        print("\tApk ADB Test to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running Apk ADB Test: " + str(n + 1))
            for gitem in data['Global']:
                if gitem == "appVeradbBatFileLocation":
                    print(str(data['Global'][gitem]))
                    subprocess.call(data['Global'][gitem])
                    test_case_to_merge.append("appVer.xml")

    # Run the FT Test Method n times
    if item == "FTTestRepeat" and data['TestCase']['FTTest'] == "True":
        print("\tApk FT to repeat: " + data['TestCase'][item])
        for n in range(int(data['TestCase'][item])):
            print("\t\t...running FT Test: " + str(n + 1))
            for gitem in data['Global']:
                if gitem == "ftBatFileLocation":
                    print(str(data['Global'][gitem]))
                    subprocess.call(data['Global'][gitem])
                    test_case_to_merge.append("ft.xml")



print("\n-------------------------\nMerging Test Results\n-------------------------")
# Perform the merging of test results here
merged_results = "\n".join(test_case_to_merge)
print("Merged Test Results:\n" + merged_results)

if test_case_to_merge:
    # Prepare the list of report files to merge
    # [appVer, appVersion, battery, ddt, deviceConfig, ft, utility]
    report_files = test_case_to_merge   #["appVer.xml", "battery.xml", "appVersion.xml"]

    # Specify the output file path for the merged report
    output_file = "RMG_Reporting.html"

    # Use subprocess to run the rebot command for merging reports
    subprocess.run(
        ["rebot", "--name", "RMG_Reporting", "--timestampoutputs", "--outputdir", "C:\\Users\\Testing_Lab\\Desktop\\Automation_Report",
         "--report", output_file] + report_files)
    print("Report generated successfully.")
else:
    print("No test cases to merge. Report generation skipped.")
