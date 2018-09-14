# =============================================================================
# Currency conversion - v20180914
# -----------------------------------------------------------------------------
# This script is meant to be launched from LaunchBar, taking an input query in
# the format ##src dst and asking Google to convert ## number of src currency
# units into dst currency units. The script will limit the output currency
# units to 2 decimals. Use ISO 4217 codes for source and destination
# indication.
#
# Thanks to iRounak and CapnAverage on the obdev.at forum for their help in
# getting this off the ground.
# -----------------------------------------------------------------------------


on handle_string(theInput)
	
	try
		
		# settings
		set APIKEY to "currencylayer.com -> sign in -> account dashboard -> your api access key"
		
		# break down the query
		set AppleScript's text item delimiters to " "
		set theAmount to text item 1 of theInput as text
		set theFirstCurrency to text item 2 of theInput as text
		set theSecondCurrency to text item -1 of theInput as text
		
		# obtain the exchange rate
		set theURL to quoted form of ("http://apilayer.net/api/live?access_key=" & APIKEY & "&currencies=" & theSecondCurrency & "&source=" & theFirstCurrency & "&format=1")
		set theSource to (do shell script "curl --silent " & theURL & " | grep --ignore-case " & theFirstCurrency & theSecondCurrency) as string
		set AppleScript's text item delimiters to ":"
		set theRate to text item 2 of theSource
		
		# crazy complicated math processing engine 
		set theResult to theAmount * theRate as string
		
		# limit the result amount to 2 decimals
		set the_offset to offset of "." in theResult
		if the_offset is not 0 then
			set the_offset to the_offset + 2
			set theResult to text 1 through the_offset of theResult
		end if
		
		# display the message
		tell application "LaunchBar"
			set theMessage to theResult
			set theTitle to theAmount & " " & theFirstCurrency & " in " & theSecondCurrency
			set the clipboard to theResult
			display in large type theMessage with title theTitle
		end tell
		
	on error ErrMsg
		
		tell application "LaunchBar" to display in large type ErrMsg with title "Currency conversion encountered an error"
		
	end try
	
end handle_string
