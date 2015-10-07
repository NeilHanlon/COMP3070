TITLE Lab 4 Problem 8, Neil Hanlon, Oct. 6, 2015

; Description: Shift elements of an array +1, [10, 20, 30, 40] -> [40, 10, 20, 30]
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
		; we accomplish the swap by keeping edi always at the last element of the array, and only incrementing esi
		; there are, algorithmically, better ways to perform this operation, but meh.
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