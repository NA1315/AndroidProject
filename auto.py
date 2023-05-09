import os
import time
# os.startfile("C:/Users/na1315/PycharmProjects/AndroidProject/appVersion.bat")
# fp = open(r'C:\Users\na1315\PycharmProjects\AndroidProject\appVersion.bat', 'r')
# os.chdir("C:/Program Files/Python310/python.exe")
# os.chdir("C:/Users/na1315/PycharmProjects/AndroidProject/appVersion.bat")

os.chdir("C:/Users/na1315/PycharmProjects/AndroidProject")
os.startfile("battery.bat")
time.sleep(10)
os.chdir("C:/Users/na1315/PycharmProjects/AndroidProject/Test")
os.startfile("report.html")