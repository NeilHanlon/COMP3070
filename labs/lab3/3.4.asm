TITLE Lab 2 problem 3.4, Neil Hanlon & Andrew Amorelli, 9-18-2015				(main.asm)

INCLUDE Irvine32.inc
.data
text1 EQU <"Hello ">
text2 EQU <"World.">
text3 EQU <" It's a beautiful day">
some_string BYTE text1, text2, text3

.code
main PROC
	call Clrscr

	mov	 edx,OFFSET some_string
	call WriteString

	exit
main ENDP

END main