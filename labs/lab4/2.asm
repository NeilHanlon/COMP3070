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
		; loop through and exchange pairs of bytes
		mov al, [esi] ; get nth byte
		inc esi ; move forward one byte
		mov ah, [esi] ; get n+1th byte
		xchg ah, al ; swap n for n+1
		mov [esi], ah ; perform the swap in memory
		mov [esi], al
		inc esi ; move to next pair of bytes
	loop oranges

	mov eax, dword ptr [array1]
	call writehex
	call crlf

	exit
main ENDP

END main