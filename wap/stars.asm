TITLE Draw Stars						(stars.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr

	call randomize

	mov eax, 0
	mov edx, 0
	mov ecx, 25

	call SetColor

	oranges:
		call drawstar
	loop oranges

	exit
main ENDP

SetColor proc
	mov eax, white + (blue * 16)
	call SetTextColor
SetColor endp

DrawStar proc
	call RandCol
	call RandRow
	call GoToXY
	mov al, '*'
	call writechar
DrawStar endp

RandCol proc
	mov al, 80
	call RandomRange
	dec al
	mov dl, al
	ret
RandCol endp

RandRow proc
	mov al, 25
	call RandomRange
	dec al
	mov dh, al
	ret
RandRow endp
	

END main