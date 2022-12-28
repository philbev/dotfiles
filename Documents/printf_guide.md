# A Short Guide to printf
Printf takes the form:

	printf "String with format specifiers" Argument ...
The string can contain straight text as well as format specifiers. There needs to be the same number fo arguments as there are specifiers.

The arguments can be numbers,strings or parameters e.g. variables and arrays.

The format specifiers take the form (and always in this order):-
	%-m.nF

where

	'%' starts the specifier [compulsory].
	'-' Justify text left [optional].
	'm' A digit that specifies field width [optional].
	'.' Used in floating point numbers and strings only [optional].
	'n' A digit specifying the number of decimal places in a floating point
	number or the number of characters in a string [optional].
	'F' Specifies the type of data of the arguments (see table below) [compulsory].

| CONVERSION CHARACTER	|						ARGUMENT TYPE															|
+-----------------------+-----------------------------------------------------------------------------------------------+
|	d,i					| An integer, expressed as a decimal number.													|
|	o					| An integer, expressed as an unsigned octal number.											|
|	x,X					| An integer, expressed as an unsigned hexadecimal number										|
|	u					| An integer, expressed as an unsigned decimal number.											|
|	c					| An integer, expressed as a character. The integer corresponds to the character's ASCII code.	|
|	s					| A string.																						|
|	f					| A floating-point number, with a default precision of 6.										|
|	e,E					| A floating-point number expressed in scientific notation, with a default precision of 6.		|
|	p					| A memory address pointer.																		|
|	%					| No conversion; a literal percent sign ("%") is printed instead.								|


## Interpreted Escaped Character Sequences
The following character sequences are interpreted as special characters by printf:

| CHARACTER		|			INTERPRETATION						|
|-------------------|---------------------------------------------------------------------------|
|	  "			| prints a double-quote (")							|
|	  \\\		| prints a backslash (\)							|
|	  \a| issues an alert (plays a bell)						|
|	  \b		| prints a backspace							|
|	  \c		| instructs printf to produce no further output				|
|	  \e		| prints an escape character (ASCII code 27)				|
|	  \f		| prints a form feed							|
|	  \n		| prints a newline								|
|	  \r		| prints a carriage return							|
|	  \t		| prints a horizontal tab							|
|	  \v		| prints a vertical tab							|
|	  \NNN		| prints a byte with octal value NNN (1 to 3 digits)			|
|	  \xHH		| prints a byte with hexadecimal value HH (1 to 2 digits)			|
|	  \uHHHH		| prints the unicode character with hexadecimal value HHHH (4 digits)	|
|	  \UHHHHHHHH	| prints the unicode character with hexadecimal value HHHHHHHH (8 digits)	|
|	  %b		| prints ARGUMENT as a string with "\" escapes interpreted as listed above, |
|			| with the exception that octal escapes take the form \0 or \0NN		|


See [Computerhope](https://www.computerhope.com/unix/uprintf.htm "Computerhope") for further details.
