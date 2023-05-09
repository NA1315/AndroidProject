cd C:\Users\Testing_Lab\PycharmProjects\AndroidProject\Test
python -m robot appVersion.robot
python compare.py
python -m  robot --outputdir  C:\Users\Testing_Lab\Desktop\Automation_Report --report "appVersion"  --timestampoutputs  updateVersion.robot
@echo off
Exit