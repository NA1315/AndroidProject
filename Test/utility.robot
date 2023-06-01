*** Settings ***
Documentation   Check utility service for ${id1}
Library     AppiumLibrary
Library    BuiltIn
Library    Collections
Library    ExcelLibrary

Resource       ../resource.robot

*** Variables ***
${path}      ${EXECDIR}/reference.xlsx


*** Test Cases ***
Open Excel File
    Sleep  1s
    open excel document   ${path}    doc_id=Sheet2
    get sheet    Sheet2
    Sleep  2s
Check Brightness level
    [Documentation]    Capture Brightness Level
    [Tags]     UC_01
    open application    http://127.0.0.1:4723/wd/hub   platformName=android    platformVersion=10   udid=${id1}   systemPort=8201   deviceName=TC57X   appPackage=com.android.settings  appActivity=com.android.settings.homepage.SettingsHomepageActivity   automationName=Uiautomator2
    click element    id=com.android.settings:id/search_action_bar_title
    sleep   1s
    input text     id=android:id/search_src_text      Brightness level
    sleep   2s
    click element     xpath=//android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView[1]
    sleep  2s
    ${rd}   get text    xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView[2]
    ${a}=   Read Excel Cell     2      6
    ${item}    Set Variable    ${a}%
    Run Keyword if   '${rd}' == '${item}'     Pass Test
    ...  ELSE     Fail Test
    sleep  2s

Check RMG Wifi SSID present
    [Documentation]    Capture RMG Wifi SSID present
    [Tags]     UC_0
    click element    xpath=//android.widget.LinearLayout/android.widget.TextView
    Sleep   2s
    input text     id=android:id/search_src_text       Network and Internet
    Sleep   2s
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView[1]
    Sleep   2s
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView[1]
    sleep  5s
    ${swipe_count}=    Set Variable    3
    FOR   ${i}  IN RANGE    ${swipe_count}
        Swipe   300  1291  500  100
    END
    click element  xpath=//android.widget.LinearLayout[7]/android.widget.RelativeLayout/android.widget.TextView[1]
    sleep   2s
    ${get}    get text    xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView[1]
    ${sp}=   Read Excel Cell     12      6
    ${item1}    Set Variable     ${get}
    Run Keyword if   '${get}' == '${item1}'     Pass Test
    ...  ELSE     Fail Test

Check Battery life
    [Documentation]    Capture Battery Life
    [Tags]     UC_02
    click element    xpath=//android.widget.LinearLayout/android.widget.TextView
    Sleep   2s
    input text     id=android:id/search_src_text       Battery
    Sleep   2s
    click element    xpath=//android.widget.LinearLayout[3]//android.widget.TextView[1]
    Sleep   2s
    ${r}     get text     id=com.android.settings:id/battery_percent
    ${b}=   Read Excel Cell     3      6
    ${item1}    Set Variable     ${b} %
    Run Keyword if   '${r}' == '${item1}'     Pass Test
    ...  ELSE     Fail Test


Check Virtual Keyboard
    [Documentation]    Capture Virtual Keyboard
    [Tags]     UC_03
    click element    xpath=//android.view.ViewGroup/android.widget.LinearLayout/android.widget.TextView
    sleep  2s
    input text    id=android:id/search_src_text      Virtual
    sleep  2s
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView[2]
    sleep  2s
    ${v}     get text    xpath=//android.widget.LinearLayout[3]//android.widget.TextView[2]
    ${c}=   Read Excel Cell     4      6
    ${item2}    Set Variable    ${c}
    Run Keyword if   '${v}' == '${item2}'     Pass Test
    ...  ELSE     Fail Test

Check Internal Memory
    [Documentation]     Capture Internal Memory
    [Tags]     UC_04
    click element    xpath=//android.view.ViewGroup/android.widget.LinearLayout/android.widget.TextView
    sleep  2s
    input text    id=android:id/search_src_text      Storage
    sleep  2s
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView[1]
    sleep  2s
    ${i}     get text    xpath=//android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView[1]
    ${d}=   Read Excel Cell     5      6
    ${item2}    Set Variable    ${d} GB
    Run Keyword if   '${i}' < '${item2}'     Pass Test
    ...  ELSE     Fail Test
    should be equal  	  ${i}      ${item2}

Check Adaptive brightness
    [Documentation]     Capture Adative brightness
    [Tags]     UC_05
    click element    xpath=//android.view.ViewGroup/android.widget.LinearLayout/android.widget.TextView
    sleep  2s
    input text    id=android:id/search_src_text      Adaptive
    sleep  2s
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView[1]
    sleep  2s
    ${rd}   get text    xpath=//android.widget.LinearLayout[3]/android.widget.RelativeLayout/android.widget.TextView[2]
    ${ad}=   Read Excel Cell     7      6
    ${item2}    Set Variable    ${ad}
    Run Keyword if   '${ad}' == '${item2}'     Pass Test
    ...  ELSE     Fail Test

Check Display Timeout
    [Documentation]     Capture Display Timeout
    [Tags]     UC_06
    click element    xpath=//android.view.ViewGroup/android.widget.LinearLayout/android.widget.TextView
    sleep  2s
    input text    id=android:id/search_src_text      Timeout
    sleep  2s
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView[1]
    sleep  2s
    ${rd}   get text    xpath=//android.widget.LinearLayout[6]/android.widget.RelativeLayout/android.widget.TextView[2]
    ${dt}=   Read Excel Cell     8      6
    ${item2}    Set Variable    ${dt}
    Run Keyword if   '${dt}' == '${item2}'     Pass Test
    ...  ELSE     Fail Test

Disable Bluetooth
    Execute Adb Shell    settings put global bluetooth_on 0
    ${bluetooth_on}=    Execute Adb Shell    settings get global bluetooth_on
    ${db}=   Read Excel Cell     6      6
    ${item2}    Set Variable    ${db}
    should be equal as integers	  ${bluetooth_on}      ${item2}
    Pass Test
    Fail Test

Disable NFC
    Execute Adb Shell    svc nfc disable
    Execute Adb Shell    settings put global nfc 0
    ${nfc}=    Execute Adb Shell    settings get global nfc
    ${n}=   Read Excel Cell     11      6
    ${item2}    Set Variable    ${n}
    should be equal as integers	  ${nfc}    ${item2}
    Pass Test
    Fail Test

Get NTP server
    ${ntp}=   Execute Adb Shell    settings get global ntp_server
    ${n}=   Read Excel Cell     7      6
    ${item2}    Set Variable    ${n}
    should be equal as strings	  ${n}      ${item2}
    Pass Test
    Fail Test

Captive Portal Detection
    Execute Adb Shell    settings put global captive_portal_mode 0
    ${captive}=    Execute Adb Shell    settings get global captive_portal_mode
    ${cp}=   Read Excel Cell     10      6
    ${item2}    Set Variable    ${cp}
    should be equal as integers	  ${captive}      ${item2}
    Pass Test
    Fail Test
    press keycode   3
    close all excel documents


*** Keywords ***
Pass Test
    pass execution    *HTML*<h4 style="color:Green;"> Same as reference file</h4>
Fail Test
    fail    *HTML*<h4 style="color:Red;"> Mismatch with reference file</h4>
