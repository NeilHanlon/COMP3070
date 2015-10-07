TITLE Lab4 Problem 6, Neil Hanlon, Oct 6, 2015
; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
array1 byte 1h,2h,3h,4h,5h,6h,7h,8h,9h,0Ah
array1_end EQU $
message1 BYTE "Before reverse:", 0ah, 0dh, 0
message2 BYTE "After reverse: ", 0ah, 0dh, 0

.code
main PROC
	call Clrscr

	mov eax, 0
	mov ebx, 0

	mov edx, offset message1
	call WriteString
	call PrintArray

	mov esi, offset array1 ; beginning of the array
	mov edi, offset array1_end - 1 ; end of the array
	mov ecx, lengthof array1 / 2 ; loop half as many times as there are elemens
	mov edx, type array1

	oranges:
		; first, get the nth and n+xth elements
		mov al, [esi]
		mov bl, [edi]
		; swap them in memory, the nth value is now the n+xth value, and vice versa
		mov [edi], al
		mov [esi], bl
		inc esi ; move the head forward
		dec edi ; and move the tail backwards, until we meet in the middle at lengthof array1 / 2
	loop oranges

	mov edx, offset message2
	call WriteString
	call PrintArray


	exit
main ENDP

PrintArray PROC
	mov eax, 0
	mov ecx, lengthof array1
	mov esi, offset array1
	print_array:
		mov al, [esi]
		call WriteInt
		call crlf
		inc esi
	loop print_array
	ret
PrintArray ENDP

END main