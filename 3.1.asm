TITLE Lab2 - Chpt 3. Problem 1						(3.1.asm)

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov al, 0Fh ; 15d
	mov bl, 2h ; 2d
	mov cl, 8h ; 8d
	mov dl, 0Ah; 10d
	call DumpRegs

	add al, bl ; 15d+2d = 17d
	call DumpRegs
	add cl, dl ; 8d+10d = 18d
	call DumpRegs
	sub cl, al ; 18d-17d = 1d
	mov al, cl ; move result to a

	call WriteInt

	call DumpRegs

	exit
main ENDP

END main