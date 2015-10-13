TITLE Lab 5 Problem 11, Neil Hanlon, Oct 12 2015 (11-multiples_of_k.asm)

; Description: In a byte array of size N, find all multiples of K less than N,
;	and set the corresponding value on the array to 1 (high).
; Do this for K=2, and K=3
; 
; Revision date:

INCLUDE Irvine32.inc
.data
array byte 150 DUP(0)
array2 byte 150 DUP(0)
output1 byte "Divide by 2",0ah,0dh,0
output2 byte "Divide by 3",0ah,0dh,0

.code
main PROC
	call Clrscr

	mov ebx, 2
	mov esi, offset array + lengthof array - 1 ; let's go to the end of the array, to match count
	mov ecx, lengthof array
	call FindMultiples

	mov ebx, 3
	mov esi, offset array2 + lengthof array2 -1
	mov ecx, lengthof array2
	call FindMultiples

	mov esi, offset array
	mov ecx, lengthof array
	mov edx, offset output1
	call PrintByteArray

	mov esi, offset array2
	mov ecx, lengthof array2
	mov edx, offset output2
	call PrintByteArray

	exit
main ENDP

PrintByteArray PROC
	call crlf
	call writestring
	call crlf
	oranges:
		mov eax, ecx
		call writeint
		mov eax, 7Ch
		call WriteChar
		mov eax, 0
		mov al, byte ptr [esi]
		call writeint
		call crlf
		inc esi
	loop oranges
	call crlf
	ret
PrintByteArray ENDP

FindMultiples PROC
	; finds multiples of the value stored in eax, by looking at an array of N elements (esi). ecx holds count
	multiples:
		mov edx, ecx ; move count to edx. We'll now see if edx/ebx = 0
		call IsMultiple
		dec esi
	loop multiples
	ret
FindMultiples ENDP

IsMultiple PROC USES edx ecx
	;checks if edx is a multiple of ebx (eg, edx/ebx == 0?)

	mov eax, edx ; move divisor to ecx
	mov edx, 0 ; clear dividend

	div bx ; edx/ebx

	mov ecx, edx ; move remainder to ecx
	
	loop found_multiple
	; Essentially, check if ecx (now remainder) is zero.
	; If remainder == 0, edx is a multiple of ebx, and we set the value to high.
	; Otherwise, it isn't a multiple, and we just return

	mov byte ptr [esi], 1
	ret

	found_multiple:
			ret
IsMultiple ENDP

END main