TITLE Lab 6 While Loop, Neil Hanlon, Oct 20 2015 (while.asm)

; Description: Loop until user inputs "n" or "N" -- otherwise output hello.
; 
; Revision date:

INCLUDE Irvine32.inc
.data

hello byte "Hello",0ah, 0dh, 0
goodbye byte "You chose no.",0ah, 0dh ,0
capN byte 4Eh
lowN byte 6Eh

.code
main PROC
	call Clrscr

	mov edx, offset hello
	someloop:
		call writestring
		call readchar

		; compare user input with hex values for N and n (4E and 6E)
		;	if they match, exit
		cmp al, capN
		je thegame
		cmp al, lowN
		je thegame

		jmp someloop ; otherwise. loop.

	thegame:
		mov edx, offset goodbye
		call writestring

	exit
main ENDP

END main