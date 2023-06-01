*** Settings ***
Documentation   Capture application version from ${id1}
Library     AppiumLibrary
Library     OperatingSystem
Library     ExcelLibrary
Library     Process

Resource    ../resource.robot

*** Variables ***
${path}       ${EXECDIR}/appversion_A.xlsx


*** Test Cases ***
Open Excel File
    Sleep  1s
    open excel document   ${path}    doc_id=Sheet2
    get sheet   Sheet2
    Sleep  2s
Capture all app version
    open application
    ...  http://127.0.0.1:4723/wd/hub
    ...  platformName=android
    ...  platformVersion=10
    ...  udid=${id1}
    ...  deviceName=TC57X
    ...  appPackage=com.android.settings
    ...  appActivity=com.android.settings.homepage.SettingsHomepageActivity
    ...  automationName=Uiautomator2
    sleep   2s
    ${em}    Run   adb -s ${id1} shell dumpsys package com.zebra.emscript | findstr versionName
    write excel cell     2    2    ${em}
    save excel document    ${path}
    ${phl}    Run   adb -s ${id1} shell dumpsys package com.zebra.emscript.ph_plugin | findstr versionName
    write excel cell     3    2    ${phl}
    save excel document    ${path}
    ${in}    Run   adb -s ${id1} shell dumpsys package com.royalmail.indoor | findstr versionName
    write excel cell     4    2    ${in}
    save excel document    ${path}
    ${inf}    Run   adb -s ${id1} shell dumpsys package com.royalmail.inflight | findstr versionName
    write excel cell     5    2    ${inf}
    save excel document    ${path}
    ${m}    Run   adb -s ${id1} shell dumpsys package com.royalmail.memo | findstr versionName
    write excel cell     6    2    ${m}
    save excel document    ${path}
    ${my}    Run   adb -s ${id1} shell dumpsys package com.royalmail.mydashboard | findstr versionName
    write excel cell     7    2    ${my}
    save excel document    ${path}
    ${ex}    Run   adb -s ${id1} shell dumpsys package com.royalmail.externallink | findstr versionName
    write excel cell     8    2    ${ex}
    save excel document    ${path}
    ${nv}    Run   adb -s ${id1} shell dumpsys package com.royalmail.navigation | findstr versionName
    write excel cell     9    2    ${nv}
    save excel document    ${path}
    ${oa}    Run   adb -s ${id1} shell dumpsys package com.royalmail.oa | findstr versionName
    write excel cell     10    2    ${oa}
    save excel document    ${path}
    ${ss}    Run   adb -s ${id1} shell dumpsys package com.royalmail.sso | findstr versionName
    write excel cell     11    2    ${ss}
    save excel document    ${path}
    ${ph}    Run   adb -s ${id1} shell dumpsys package com.royalmail.phonebook | findstr versionName
    write excel cell     12    2    ${ph}
    save excel document    ${path}
    ${ou}    Run   adb -s ${id1} shell dumpsys package com.royalmail.outdoor | findstr versionName
    write excel cell     13    2    ${ou}
    save excel document    ${path}
    ${wa}    Run   adb -s ${id1} shell dumpsys package com.royalmail.watchandwin | findstr versionName
    write excel cell     14    2    ${wa}
    save excel document    ${path}
    ${ro}    Run   adb -s ${id1} shell dumpsys package com.royalmail.ron | findstr versionName
    write excel cell     15    2    ${ro}
    save excel document    ${path}
    ${ho}    Run   adb -s ${id1} shell dumpsys package com.royalmail.hourscapture | findstr versionName
    write excel cell     16    2    ${ho}
    save excel document    ${path}
    ${tm}    Run   adb -s ${id1} shell dumpsys package com.royalmail.tma | findstr versionName
    write excel cell     17    2    ${tm}
    save excel document    ${path}
    ${ve}    Run   adb -s ${id1} shell dumpsys package com.royalmail.vehiclecheck | findstr versionName
    write excel cell     18    2    ${ve}
    save excel document    ${path}
    ${da}    Run   adb -s ${id1} shell dumpsys package com.symbol.dataanalytics | findstr versionName
    write excel cell     19    2    ${da}
    save excel document    ${path}
    ${dc}    Run   adb -s ${id1} shell dumpsys package com.symbol.dataanalytics.dca | findstr versionName
    write excel cell     20    2    ${dc}
    save excel document    ${path}
    press keycode   3
    close all excel documents






