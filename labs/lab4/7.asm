TITLE Lab 4 Problem 7, Neil Hanlon, Oct. 6 2015						(7.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
source BYTE "This is the source string",0
source_end EQU $
target BYTE SIZEOF source DUP('#')

.code
main PROC
	call Clrscr

	mov edx, offset source
	call WriteString
	call crlf

	mov esi, offset source
	mov edi, offset target + lengthof source - 2 ; -2 to account for the null terminator
	mov ecx, lengthof source

	oranges:
		mov al, byte ptr [esi]
		mov [edi], al
		inc esi
		dec edi
	loop oranges
	
	mov edx, offset target
	call WriteString
	call crlf

	exit
main ENDP

END main