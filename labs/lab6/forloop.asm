TITLE Lab 6 For Loop problem, Neil Hanlon, Oct 20 2015

; Description: write a for loop to count from 0 to N (user given)
; 
; Revision date:

INCLUDE Irvine32.inc
.data

prompt byte "Enter an integer: ",0
InvalidInputException byte "NEGATIVE NUMBERS ARE FROM THE DEVIL",0

.code
main PROC
	call Clrscr

	call GetInt
	test eax, eax ; test to see if the input is negative
	js negative

	mov ebx, eax ; move because reasons
	call CStyleForLoop
	jmp theend

	negative:
		mov edx, offset InvalidInputException ; because reasons
		call WriteString
		call crlf

	theend:

	exit
main ENDP

GetInt PROC

	mov edx, offset prompt
	call WriteString
	call ReadInt

	ret
GetInt ENDP

CStyleForLoop PROC
	; loops from 0 until we reach ebx (inclusive)
	mov eax, 0
	oranges:
		call writeint
		call crlf
		inc eax
		cmp eax, ebx ; compare eax (current loop value) with ebx (what we're looping to)
		jle oranges ; if eax <= ebx, we keep looping! Yay loops!
	ret
CStyleForLoop ENDP

END main