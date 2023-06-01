*** Settings ***
Documentation   Check File transfer from ${id}

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
    ...  udid=${id}
    ...  deviceName=TC57X
    ...  appPackage=com.android.settings
    ...  appActivity=com.android.settings.homepage.SettingsHomepageActivity
    ...  automationName=Uiautomator2
   sleep   1s
   ${output}  Run   adb -s ${id} shell ls /sdcard/SWD-FT
   Log    ${output}
   press keycode   3

