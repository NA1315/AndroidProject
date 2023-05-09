*** Settings ***
Library     AppiumLibrary
Documentation   Obtain version and refernce version compare then generate status For ${id1}
Resource     ../resource.robot
*** Test Cases ***
Open Battery Manager Application
    open application    http://127.0.0.1:4723/wd/hub     platformName=android   platformVersion=10    udid=${id1}     systemPort=8202    deviceName=TC57X  orientation=PORTRAIT  appPackage=com.symbol.batterymanager  appActivity=com.symbol.batterymanager.ui.SplashActivity    utomationName=Uiautomator2
    Sleep  1s
    PORTRAIT
Landed on Information tab
    [Documentation]    Run Battery Management application and check function
    [Tags]   DA_01
    element should contain text     xpath=//android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/androidx.viewpager.widget.ViewPager[1]/android.widget.ScrollView[1]/android.view.ViewGroup[1]/android.widget.ListView[1]/android.widget.RelativeLayout[1]/android.widget.TextView[2]   Battery present
    Sleep  1s
Go to SWAP tab
    [Documentation]    Check swap function
    click element    xpath=//*[@class = 'androidx.appcompat.app.ActionBar$Tab'][2]/android.widget.TextView
    click element    id=com.symbol.batterymanager:id/battery_swap_button
    log to console   Succeesfully click on Button
    Sleep  2s
    close application
