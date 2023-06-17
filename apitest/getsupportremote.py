# # Description: Get remote support URL of the device
import json
import requests
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By

with open('data.json') as f:
    data = json.load(f)

ENDPOINT = data["config"]["Server"]
headers = {
    "ApiKey": data["config"]["ApiKey"],
    "Content-Type": "application/json",
}
Credentials = (data["config"]["User"], data["config"]["Password"])

null = None
payload = {
    "ID": null,
    "SortColumn": "DeviceName",
    "SortOrder": "asc",
    "Limit": 10,
    "IsSearch": True,
    "SearchValue": data["SearchValue"]}


def test_check_custom_columns():
    response = requests.post(ENDPOINT + "/api/devicegrid", auth=Credentials, json=payload, headers=headers)
    row = response.json()
    d_id = row["rows"][0]["DeviceID"]
    name = row["rows"][0]["DeviceName"]
    agent = row["rows"][0]["AgentVersion"]
    plat = row["rows"][0]["PlatformType"]
    # Print the DeviceID
    remoteSupporturl = "http://zebrams000.eu.suremdm.io/RemoteSupport.aspx?" + "id=" + str(
        d_id) + "&name=" + str(name) + "&pltFrmType=" + str(plat) + "&agentversion=" + str(agent) + \
                       "&perm=126,127"
    print(remoteSupporturl)

    options = Options()
    options.add_experimental_option("detach", True)
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

    driver.get("https://zebrams000.eu.suremdm.io/console/")
    driver.maximize_window()
    time.sleep(5)
    username = driver.find_element(By.ID, "uName")
    username.click()
    username.send_keys(data["config"]["User"])
    password = driver.find_element(By.ID, "pass")
    password.click()
    password.send_keys(data["config"]["Password"])
    button = driver.find_element(By.XPATH, "//*[@id='loginBtn']")
    button.click()
    time.sleep(30)
    driver.execute_script("window.open('');")
    driver.switch_to.window(driver.window_handles[1])
    driver.get(remoteSupporturl)
    time.sleep(50)
    driver.save_screenshot("screenshot.png")
    driver.quit()
