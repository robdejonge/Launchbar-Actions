on handle_string(theLength)

	set acceptable_characters to {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "-"}
	set random_password to ""

	repeat theLength times
		set random_password to random_password & some item of acceptable_characters
	end repeat

	set the clipboard to random_password

end handle_string
