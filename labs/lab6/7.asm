TITLE Lab 6 Problem 8 -- Probabilities and Colors, Neil Hanlon, Raymond Deng, Michael Welch, Zach Zeigler, Oct 24, 2015 (8.asm)


; Description: Write 20 lines of text with random colors.
; 30% white, 10% blue, 60% green
; we can accomplish this by generating a random number between 0 and 9 (ten numbers).
; Getting 0, 1, or 2 will make the text white.
; 3 will make the text blue
; 4..9 will make the text green.
; 
; Revision date:

INCLUDE Irvine32.inc

.data
output_string BYTE "Oranges are made of green beans.",0ah,0dh,0

.code
main PROC

	call Clrscr 
	mov ecx,10

	start:
		call OutputTextInColor
		call Crlf
	loop start 

	exit
main ENDP

OutputTextInColor PROC USES ecx eax edx
	; Displays the text with a different color

	mov ecx,20
	oranges:
		mov eax,10
		call RandomRange ; generate int in 0..9
		cmp eax,2

		ja areweblue ; above 2, move to label areweblue

		; otherwise, we're between 0 and 2, and we should be white
		mov eax, white

		jmp writewithcolor

		areweblue:
		cmp eax,3
		jne arewegreen ; if the random number isn't three, jump to label arewegreen

		; if 3, choose blue
		mov eax, blue

		jmp writewithcolor

		arewegreen:
		mov eax, green


		writewithcolor:
		call settextcolor
		mov edx,OFFSET output_string
		call WriteString
		call Crlf
	loop oranges

	mov eax, white + (black*16) ; reset to white on black
	call settextcolor
	ret

OutputTextInColor ENDP

END main
