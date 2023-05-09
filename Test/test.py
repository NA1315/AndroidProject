import subprocess

batteryBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_A_Bat/battery.bat"
appversionBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_A_Bat/appVersion.bat"
deviceConfigBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_A_Bat/deviceConfig.bat"
ddtBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_A_Bat/ddt.bat"
utilityFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_A_Bat/utility.bat"
updateExcelFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_A_Bat/reference_file.bat"
appVeradbBatFileLocation = r"C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_A_Bat/appVeradb.bat"

def switch(number):
    dicts = {
        '1': batteryBatFileLocation,
        '2': appversionBatFileLocation,
        '3': appVeradbBatFileLocation,
        '4': deviceConfigBatFileLocation,
        '5': ddtBatFileLocation,
        '6': utilityFileLocation,
        '7': updateExcelFileLocation
    }
    return dicts.get(number, 'Consonant')


printText = """
press 1 for Battery app
press 2 for App Version
press 3 for App Version ADB
press 4 for Device Config
press 5 for DDT
press 6 for Utility
press 7 for Reference File
"""
print(printText)

number = input('Enter an number to open: ')

subprocess.call([switch(number)])
