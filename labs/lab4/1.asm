TITLE Lab 4 Problem 1, Neil Hanlon, Oct 6. 2015 (1.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD ?

.code
main PROC
	call Clrscr

	mov esi, offset bigEndian
	mov ecx, lengthof bigEndian / 2
	mov edi, offset bigEndian + (lengthof bigEndian - 1 ) ; move secondary pointer to end of bigEndian array

	mov eax, [esi]
	push eax ; push bigEndian in case we need it again
	call writehex
	call crlf
	call crlf

	oranges:
		; loop through bigEndian (lengthof bigEndian / 2) times, and reverse the elements of the array
		mov al, [esi]
		mov ah, [edi]
		mov [esi], ah
		mov [edi], al
		inc esi
		dec edi
	loop oranges

	mov esi, offset bigEndian
	mov eax, [esi]
	
	mov littleEndian, eax ; put the little endian form into littleEndian memory

	call writehex
	call crlf

	exit
main ENDP

END main