# =============================================================================
# Currency conversion - v20190516
# -----------------------------------------------------------------------------
# This script is meant to be launched from LaunchBar, taking an input query in
# the format ##src dst and asking Google to convert ## number of src currency
# units into dst currency units. The script will limit the output currency
# units to 2 decimals. Use ISO 4217 codes for source and destination
# indication.
#
# Thanks to iRounak and CapnAverage on the obdev.at forum for their help in
# getting this off the ground. Thanks to regulus6633 for the routine, which
# he didnt write. 
# -----------------------------------------------------------------------------

on makeCaseUpper(theString)
	set UPPERCASE to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	set lowercase to "abcdefghijklmnopqrstuvwxyz"
	set AppleScript's text item delimiters to " "
	set theWords to text items of theString as list
	set AppleScript's text item delimiters to ""
	set newList to {}
	repeat with theWord in theWords
		set chrs to characters of theWord
		set Nchrs to count chrs -- get the number of characters
		repeat with K from 1 to Nchrs
			if (item K of chrs) is in lowercase then
				set olc to offset of (item K of chrs) in lowercase
				set item K of chrs to character olc of UPPERCASE
			end if
		end repeat
		set end of newList to chrs as string
	end repeat
	set AppleScript's text item delimiters to " "
	set theString to newList as string
	set AppleScript's text item delimiters to ""
	return theString
end makeCaseUpper

on handle_string(theInput)
	
	try
		
		# settings
		set APIKEY to "210a26f0ad66488a0d63"
		
		# break down the query
		set AppleScript's text item delimiters to " "
		set theAmount to text item 1 of theInput as text
		set theFirstCurrency to text item 2 of theInput as text
		set theSecondCurrency to text item -1 of theInput as text
		
		# obtain the exchange rate
		set theURL to quoted form of ("https://free.currconv.com/api/v7/convert?q=" & theFirstCurrency & "_" & theSecondCurrency & "&compact=ultra&apiKey=" & APIKEY)
		set theSource to (do shell script "curl --silent " & theURL) as string
		set AppleScript's text item delimiters to ""
		set theRate to (characters 12 through ((length of theSource) - 1) of theSource) as string
		
		# crazy complicated math processing engine 
		set theResult to theAmount * theRate as string
		
		# prepare stuff for display
		set theFirstCurrency to makeCaseUpper(theFirstCurrency)
		set theSecondCurrency to makeCaseUpper(theSecondCurrency)
		set the_offset to offset of "." in theResult
		if the_offset is not 0 then
			set the_offset to the_offset + 2
			set theResult to text 1 through the_offset of theResult
		end if
		
		# display the message
		tell application "LaunchBar"
			set theTitle to theFirstCurrency & " " & theAmount
			set theMessage to theSecondCurrency & " " & theResult
			display in large type theMessage with title theTitle
			set the clipboard to theResult
		end tell
		
	on error ErrMsg
		
		tell application "Safari" to open location "https://www.google.com/search?q=" & (theAmount & "%20" & theFirstCurrency & " " & theSecondCurrency)
		
	end try
	
end handle_string
