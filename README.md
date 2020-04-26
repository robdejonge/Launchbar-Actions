An application installed on every single Mac I have owned since 2008, LaunchBar by Objective Development has become essential to my day. It goes much further than the default Spotlight Search window and allows me to build my own actions on top of the existing functionality. This repository shares some of the actions I have built myself.

### Actions

#### Currency conversion
Quickly convert currencies by entering a query in the format '# src [to] dst' where src are currency symbols and # is the amount being converted, eg. '15 usd eur'. Hit enter to query. The result is displayed 'in large type', Cmd-C copies this to the clipboard or any other key dismisses. Requires you to edit `default.scpt`, inserting your API key for free.currconv.com.

#### Open active Safari tab in Chrome
Takes the URL of the most recently active tab in the Safari browser, opens Google Chrome, creates a new tab with the same URL.

#### Open clipboard in Preview
Opens Preview and pastes an image currently held in the system clipboard. Useful with screenshots.

#### Password generator
Generates a random password using a mix of letters, numbers and dashes, and copies it to the clipboard. Running the action requires an input, which is the length of the random password generated.

#### UNIX manual
Shows the manual page for a certain command. Provide the command as a parameter and LaunchBar will open a Preview window with the manual page formatted in the usual manner.

#### Home Assistant
Home Assistant is an open source home automation that puts local control and privacy first. While configuring, I often have to navigate through the web interface to trigger certain actions. As there is an API that can be used for this, I wrote this action to trigger a few of the calls I commonly use. Make sure you edit the `settings.json` within, and see what calls are currently supported.

### Installation

Clone the repository, and click on every `.lbaction` you wish to install.

For the Home Assistant scripts, save the files you wish to use into ~/Library/Application Support/LaunchBar/Actions and ensure you update your index (Opt-Cmd-R) to use them right away. Generate an access key inside Home Assistant, and put it into the settings file.

### License

This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).
