#*** Settings ***
#Library     AppiumLibrary
#
#*** Test Cases ***
#Open_Application
#    open application    http://127.0.0.1:4723/wd/hub     platformName=android    platformVersion=10  udid=21208522513171  deviceName=TC57X  appPackage=com.android.settings  appActivity=com.android.settings.homepage.SettingsHomepageActivity    automationName=Uiautomator2
#    Sleep  1s
#    Click Element    xpath=//android.widget.LinearLayout[3]//android.widget.TextView[2]
#    Sleep  1s
#    Click Element    xpath=//android.widget.Button
#    Sleep  1s
#    Click Element    id=com.android.settings:id/search_app_list_menu
#    Sleep  1s
#    Input Text    id=android:id/search_src_text     Files
#    Sleep  1s
#    Click Element    id=android:id/icon
#    Sleep  3s
#   Click Element    id=com.android.settings:id/button1
#   Sleep  1s
#   click element    id=com.android.documentsui:id/option_menu_search
#   Sleep  1s
#   click element    id=com.android.documentsui:id/search_src_text
#   input text    id=com.android.documentsui:id/search_src_text    SmartFileSync
#   Hide Keyboard
#   Capture Page Screenshot      SmartFile.jpg
##   close application
#
