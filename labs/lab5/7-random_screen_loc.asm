TITLE Lab 5 Problem 7, Neil Hanlon, Oct 11, 2015

; Description: Display a single char at 100 different screen locations, pausing 100ms between moving around.
; 
; Revision date:

INCLUDE Irvine32.inc
.data
myMessage BYTE "MASM program example",0dh,0ah,0

.code
main PROC
	call Clrscr
	call Randomize

	mov ecx, 100
	oranges:
		Call WriteCharInPlace
		mov eax, 100d
		call delay
	loop oranges

	exit
main ENDP

WriteCharInPlace PROC
	call PickRandomLoc
	Call GoToXY
	mov eax, 40h
	call WriteChar
	ret
WriteCharInPlace ENDP

PickRandomLoc PROC
	mov eax, 0
	;rows
	mov al, 25d
	call RandomRange
	mov dh, al

	;cols
	mov al, 80d
	call RandomRange
	mov dl, al

	ret
PickRandomLoc ENDP

END main