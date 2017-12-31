# =============================================================================
# Currency conversion - v20161222
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
# Further development: 
# - allow input with space between amount and source currency
# - elegant error handling and reporting
# -----------------------------------------------------------------------------

on handle_string(theInput)
	try
		
		# stuff iRounak wrote 
		set AppleScript's text item delimiters to " "
		set theAmount to text item 1 of theInput as text
		set theFirstCurrency to text item 2 of theInput as text
		set theSecondCurrency to text item -1 of theInput as text
		
		set theURL to quoted form of ("https://finance.google.com/finance/converter?from=" & theFirstCurrency & "&to=" & theSecondCurrency & "&a=" & theAmount)
		set theSource to (do shell script "curl " & theURL & " | grep currency_converter_result") as string
		set astid to AppleScript's text item delimiters
		set AppleScript's text item delimiters to "†"
		set theSource to text items of theSource
		set AppleScript's text item delimiters to ""
		set theSource to theSource as text
		
		# grab the 2 important bits from the google-returned string
		set AppleScript's text item delimiters to ">"
		set gsFrom to text item 2 of theSource
		set gsTo to text item 3 of theSource
		
		# split the important bits into their 2 components, the amount and the currency name
		set AppleScript's text item delimiters to " "
		set gsFromAmt to text item 1 of gsFrom
		set gsFromCurr to text item 2 of gsFrom
		set gsToAmt to text item 1 of gsTo
		set gsToCurr to text item 2 of gsTo
		set AppleScript's text item delimiters to "<"
		set gsToCurr to text item 1 of gsToCurr
		
		# limit the result amount to 2 decimals
		set the_offset to offset of "." in gsToAmt
		set the_offset to the_offset + 2
		set gsToAmt to text 1 through the_offset of gsToAmt
		
		# display the message
		tell application "LaunchBar"
			set theMessage to gsToAmt
			set theTitle to gsFromAmt & " " & gsFromCurr & " in " & gsToCurr
			set the clipboard to gsToAmt
			display in large type theMessage with title theTitle
		end tell
		
	end try
end handle_string

