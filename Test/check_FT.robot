*** Settings ***
Documentation   Check File transfer from ${id1}

Library     AppiumLibrary
Library     OperatingSystem
Library     Process

Resource    ../resource.robot



*** Test Cases ***
Open_Application
    open application
    ...  http://127.0.0.1:4723/wd/hub
    ...  platformName=android
    ...  platformVersion=10
    ...  udid=${id1}
    ...  deviceName=TC57X
    ...  appPackage=com.android.settings
    ...  appActivity=com.android.settings.homepage.SettingsHomepageActivity
    ...  automationName=Uiautomator2
   sleep   1s
   ${output}  Run   adb -s ${id1} shell ls /sdcard/SWD-FT
   Log    ${output}
   press keycode   3

