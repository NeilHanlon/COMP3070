TITLE Lab 4 Problem 5, Neil Hanlon, Oct. 6, 2015

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr

	mov ecx, 7

	mov ebx, 1
	mov edx, 1

	oranges:
		call Fib
		call crlf
	loop oranges

	exit
main ENDP

Fib PROC
	; calculate a value of the fibonacci sequence, seeded by ebx=(n-1), edx=(n-2), mov ebx to edx, store in ebx 

	push ebx ; push previous val into stack, we're going to overwrite it
	add ebx, edx ; add prev = prev+prev-1
	mov edx, ebx ; copy ebx to edx temporarily
	pop ebx ; pop (n-1) (prev, now n-2) into ebx
	xchg ebx, edx ; put (n-1) and (n-2) into the correct positions for function
	mov eax, ebx
	call writeint

	ret
Fib ENDP

END main