TITLE Lab 5 Factorial problem, Neil Hanlon, Oct. 7th, 2015 (factorial.asm)

; Description: Get the factorial of a number
; 
; Revision date:

INCLUDE Irvine32.inc
.data
prompt1 BYTE "Enter the number to get the factorial of: ",0
caption byte "Factorial Answer",0
answer BYTE "The factorial of your number is: ",

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

StringAppend PROC
	;takes eax and appends it to esi. esi should be at the end of itself. We're modifying memory. because reasons.
	inc esi
	mov byte ptr [esi], 20h ;space
	inc esi
	mov byte ptr [esi], al
	inc esi
	mov byte ptr [esi], 0

	ret
StringAppend ENDP

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