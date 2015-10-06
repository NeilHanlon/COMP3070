TITLE Lab 4 Problem 8, Neil Hanlon, Oct. 6, 2015

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
array DWORD 10d, 20d, 30d, 40d

.code
main PROC
	call Clrscr

	call PrintArray
	call crlf

	mov ecx, lengthof array
	mov esi, offset array
	mov edi, offset array + (lengthof array -1 * type array)

	oranges:
		mov eax, [esi]
		mov ebx, [edi]
		mov [esi], ebx
		mov [edi], eax
		add esi, type array
	loop oranges

	call crlf
	call PrintArray

	exit
main ENDP

PrintArray PROC
	mov ecx, lengthof array
	mov esi, offset array
	print_oranges:
		mov eax, [esi]
		call WriteInt
		call CrLF
		add esi, type array
	loop print_oranges
	ret
PrintArray ENDP
END main