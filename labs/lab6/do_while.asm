TITLE Lab 6 Do-While Loop, Neil Hanlon, Oct 20 2015 (while.asm)

; Description: Loop while user inputs something other than Y or y.
; 
; Revision date:

INCLUDE Irvine32.inc
.data

hello byte "Hello, how are you?",0ah, 0dh, 0
capY byte 59h
lowY byte 79h

.code
main PROC
	call Clrscr

	mov edx, offset hello
	someloop:
		call writestring
		call readchar

		; compare user input with hex values for Y and y, if they match, loop.
		cmp al, capY
		je someloop
		cmp al, lowY
		je someloop

		;otherwise, we just continue

	exit
main ENDP

END main