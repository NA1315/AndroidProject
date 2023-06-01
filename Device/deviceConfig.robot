*** Settings ***
Documentation   Device Configure for ${id}
Library     AppiumLibrary
Library     ExcelLibrary
Resource       ../resource.robot

*** Variables ***
${path}      ${EXECDIR}/deviceConfig_B.xlsx

*** Test Cases ***
Open Setting Application
    open application    http://127.0.0.1:4723/wd/hub     platformName=android    platformVersion=10  udid=${id}  systemPort=8201  deviceName=Test  appPackage=com.android.settings  appActivity=com.android.settings.homepage.SettingsHomepageActivity    automationName=Uiautomator2
    ${document}=   Create Excel Document    ${path}
    Should Be Equal As Strings    ${path}    ${document}
    open excel document     ${document}    doc_id=doc2
    PORTRAIT
Search About Phone in Setting section
    [Documentation]    Search About phone in setting section
    [Tags]   DC_01
    click element    id=com.android.settings:id/search_action_bar_title
    sleep   1s
    input text     id=android:id/search_src_text        About phone
    sleep   4s
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.LinearLayout/android.widget.TextView[1]
    sleep  3s
Device Name
    [Documentation]    Verify device name
    [Tags]   DC_02
    ${name}   get text    xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView[2]
    write excel cell     1    2    ${name}
    save excel document    ${path}
Model And Hardware
    [Documentation]    Verify Model & Hardware
    [Tags]   DC_03
    sleep  2s
    click element   xpath=//android.view.ViewGroup/android.widget.LinearLayout/android.widget.TextView
    sleep  1s
    input text    id=android:id/search_src_text     Model & hardware
    Sleep  1s
    click element   id=android:id/title
    sleep  1s
    ${model}    get text     xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView[2]
    write excel cell     2    2    ${model}
    save excel document    ${path}
    sleep  1s
    ${hardware}   get text     xpath=//android.widget.LinearLayout[2]//android.widget.TextView[2]
    write excel cell     3    2    ${hardware}
    save excel document    ${path}
    go back
Check IMEI
    [Documentation]    Verify IMEI Number
    [Tags]   DC_04
    input text    id=android:id/search_src_text     IMEI
    click element    id=android:id/title
    sleep  1s
    ${IMEI}     get text     xpath=//android.widget.LinearLayout[8]//android.widget.TextView[2]
    write excel cell     4    2    ${IMEI}
    save excel document    ${path}
Check Android Version
    [Documentation]    Verify Android Version
    [Tags]   DC_04
    sleep  2s
    click element    xpath=//android.widget.LinearLayout/android.widget.TextView
    Sleep   1s
    input text     id=android:id/search_src_text        Android version
    Sleep  1s
    click element   id=android:id/title
    sleep  1s
    ${Version}    get text    xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView[2]
    write excel cell     5    2    ${Version}
    save excel document    ${path}
    press keycode     3
    Close All Excel Documents
