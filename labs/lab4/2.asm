TITLE Lab 4 Problem 2, Neil Hanlon, October 6 2015 (2.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
array1 BYTE 12h,23h,34h,45h

.code
main PROC
	call Clrscr

	mov ebx, dword ptr [array1]
	mov ecx, lengthof array1
	mov esi, offset array1

	mov eax, ebx
	call writehex
	mov eax, 0

	call crlf
	call crlf

	oranges:
		mov al, [esi]
		inc esi
		mov ah, [esi]
		xchg ah, al
		mov [esi], ah
		dec esi
		mov [esi], al
		add esi, 2
	loop oranges

	mov eax, dword ptr [array1]
	call writehex
	call crlf

	exit
main ENDP

END main