// LaunchBar Action Script

try {
    var settings = File.readJSON(Action.path+'/Contents/Resources/settings.json');
    // Use object
} catch (exception) {
    LaunchBar.alert('Error while reading settings: ' + exception);
}

function restartHA() {

  result = postAPI('services/homeassistant/restart');

  if (result.timeOut) {

    LaunchBar.alert('Request to restart Home Assistant timed out.')

  } else if (result.error != undefined) {

    LaunchBar.alert('Unable to restart Home Assistant', result.error)

  } else if (result.response.status != 200) {

    LaunchBar.alert('Server said: ',result.response.localizedStatus,' (',result.response.status,')')

  } else {

    LaunchBar.displayNotification({

      title  : 'Home Assistant',
      string : 'Restarted'

    });

  }


}

function checkConfig() {

  result = postAPI('config/core/check_config');

  if (result.timeOut) {

    LaunchBar.alert('Request to check configuration timed out.')

  } else if (result.error != undefined) {

    LaunchBar.alert('Unable to check configuration', result.error)

  } else if (result.response.status != 200) {

    LaunchBar.alert('Server said: ',result.response.localizedStatus,' (',result.response.status,')')

  } else if (result.data.result != 'valid') {

    LaunchBar.alert(result.data.errors)

  } else {

    LaunchBar.displayNotification({

      title  : 'Home Assistant',
      string : 'Configuration valid'

    });
  }
}

function reloadCoreConfig() {

  result = postAPI('services/homeassistant/reload_core_config');

  if (result.timeOut) {

    LaunchBar.alert('Request to reload core configuration timed out.')

  } else if (result.error != undefined) {

    LaunchBar.alert('Unable to reload core configuration', result.error)

  } else if (result.response.status != 200) {

    LaunchBar.alert('Server said: ',result.response.localizedStatus,' (',result.response.status,')')

  } else {

    LaunchBar.displayNotification({

      title  : 'Home Assistant',
      string : 'Core configuration reloaded'

    });
  }
}

function reloadAutomations() {

  result = postAPI('services/automation/reload');

  if (result.timeOut) {

    LaunchBar.alert('Request to reload automations timed out.')

  } else if (result.error != undefined) {

    LaunchBar.alert('Unable to reload automations', result.error)

  } else if (result.response.status != 200) {

    LaunchBar.alert('Server said: ',result.response.localizedStatus,' (',result.response.status,')')

  } else {

    LaunchBar.displayNotification({

      title  : 'Home Assistant',
      string : 'Automations reloaded'

    });
  }
}

function postAPI(apicall) {

  url = ""

  if (settings.homeassistant.ssl) {
    url = "https://";
  } else {
    url = "http://";
  }

  url = url.concat(settings.homeassistant.hostname,':',settings.homeassistant.port,'/',settings.homeassistant.base,'/');

  url = url.concat(apicall)

  var resultObject = HTTP.post(url, {
      headerFields: {
          'Authorization': 'Bearer '.concat(settings.homeassistant.key),
          'Content-Type' : 'application/json'
      },
      resultType: 'json'
    });

  return resultObject;
}

function run(argument) {

  var output = [];

  output.push({
      title: 'Restart Home Assistant',
      icon: 'home-assistant-logo.png',
      action: 'restartHA',
      actionRunsInBackground: true
  });

  output.push({
      title: 'Check configuration',
      icon: 'home-assistant-logo.png',
      action: 'checkConfig',
      actionRunsInBackground: true
  });

  output.push({
      title: 'Reload core config',
      icon: 'home-assistant-logo.png',
      action: 'reloadCoreConfig',
      actionRunsInBackground: true
  });

  output.push({
      title: 'Reload automations',
      icon: 'home-assistant-logo.png',
      action: 'reloadAutomations',
      actionRunsInBackground: true
  });

  return output;
}
