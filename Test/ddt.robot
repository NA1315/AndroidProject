*** Settings ***
Library     AppiumLibrary
Documentation   Run the DDT application and get diagnostic results/data/report  for ${id1}

Resource       ../resource.robot

*** Variables ***

*** Test Cases ***
Open DDT Application
    [Documentation]    Run the DDT application and get diagnostic results/data/report
    [Tags]   DA_03
    open application    http://127.0.0.1:4723/wd/hub     platformName=android   platformVersion=10  udid=${id1}   systemPort=8202  deviceName=TC57X  orientation=PORTRAIT  appPackage=com.symbol.selfdiagnostics  appActivity=com.symbol.selfdiagnostics.activities.MainActivity  automationName=Uiautomator2
    PORTRAIT
    Sleep  5s
    click element   id=com.android.permissioncontroller:id/permission_allow_button
    Sleep  1s
    click element   id=com.android.permissioncontroller:id/permission_allow_button
    Sleep  1s
    click element   id=com.android.permissioncontroller:id/permission_allow_button
    Sleep  1s
Bluetooth Tests
    [Documentation]    Bluetooth Tests
    click element    xpath=//android.widget.LinearLayout[4]
    Sleep  1s
    click element    id=com.symbol.selfdiagnostics:id/fab_run
    Sleep  4s
    element should contain text     xpath=//android.view.ViewGroup[2]/android.widget.TextView[2]   Test Successful
    element should contain text     xpath=//android.view.ViewGroup[3]/android.widget.TextView[2]   Functional
    element should contain text     xpath=//android.view.ViewGroup[4]/android.widget.TextView[2]   Connectable
    go back
Wifi Tests
    [Documentation]    Wifi Tests
    click element    xpath=//android.widget.LinearLayout[5]
    Sleep  1s
    click element    id=com.symbol.selfdiagnostics:id/fab_run
    Sleep  4s
    element should contain text     xpath=//android.widget.ListView/android.view.ViewGroup[1]/android.widget.TextView[2]    Valid
    element should contain text     xpath=//android.view.ViewGroup[2]/android.widget.TextView[2]        Connected
    go back
Battery Tests
    [Documentation]    Battery Tests
    click element    xpath=//android.widget.LinearLayout[6]
    sleep  1s
    click element    id=com.symbol.selfdiagnostics:id/fab_run
    Sleep  2s
    element should contain text     xpath=//android.view.ViewGroup[4]/android.widget.TextView[2]    Good
    go back
WWAN Tests
    [Documentation]    WWAN Tests
    click element   xpath=//android.widget.LinearLayout[7]
    Sleep  1s
    click element    id=com.symbol.selfdiagnostics:id/fab_run
    Sleep  2s
    element should contain text     xpath=//android.widget.ListView/android.view.ViewGroup[1]/android.widget.TextView[2]    Absent
    go back
SDCard Tests
    [Documentation]    SDCard Tests
    click element   xpath=//android.widget.LinearLayout[9]
    sleep  1s
    click element   id=com.symbol.selfdiagnostics:id/fab_run
    sleep  2s
    element should contain text     xpath=//android.widget.ListView/android.view.ViewGroup[1]/android.widget.TextView[2]    Absent
    go back
    close all applications