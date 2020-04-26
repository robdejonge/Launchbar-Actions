// loads the settings file
try {
    var settings = File.readJSON(Action.path+'/Contents/Resources/settings.json');
    // Use object
} catch (exception) {
    LaunchBar.alert('Error while reading settings: ' + exception);
}

// loads the name of the installation and HA version number
var discovery_info = getAPI('discovery_info').data;

// --

function restartHA() {

  action = 'restart Home Assistant'
  result = postAPI('services/homeassistant/restart');

  if (anyCommonErrors(result, action)) {

    // already did what needed to be done

  } else {

    LaunchBar.displayNotification({

      title  : discovery_info.location_name + ' (Home Assistant ' + discovery_info.version + ')',
      string : action.charAt(0).toUpperCase() + action.substring(1) + ' complete'

    });
  }
}

function checkConfig() {

  action = 'check configuration'
  result = postAPI('config/core/check_config');

  if (anyCommonErrors(result, action)) {

    // already did what needed to be done

  } else if (result.data.result != 'valid') {

    LaunchBar.alert(result.data.errors)

  } else {

    LaunchBar.displayNotification({

      title  : discovery_info.location_name + ' (Home Assistant ' + discovery_info.version + ')',
      string : action.charAt(0).toUpperCase() + action.substring(1) + ' complete: valid configuration!'

    });
  }
}

function reloadCoreConfig() {

  action = 'reload core configuration';
  result = postAPI('services/homeassistant/reload_core_config');

  if (anyCommonErrors(result, action)) {

    // already did what needed to be done

  } else {

    LaunchBar.displayNotification({

      title  : discovery_info.location_name + ' (Home Assistant ' + discovery_info.version + ')',
      string : action.charAt(0).toUpperCase() + action.substring(1) + ' complete'

    });
  }
}

function reloadAutomations() {

  action = 'reload automations';
  result = postAPI('services/automation/reload');

  if (anyCommonErrors(result, action)) {

    // already did what needed to be done

  } else {

    LaunchBar.displayNotification({

      title  : discovery_info.location_name + ' (Home Assistant ' + discovery_info.version + ')',
      string : action.charAt(0).toUpperCase() + action.substring(1) + ' complete'

    });
  }
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


function run(argument) {

  var actions = [];

  actions.push({
      title: 'Restart Home Assistant',
      icon: 'home-assistant-logo.png',
      action: 'restartHA',
      actionRunsInBackground: true
  });

  actions.push({
      title: 'Check configuration',
      icon: 'home-assistant-logo.png',
      action: 'checkConfig',
      actionRunsInBackground: true
  });

  actions.push({
      title: 'Reload core config',
      icon: 'home-assistant-logo.png',
      action: 'reloadCoreConfig',
      actionRunsInBackground: true
  });

  actions.push({
      title: 'Reload automations',
      icon: 'home-assistant-logo.png',
      action: 'reloadAutomations',
      actionRunsInBackground: true
  });

  return actions;
}
