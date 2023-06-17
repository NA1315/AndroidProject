import requests
import json


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
    "IsTag": False,
    "SortColumn": "LastTimeStamp",
    "SortOrder": "desc",
    "Limit": 10,
    "Offset": 0,
    "IsSearch": True,
    "IsIncludedBlackListed": True,
    "AdanceSearch": False,
    "EnableDeviceGlobalSearch": True,
    "SearchValue": data["SearchValue"]
}

def test_check_custom_columns():

    with open('data.json') as f:
        data = json.load(f)


    global value
    response = requests.post(ENDPOINT + "/api/devicegrid", auth=Credentials, json=payload, headers=headers)
    row = (response.json()["rows"])

    cc_MSPI = 0
    cc_SWDFT = 0
    cc_SWDINS = 0
    for extra_info in row[0]["ExtraDeviceInfo"]:
        if extra_info["Name"] == data["custom"]["mspi"]:
            assert extra_info["Name"] == data["custom"]["mspi"], "Expected Name"
            cc_MSPI = 1
            print(extra_info["Name"])
        if extra_info["Name"] == data["custom"]["ft"]:
            assert extra_info["Name"] == data["custom"]["ft"], "Expected Name"
            cc_SWDFT = 1
            print(extra_info["Name"])
        if extra_info["Name"] == data["custom"]["ins"]:
            assert extra_info["Name"] == data["custom"]["ins"], "Expected Name"
            cc_SWDINS = 1
            print(extra_info["Name"])
    if cc_MSPI == 0 or cc_SWDFT == 0 or cc_SWDINS == 0:
        print("Failed")


def test_success_jobs_groupwise():
    with open('data.json') as f:
        data = json.load(f)

    response = requests.get(ENDPOINT + "/api/group", auth=Credentials, headers=headers)
    group = (response.json()["Groups"])
    for value in group:
        # if you want change group name , just edit that
        if value["GroupName"] == data["Success"]["groupName"]:
            global group_id
            group_id = value["GroupID"]

    # 0	Pending to apply jobs
    # 1	Successfully applied jobs
    # 2	Failed to apply jobs
    # 3	In progress jobs

    job_response = requests.get(ENDPOINT + f"/api/GroupJobQueue/{group_id}/1", auth=Credentials, headers=headers)
    job = (job_response.json())

    onestep = 0
    rb = 0
    ins = 0
    ft = 0
    for name in job:
        if name["JobName"] == data["Success"]["onestop"]:
            assert name["JobName"] == data["Success"]["onestop"], "Expected Name"
            onestep = 1
            print(name["JobName"])
        if name["JobName"] == data["Success"]["rb"]:
            assert name["JobName"] == data["Success"]["rb"], "Expected Name"
            rb = 1
            print(name["JobName"])
        if name["JobName"] == data["Success"]["ins"]:
            assert name["JobName"] == data["Success"]["ins"], "Expected Name"
            ins = 1
            print(name["JobName"])
        if name["JobName"] == data["Success"]["ft"]:
            assert name["JobName"] == data["Success"]["ft"], "Expected Name"
            ft = 1
            print(name["JobName"])
        if onestep != 1 and rb != 1 and ins != 1 and ft != 1:
            print("Deployment has not started....")


def test_success_jobs_deviceID():
    deviceID = data["deviceID"]
    show = "true"

    device = requests.get(ENDPOINT + f"/api/jobqueue/{deviceID}/{show}", auth=Credentials, headers=headers)
    print(device.json())
