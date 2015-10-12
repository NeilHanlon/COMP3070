TITLE Lab 5 Problem 8, Neil Hanlon, Oct 11 2015 (8-color_matrix.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
char byte 40h
row byte 00
sixteen byte 16

.code
main PROC
	call Clrscr

	mov ecx, 16 ; 16 possible background colors
	mov eax, 0 ; starting color, black/black
	mov edx, 0 ; row/col at 0,0

	background:
		push ecx ; save loop counter for background
		mov dh, row ; set row
		call Gotoxy ; go to row
		mov ecx, 16 ; 16 foreground colors

		inner:
			call SetTextColor
			push eax ; save foreground
			mov al, 40h ; move to character to write
			call writechar
			pop eax
			inc al ; move to next foreground color
		loop inner

		inc row ; go to next row
		pop ecx ; restore outer loop counter
	loop background

	call crlf
	mov eax, lightGray ; restore text/bg colors
	call SetTextColor
	

	exit
main ENDP

END main