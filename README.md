An application installed on every single Mac I have owned since 2008, LaunchBar by Objective Development has become essential to my day. It goes much further than the default Spotlight Search window and allows me to build my own actions on top of the existing functionality. This repository shares some of the actions I have built myself.

### Scripts

#### Currency Conversion.applescript
Quickly convert currencies by entering a query in the format '# src [to] dst' where src are currency symbols and # is the amount being converted, eg. '15 usd eur'. Hit enter to query. The result is displayed 'in large type', Cmd-C copies this to the clipboard or any other key dismisses.

#### Random password generator.applescript
Generates a random password using a mix of letters, numbers and dashes, and copies it to the clipboard. Running the action requires an input, which is the length of the random password generated.

#### UNIX manual page.applescript
Shows the manual page for a certain command. Provide the command as a parameter and LaunchBar will open a Preview window with the manual page formatted in the usual manner.

#### Home Assistant scripts
Home Assistant is an open source home automation that puts local control and privacy first. While configuring, I often have to navigate through the web interface to trigger certain actions. As there is an API that can be used for this, I wrote a few simple scripts to speed up this process.

**Home Assistant - Settings.json**: Contains a few settings common to all scripts, so that you have to set them only once and not in every script individually. Settings should be self-explanatory, leave the 'api' setting alone unless you really know what you are doing. Do make sure the absolute path to this file is set correctly in every script, as they otherwise do not work.

**Home Assistant - restart server.py**: Restarts Home Assistant.

**Home Assistant - reload automations.py**: Reloads the automations in Home Assistant.

### Installation

Save the files you wish to use into ~/Library/Application Support/LaunchBar/Actions and ensure you update your index (Opt-Cmd-R) to use them right away. Some scripts may require you to edit settings directly in the source code.  

### License

This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).
