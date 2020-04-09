-- Pretty Man Pages
-- This script opens the specified Unix man page in Preview
--
-- Written by Ian Beck <http://onecrayon.com>
-- Pretty man page command thanks to MacWorld:
-- <http://www.macworld.com/article/54155/2006/12/manpages.html>

-- Handle string from LaunchBar
on handle_string(target)
	-- Check to see if we've got text, ask for it if not
	if target is equal to "" then
		set question to display dialog ("Lookup man page for command:") default answer "ls"
		set target to text returned of question
	end if
	set shellCmd to "man -t \"" & target & "\" | open -f -a Preview"
	do shell script shellCmd
end handle_string

-- Call the function in case the script was run directly
-- (Don't worry; this line won't execute if called from LB)
my handle_string("")

