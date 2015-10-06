TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data
sum dd 0

.code
main PROC
	call Clrscr

	mov eax, 5
	add eax, 6
	mov sum, eax
	call WriteInt

	exit
main ENDP

END main