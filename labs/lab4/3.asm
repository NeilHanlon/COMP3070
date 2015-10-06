TITLE Lab 4 Problem 3, Neil Hanlon, October 6th, 2015 (3.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
array1 dword 0d, 2d, 5d, 9d, 10d, 15d, 23d
sum dword 0
text byte "The sum is: ",0

.code
main PROC
	call Clrscr

	; print sum of gaps of array elements
	; loop through, subtract i+1 - i, add to sum

	mov esi, offset array1
	mov ecx, lengthof array1

	oranges:
		mov eax, [esi] ; 0
		add esi, type array1
		mov ebx, [esi] ; 2
		sub ebx, eax ; 2 - 0 = 2
		add sum, ebx ; sum = 2
	loop oranges

	call crlf

	mov edx, offset text
	call writestring
	mov eax, sum
	call writeint
	call crlf

	exit
main ENDP

END main