TITLE Compare a,b,c

; Description: Compare if a > b, a>c, b>c
; 
; Revision date:

INCLUDE Irvine32.inc
.data

x sdword 5d
y sdword 1d
z sdword 10

XgreaterYmsg byte "X is greater than Y", 0ah, 0dh, 0
XgreaterZmsg byte "X is greater than Z", 0ah, 0dh, 0
YgreaterZmsg byte "Y is greater than Z", 0ah, 0dh, 0
XequalYmsg byte "X = Y", 0ah, 0dh, 0
XequalZmsg byte "X = Z", 0ah, 0dh, 0
YequalZmsg byte "Y = Z", 0ah, 0dh, 0

isgreatermsg byte " is greater.", 0ah, 0dh, 0

greater sdword 0

.code
main PROC
	call Clrscr

	mov eax, x
	mov ebx, y
	call GreaterEQ

	mov eax, greater
	call writeint
	mov edx, offset isgreatermsg
	call writestring



	theend:

	exit
main ENDP

GreaterEQ PROC
	; takes left hand in eax, right hand in ebx. cmp = eax - ebx
	;	if stores the greater of the two in mem: "greater"
	;	if equal, greater=0

	cmp eax, ebx
	jg isgreater
	jl islower

	mov greater, 0
	jmp finish

	isgreater:
		mov greater, eax
		jmp finish

	islower:
		mov greater, ebx

	finish:

	ret
GreaterEQ ENDP

END main