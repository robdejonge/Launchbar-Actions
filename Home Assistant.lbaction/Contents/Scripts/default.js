// loads a few functions offloaded for overviewability
include('../Resources/functions.js');

// loads the settings file
try {
    var settings = File.readJSON(Action.path+'/Contents/Resources/settings.json');
    // Use object
} catch (exception) {
    LaunchBar.alert('Error while reading settings: ' + exception);
}

// loads the name of the installation and HA version number
var discovery_info = getAPI('discovery_info').data;

// ---------------------------------------------------------------------------------

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

function executeAPICall(my) {

  if (my.method == "post") {

      result = postAPI(my.call);

  } else if (my.method == "get") {

      result = getAPI(my.call);

  } else {

    LaunchBar.alert("Misconfigured API call, method may be POST or GET only");

  }

  if (anyCommonErrors(result, my.action)) {

    // already did what needed to be done

  } else {

    LaunchBar.displayNotification({

      title  : discovery_info.location_name + ' (Home Assistant ' + discovery_info.version + ')',
      string : my.action.charAt(0).toUpperCase() + my.action.substring(1) + ' complete'

    })
  }
}



function run(argument) {

  var actions = [];

  actions.push({
      title: 'Check configuration',
      icon: 'home-assistant-logo.png',
      action: 'checkConfig',
      actionRunsInBackground: true
  });

  for(let i = 0; i < settings.API_calls.length; i++){

    this_action = settings.API_calls[i].action;

    actions.push({
        title: this_action.charAt(0).toUpperCase() + this_action.substring(1),
        icon: 'home-assistant-logo.png',
        action: 'executeAPICall',
        actionArgument: settings.API_calls[i],
        actionRunsInBackground: true
    });

  }

  return actions;

}
