TITLE Lab 5 Factorial problem, Neil Hanlon, Oct. 7th, 2015 (factorial.asm)

; Description: Get the factorial of a number
; 
; Revision date:

INCLUDE Irvine32.inc
.data
prompt1 BYTE "Enter the number to get the factorial of: ",0
answer BYTE "The factorial of your number is: ",0

.code
main PROC
	call Clrscr

	call GetNumber
	mov eax, 1

	oranges:
		mul ecx ; eax*ecx
	loop oranges

	mov edx, offset answer
	call writestring
	call writeint
	call crlf

	exit
main ENDP

GetNumber PROC
	mov edx, offset prompt1
	call GetInput
	mov ecx, eax
	ret
GetNumber ENDP

GetInput PROC
	mov eax, 0
	call WriteString
	call ReadInt
	call crlf
	ret
GetInput ENDP

END main