#!/usr/local/bin/python3
import json
from requests import get
from requests import post

localsettings_settingsfile = "/absolute/path/to/Home Assistant - Settings.json"
localsettings_apicall = "/services/automation/reload"

# load the settings
with open(localsettings_settingsfile) as json_data_file:
  settings = json.load(json_data_file)

# parse the settings
if settings['homeassistant']['ssl'] == True:
  url = "https://"
elif settings['homeassistant']['ssl'] == False:
  url = "http://"
else:
  print("configuration incorrect, ssl is a boolean")
  exit(1)

# set the url
url = url + settings['homeassistant']['hostname'] + ":" + settings['homeassistant']['port'] + "/" + settings['homeassistant']['base'] + localsettings_apicall

# set the headers
headers = {
    "Authorization": "Bearer " + settings['homeassistant']['key'],
    "content-type": "application/json"
}

# make the call
response = post(url, headers=headers)

# process the response
print(response.text)
