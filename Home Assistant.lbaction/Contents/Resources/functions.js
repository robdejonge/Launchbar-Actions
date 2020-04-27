function postAPI(apicall) {

  url = buildURL(apicall)

  var resultObject = HTTP.post(url, {
      headerFields: {
          'Authorization': 'Bearer '.concat(settings.homeassistant.key),
          'Content-Type' : 'application/json'
      },
      resultType: 'json'
    });

  return resultObject;
}


function getAPI(apicall) {

  url = buildURL(apicall)

  var resultObject = HTTP.get(url, {
      headerFields: {
          'Authorization': 'Bearer '.concat(settings.homeassistant.key),
          'Content-Type' : 'application/json'
      },
      resultType: 'json'
    });

  return resultObject;
}

function buildURL(apicall) {

  url = ""

  if (settings.homeassistant.ssl) {
    url = "https://";
  } else {
    url = "http://";
  }

  url = url.concat(settings.homeassistant.hostname,':',settings.homeassistant.port,'/',settings.homeassistant.base,'/');

  url = url.concat(apicall)

  return url;
}

function anyCommonErrors(resultObjectReceived, thingToDo) {

  anErrorOccurred = false;

  if (resultObjectReceived.timeOut) {

    LaunchBar.alert('Request to ' + thingToDo + ' timed out.')
    anErrorOccurred = true;

  } else if (resultObjectReceived.error != undefined) {

    LaunchBar.alert('Unable to '+thingToDo, resultObjectReceived.error)
    anErrorOccurred = true;

  } else if (resultObjectReceived.response.status != 200) {

    LaunchBar.alert('Unable to '+thingToDo, resultObjectReceived.response.localizedStatus + ' (' + resultObjectReceived.response.status +')')
    anErrorOccurred = true;

  };

  return anErrorOccurred;
}
