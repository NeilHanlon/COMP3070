TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
save_flags byte ?

.code
main PROC
	call Clrscr

	mov eax, 1
	mov ebx, 2
	sub eax, ebx

	mov eax, 0

	lahf

	call dumpregs
	call writebin

	AND ah, 99h
	call crlf

	call writebin

	; test if zero flag is 0/1

	test ah, 08h

	exit
main ENDP

END main