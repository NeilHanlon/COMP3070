TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
prompt1 BYTE "Enter the number to sum up to from zero: ",0
answer BYTE "The sum from 0 to your number is: ",0

.code
main PROC
	call Clrscr

	call GetNumbers
	mov eax, 0

	oranges:
		add eax, ecx ; add the counter
	loop oranges

	mov edx, offset answer
	call writestring
	call writeint
	call crlf

	exit
main ENDP

GetNumbers PROC
	mov edx, offset prompt1
	call GetInput
	mov ecx, eax ; literally just keep this in the counter
	ret
GetNumbers ENDP

GetInput PROC
	mov eax, 0
	call WriteString
	call ReadInt
	call crlf
	ret
GetInput ENDP

END main