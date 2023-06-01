*** Settings ***
Library     AppiumLibrary
Library     ExcelLibrary

Documentation   Obtain version and refernce version compare then generate status For ${id}
Resource       ../resource.robot

*** Variables ***
${path}      ${EXECDIR}/deviceConfig_B.xlsx


*** Test Cases ***
Open excel file
    ${document}=   Create Excel Document    ${path}
    Should Be Equal As Strings    ${path}    ${document}
    open excel document     ${document}    doc_id=doc2
Open Battery Manager Application
    open application
    ...  http://127.0.0.1:4723/wd/hub
    ...  platformName=android
    ...  platformVersion=10
    ...  udid=${id}
    ...  deviceName=TC57X
    ...  orientation=PORTRAIT
    ...  appPackage=com.symbol.batterymanager
    ...  appActivity=com.symbol.batterymanager.ui.SplashActivity
    ...  utomationName=Uiautomator2
    Sleep  1s
Landed on Information tab
    [Documentation]    Run Battery Management application and check function
    [Tags]   DA_01
    element should contain text     xpath=//android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/androidx.viewpager.widget.ViewPager[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.ListView[1]/android.widget.RelativeLayout[1]/android.widget.TextView[2]   Battery present
    Sleep  1s
Capture battery level
    ${r}   get text   xpath=//android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/androidx.viewpager.widget.ViewPager[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.ListView[1]/android.widget.RelativeLayout[3]/android.widget.TextView[2]
    sleep   1s
    write excel cell     6    2    ${r}
    save excel document    ${path}
Capture battery temperature
    execute adb shell   input swipe 365  800  365  100
    sleep  3s
    ${r}  get text   xpath=//android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/androidx.viewpager.widget.ViewPager[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.ListView[1]/android.widget.RelativeLayout[5]/android.widget.TextView[2]
    write excel cell     7    2    ${r}
    save excel document    ${path}
Capture battery serial number
    ${d}  get text   xpath=//android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/androidx.viewpager.widget.ViewPager[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.ListView[1]/android.widget.RelativeLayout[8]/android.widget.TextView[2]
    write excel cell     8    2    ${d}
    save excel document    ${path}
Capture battery manufacture date
    ${rd}  get text   xpath=//android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/androidx.viewpager.widget.ViewPager[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.ListView[1]/android.widget.RelativeLayout[9]/android.widget.TextView[2]
    write excel cell     9    2    ${rd}
    save excel document    ${path}
    press keycode   3
    close all excel documents
    close all applications

