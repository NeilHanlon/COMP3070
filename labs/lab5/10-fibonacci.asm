TITLE Lab 5 Problem 10, Neil Hanlon, Oct 11 2015 (10-fibonacci.asm)

; Description: Write a procedure to produce N values in the fib. series and store them in a dword array
;	Input params:
;		- Pointer to dword array (esi)
;		- Counter of number of values to generate (N -> ecx)
;	Test:
;		N = 47
;		Firstval = 1
;		lastval = 2971215073
; 
; Revision date:

INCLUDE Irvine32.inc
.data
prompt byte "Enter the number of fibonacci numbers you wish to generate: ",0
array DWORD 900 dup(?)

.code
main PROC
	call Clrscr

	mov edx, offset prompt
	call WriteString
	call readint
	
	mov ecx, eax
	mov esi, offset array

	push ecx

	call GenerateFib

	mov esi, offset array

	pop ecx

	print_arr:
		mov eax, [esi]
		call WriteInt
		call crlf
		add esi, 4
	loop print_arr

	exit
main ENDP

GenerateFib PROC 
	;array ptr in esi, counter in ecx. Generate (ecx) numbers of fibonacci series
	; 1, 2, 3, 5, 8
	
	;We must seed esi with the first value.. 1, and put a 1 in edx, as well
	mov eax, 1
	mov [esi], eax
	mov edx, 1
	mov ebx, 1
	add esi, 4
	oranges:
		call Fib ; we now have the current fib in eax
		mov [esi], eax
		mov ebx, eax
		add esi, 4
	loop oranges
	ret
GenerateFib ENDP

Fib PROC
	; calculate a value of the fibonacci sequence
	; @params ebx=previous value, edx = previous, previous value

	push ebx ; push previous val into stack, we're going to overwrite it
	add ebx, edx ; add prev = prev+prev-1
	mov edx, ebx ; copy ebx to edx temporarily
	pop ebx ; pop (n-1) (prev, now n-2) into ebx
	xchg ebx, edx ; put (n-1) and (n-2) into the correct positions for function
	mov eax, ebx

	ret
Fib ENDP

END main