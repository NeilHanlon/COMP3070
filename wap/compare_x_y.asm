TITLE Compare X and Y

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data

x byte 5d
y byte 5d
xgreatermsg byte "X is greater than Y",0ah,0dh,0
ygreatermsg byte "Y is greater than Y",0ah,0dh,0
equalmsg byte "They are equal",0ah,0dh,0

.code
main PROC
	call Clrscr

	mov al, x
	cmp al, y
	jg xisgreater
	jl yisgreater
	
	mov edx, offset equalmsg
	call WriteString
	jmp towardsend

	xisgreater:
		mov edx, offset xgreatermsg
		call WriteString
		jmp towardsend

	yisgreater:
		mov edx, offset ygreatermsg
		call WriteString

	towardsend:

	exit
main ENDP

END main