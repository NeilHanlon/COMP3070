TITLE Random Arrays				(random_arrays.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
array_b BYTE 100 DUP(?)
array_w WORD 100 DUP(?)
array_dw DWORD 100 DUP(?)

.code
main PROC
	call Clrscr
	
	call randomize

	mov ecx, lengthof array_b
	
	oranges:
		call random32
		mov 
	loop oranges

	exit
main ENDP

END main