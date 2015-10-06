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

	mov esi, offset array1
	mov edi, offset array1_end - 1
	mov ecx, lengthof array1 / 2
	mov edx, type array1

	oranges:
		mov al, [esi]
		mov bl, [edi]
		mov [edi], al
		mov [esi], bl
		mov al, [esi]
		inc esi
		dec edi
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