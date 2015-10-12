TITLE Lab 5 Problem 1, Neil Hanlon, Oct. 11 2015 (1-draw_text_colors.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data
string BYTE "Wooh! Pretty colors!",0ah,0dh, 0
colors byte red, blue, green, cyan ; color constants

.code
main PROC
	call Clrscr

	mov esi, offset colors
	mov edx, offset string
	mov eax, 0
	mov ecx, lengthof colors

	oranges:
		mov al, byte ptr [esi] ; set al to the text color
		call SetTextColor ; set the color
		call WriteString
		inc esi ; move to next color
	loop oranges

	mov eax, 15d
	call settextcolor

	exit
main ENDP

END main