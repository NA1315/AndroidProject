*** Settings ***
Documentation   Capture application version from ${id}
Library     AppiumLibrary
Library     ExcelLibrary

Resource    ../resource.robot

*** Variables ***
${path}     ${EXECDIR}/appversion.xlsx


*** Test Cases ***
Open APKinfo Application
    open application    http://127.0.0.1:4723/wd/hub     platformName=android    platformVersion=10  udid=${id}  systemPort=8201  deviceName=Test  app=${EXECDIR}/analyzer.apk  appPackage=sk.styk.martin.apkanalyzer  appActivity=sk.styk.martin.apkanalyzer.ui.main.MainActivity   automationName=Uiautomator2
#    open application    http://127.0.0.1:4723/wd/hub     platformName=android    platformVersion=10  udid=10.35.207.32:5555  systemPort=8202  deviceName=TC57X  app=C:/apk-analyzer.apk    appPackage=sk.styk.martin.apkanalyzer  appActivity=sk.styk.martin.apkanalyzer.ui.main.MainActivity   automationName=Uiautomator2
    ${document}=   Create Excel Document    ${path}
    Should Be Equal As Strings    ${path}    ${document}
    open excel document     ${document}    doc_id=docid
    get sheet   Sheet1
    Sleep  5s
    PORTRAIT
    click element     id=sk.styk.martin.apkanalyzer:id/skip
    sleep   5s
Obtain Indoor App version
    [Documentation]    Capture Indoor application version
    [Tags]   DA_07
    click element    id=android:id/search_button
    sleep   5s
    input text    id=android:id/search_src_text    Indoor
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${indoor}  Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${indoor}
    write excel cell     2    2    ${number}
    save excel document    ${path}
    go back

Obtain Inflight App version
    [Documentation]    Capture Inflight application version
    [Tags]   DA_08
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Inflight
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${i}    Get Text	xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${i}
    write excel cell     3    2    ${number}
    save excel document    ${path}
    go back
Obtain Memos App version
    [Documentation]    Capture Memos application version
    [Tags]   DA_05
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Memos
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${e}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${e}
    write excel cell     4   2    ${number}
    save excel document    ${path}
    go back
Obtain My Dashboard App version
    [Documentation]        Capture My Dashboard application version
    [Tags]   DA_06
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    My Dashboard
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${d}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${d}
    write excel cell     5    2    ${number}
    save excel document    ${path}
    go back
Obtain Mylinks App version
    [Documentation]     Capture Mylinks application version
    [Tags]   DA_10
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    My Links
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${m}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${m}
    write excel cell     6    2    ${number}
    save excel document    ${path}
    go back
Obtain Navigation App version
    [Documentation]  Capture Navigation application version
    [Tags]   DA_02
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    com.royalmail.navigation
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${n}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${n}
    write excel cell    7    2    ${number}
    save excel document    ${path}
    go back
Obtain OutDoor Actuals App version
    [Documentation]   Capture Outdoor Actuals application version
    [Tags]   DA_11
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Outdoor Actuals
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${a}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${a}
    write excel cell     8    2    ${number}
    save excel document    ${path}
    go back
Obtain PDA Frontline App version
    [Documentation]   Capture PDA Frontline application version
    [Tags]   DA_12
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    PDA Frontline
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${f}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${f}
    write excel cell     9    2    ${number}
    save excel document    ${path}
    go back
Obtain Phonebook App version
    [Documentation]   Capture Phonebook application version
    [Tags]   DA_13
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    PhoneBook
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${p}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${p}
    write excel cell     10    2    ${number}
    save excel document    ${path}
    go back
Obtain RM Outdoor App version
    [Documentation]   Capture RM Outdoor application version
    [Tags]   DA_14
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    RM Outdoor
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${o}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${o}
    write excel cell     11    2    ${number}
    save excel document    ${path}
    go back
Obtain RM WatchAndWin App version
    [Documentation]    Capture RM Watch And Win application version
    [Tags]   DA_15
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    RM WatchAndWin
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${w}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${w}
    write excel cell     12    2    ${number}
    save excel document    ${path}
    go back
Obtain RO+N App version
    [Documentation]   Capture RO+N application version
    [Tags]   DA_16
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    RO+N
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${r}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${r}
    write excel cell     13    2    ${number}
    save excel document    ${path}
    go back
Obtain Scan In Scan Out App version
    [Documentation]   Capture SSO application version
    [Tags]   DA_17
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Scan In Scan Out
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${s}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${s}
    write excel cell     14    2    ${number}
    save excel document    ${path}
    go back
Obtain Traffic Recording App version
    [Documentation]  Capture Traffic Recording application version
    [Tags]   DA_18
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Traffic Recording App
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  2s
    ${t}    Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${t}
    write excel cell     15    2    ${number}
    save excel document    ${path}
    go back
Obtain Vehicle Check App version
    [Documentation]   Capture Vehicle Check application version
    [Tags]   DA_04
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Vehicle Check
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  1s
    ${v}   Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    ${number}  convert to number   ${v}
    write excel cell     16    2    ${number}
    save excel document    ${path}
    go back
Obtain emScript App version
    [Documentation]   Capture emScript application version
    [Tags]
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    emScript
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  1s
    ${em}   Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    write excel cell     17    2    ${em}
    save excel document    ${path}
    go back

Obtain PH_Plugin App version
    [Documentation]   Capture PH_Plugin application version
    [Tags]
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    PH Plugin
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  1s
    ${ph}   Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    write excel cell     18    2    ${ph}
    save excel document    ${path}
    go back
Obtain Zebra Data Service App version
    [Documentation]   Capture Zebra Data Service application version
    [Tags]
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Zebra Data Service
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  1s
    ${ph}   Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    write excel cell     19    2    ${ph}
    save excel document    ${path}
    go back
Obtain Zebra Data Service Plugin App version
    [Documentation]   Capture Zebra Data Service application version
    [Tags]
    click element    id=android:id/search_button
    sleep   2s
    clear text    id=android:id/search_src_text
    sleep   1s
    input text    id=android:id/search_src_text    Zebra Data Service Plugin
    click element   id=sk.styk.martin.apkanalyzer:id/package_name
    Sleep  1s
    ${ph}   Get Text	  xpath=//android.widget.LinearLayout[4]/android.widget.TextView[2]
    write excel cell     20    2    ${ph}
    save excel document    ${path}
    go back
Remove App
    remove application     sk.styk.martin.apkanalyzer
    Close All Excel Documents