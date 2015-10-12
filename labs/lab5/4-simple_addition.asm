TITLE Lab 5 Problem 4, Neil Hanlon, Oct. 11 2015 (4-simple_addition.asm)

; Description: Use the solution to problem 3 to loop three times and get the information.
; 
; Revision date:

INCLUDE Irvine32.inc
.data

prompt BYTE "Enter an integer: ",0
prompt2 BYTE "Enter another integer: ", 0
output BYTE "The sum of those two integers is: ",0
two byte 2

.code
main PROC
	call Clrscr

	mov ecx, 3
	oranges:
		call RunInstance
	loop oranges

	exit
main ENDP

RunInstance PROC USES ecx
	call Clrscr
	mov ecx, 0 ; for MoveToMiddleOffset usage

	call GetIntegers
	add eax, ebx
	call WriteOutput

	call waitmsg

	ret
RunInstance ENDP

WriteOutput PROC
	; Assume output is in eax as integer/hex
	push eax ; push to stack because we're overwriting it
	mov eax, lengthof output
	mov edx, offset output
	inc cl

	call MoveToMiddleOffset
	call WriteString

	pop eax ; pop from stack to write sum
	call WriteInt
	call crlf

	ret
WriteOutput ENDP

GetIntegers PROC
	; get an integer, put first in eax, second in ebx
	mov eax, lengthof prompt
	mov edx, offset prompt
	call MoveAndPrompt
	push eax
	mov eax, lengthof prompt2
	mov edx, offset  prompt2
	inc cl
	call MoveAndPrompt
	mov ebx, eax
	pop eax
	ret
GetIntegers ENDP

MoveAndPrompt PROC
	; Move to middle, and prompt for input.
	; Assume eax contains string length, and edx contains the address of the prompt
	call MoveToMiddleOffset
	call WriteString
	call ReadInt
	ret
MoveAndPrompt ENDP

MoveToMiddleOffset PROC USES edx
	; Move cursor to the middle of the window, offset by half the prompt (negative) to center the text.
	; eg, if the window is 80px wide by 25px tall, and the prompt is 18 characters,
	;	move to 12 in the y direction, and move to (40-(18/2)) in the x direction.
	; assume eax has already been moved to the length of the string you're writing
	mov dh, 10
	add dh, cl
	mov dl, 40d
	div two
	sub dl, al
	sub dl, 2
	call GoToXY
	ret
MoveToMiddleOffset ENDP

END main