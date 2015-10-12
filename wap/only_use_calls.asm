TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
prompt byte "Enter an integer: ",0
val sdword 0
count word 0

.code
main PROC
	call Clrscr

	call get_ints ; int1 -> ebx, int2 -> ecx
	call addition
	call subtraction
	call multiplication
	call division

	exit
main ENDP

get_ints PROC
	mov edx, offset prompt
	call writestring

	call readint
	mov ebx, eax

	call writestring
	call readint
	mov ecx, eax

	ret
get_ints ENDP

addition PROC
	mov eax, ebx
	add eax, ecx
	call writeint_newline
	ret
addition ENDP

subtraction PROC
	mov eax, ebx
	sub eax, ecx
	call writeint_newline
	ret
subtraction ENDP

multiplication PROC
	mov eax, ebx
	mov val, ecx
	mov edx, 0
	
	oranges:
		add edx, eax
	loop oranges
	mov ecx, val
	xchg eax, edx

	call writeint_newline
	ret
multiplication ENDP

division PROC
	mov eax, ebx ; int1 -> eax
	mov edx, ecx ; int2 -> edx
	mov ecx, ebx ; int1 -> ecx for counter. int1 / int2 <= int1

	seven:
		inc ecx
		sub eax, edx ; int1 - int2 -> int1 
		inc count ; count = quotient
	loop seven

	xchg eax, edx

	call writeint_newline
	ret
division ENDP

writeint_newline PROC
	call writeint
	call crlf
	ret
writeint_newline ENDP

END main