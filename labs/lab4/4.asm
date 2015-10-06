TITLE Lab 4 Problem 4, Neil Hanlon, Oct. 6, 2015 (4.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
array_w WORD 1h,2h,3h,4h,5h,6h,7h,8h
array_dw DWORD 8 dup(?)

.code
main PROC
	call Clrscr

	; copy all elements from unsigned word array to unsigned dword array
	mov eax, 0
	mov esi, offset array_w
	mov ecx, lengthof array_w
	print1:
		mov ax, [esi]
		call writehex
		call crlf
		add esi, type array_w
	loop print1

	call crlf
	call crlf

	mov esi, offset array_w
	mov ecx, lengthof array_w
	mov edi, offset array_dw

	oranges:
		mov ax, word ptr [esi]
		mov [edi], ax
		mov ebx, [edi]
		add esi, 2
		add edi, 4
	loop oranges

	mov esi, offset array_dw
	mov ecx, lengthof array_dw
	print2:
		mov eax, [esi]
		call writehex
		call crlf
		add esi, type array_dw
	loop print2

	exit
main ENDP

END main