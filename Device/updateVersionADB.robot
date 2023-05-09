*** Settings ***
Documentation   Obtain version via adb and refernce version compare then generate status For ${id}
Library    SeleniumLibrary
Library    ExcelLibrary

Resource    ../resource.robot
*** Variables ***
${path}      /Users/Testing_Lab/PycharmProjects/AndroidProject/Device/adb.xlsx

*** Test Cases ***
Open Excel File
    Sleep  2s
    open excel document   ${path}    doc_id=docid1

Check Status of emScript APK
    [Documentation]    Check emScript application and validate correct version
    [Tags]   DA_07
    ${rd}=   Read Excel Cell     2      4
    Run Keyword if   '${rd}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test

Check Status of ph_plugin APK
    [Documentation]    Check ph_plugin application and validate correct version
    [Tags]   DA_08
    ${rd1}=   Read Excel Cell     3      4
    Run Keyword if   '${rd1}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test

Check Status of indoor APK
    [Documentation]    Check indoor application and validate correct version
    [Tags]   DA_05
    ${rd2}=   Read Excel Cell     4      4
    Run Keyword if   '${rd2}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test

Check Status of inflight APK
    [Documentation]        Check inflight application and validate correct version
    [Tags]   DA_06
    ${rd2}=   Read Excel Cell     5      4
    Run Keyword if   '${rd2}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test

Check Status of memo APK
    [Documentation]     Check memo application and validate correct version
    [Tags]   DA_10
    ${rd3}=   Read Excel Cell     6      4
    Run Keyword if   '${rd3}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of mydashboard APK
    [Documentation]  Check mydashboard application and validate correct version
    [Tags]   DA_02
    ${rd4}=   Read Excel Cell     7      4
    Run Keyword if   '${rd4}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of externallink APK
    [Documentation]   Check externallink application and validate correct version
    [Tags]   DA_11
    ${rd5}=   Read Excel Cell     8      4
    Run Keyword if   '${rd5}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of navigation APK
    [Documentation]   Check navigation application and validate correct version
    [Tags]   DA_12
    ${rd6}=   Read Excel Cell     9      4
    Run Keyword if   '${rd6}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of oa APK
    [Documentation]   Check oa application and validate correct version
    [Tags]   DA_13
    ${rd7}=   Read Excel Cell     10      4
    Run Keyword if   '${rd7}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of sso APK
    [Documentation]   Check sso application and validate correct version
    [Tags]   DA_14
    ${rd8}=   Read Excel Cell     11      4
    Run Keyword if   '${rd8}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of phonebook APK
    [Documentation]    Check phonebook application and validate correct version
    [Tags]   DA_15
    ${rd9}=   Read Excel Cell     12      4
    Run Keyword if   '${rd9}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of outdoor APK
    [Documentation]   Check outdoor application and validate correct version
    [Tags]   DA_16
    ${rd10}=   Read Excel Cell     13      4
    Run Keyword if   '${rd10}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of watchandwin APK
    [Documentation]   Check watchandwin application and validate correct version
    [Tags]   DA_17
    ${rd11}=   Read Excel Cell     14      4
    Run Keyword if   '${rd11}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of ron APK
    [Documentation]  Check ron application and validate correct version
    [Tags]   DA_18
    ${rd12}=   Read Excel Cell     15      4
    Run Keyword if   '${rd12}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of hourscapture APK
    [Documentation]   Check hourscapture application and validate correct version
    [Tags]   DA_04
    ${rd13}=   Read Excel Cell     16      4
    Run Keyword if   '${rd13}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of tma APK
    [Documentation]   Check tma application and validate correct version
    [Tags]   DA_04
    ${rd14}=   Read Excel Cell     17      4
    Run Keyword if   '${rd14}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of vehiclecheck APK
    [Documentation]   Check vehiclecheck application and validate correct version
    [Tags]   DA_04
    ${rd15}=   Read Excel Cell     18      4
    Run Keyword if   '${rd15}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of zebra data service APK
    [Documentation]   Check zebra data service application and validate correct version
    [Tags]   DA_04
    ${rd16}=   Read Excel Cell     19      4
    Run Keyword if   '${rd16}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
Check Status of zebra data service plugin APK
    [Documentation]   Check zebra data service plugin application and validate correct version
    [Tags]   DA_04
    ${rd17}=   Read Excel Cell     20      4
    Run Keyword if   '${rd17}' == 'Not Changed'     Pass Test
    ...  ELSE     Fail Test
    Close All Excel Documents


*** Keywords ***
Pass Test
    pass execution    *HTML*<h4 style="color:Green;">Same as reference file</h4>
Fail Test
    fail    *HTML*<h4 style="color:Red;"> Mismatch with reference file</h4>