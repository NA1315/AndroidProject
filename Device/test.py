import subprocess

batteryBatFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/battery.bat"
appversionBatFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/appVersion.bat"
deviceConfigBatFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/deviceConfig.bat"
ddtBatFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/ddt.bat"
utilityFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/utility.bat"
updateExcelFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/reference_file.bat"
appVeradbBatFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/appVeradb.bat"
ftBatFileLocation = "C:/Users/Testing_Lab/PycharmProjects/AndroidProject/Device_B_Bat/ft.bat"

def switch(number):
    dicts = {
        '1': batteryBatFileLocation,
        '2': appversionBatFileLocation,
        '3': appVeradbBatFileLocation,
        '4': deviceConfigBatFileLocation,
        '5': ddtBatFileLocation,
        '6': utilityFileLocation,
        '7': ftBatFileLocation,
        '8': updateExcelFileLocation
    }
    return dicts.get(number, 'Consonant')


printText = """
press 1 for Battery app
press 2 for App Version
press 3 for App Version ADB
press 4 for Device Config
press 5 for DDT
press 6 for Utility
press 7 for FT
press 8 for Reference File
"""
print(printText)

number = input('Enter an number to open: ')

subprocess.call([switch(number)])
