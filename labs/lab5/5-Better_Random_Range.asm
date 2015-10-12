TITLE Lab 5 Problem 5, Neil Hanlon, Oct. 11 2015

; Description: Create a BetterRandomRange procedure that generates a
;	pseudorandom number between M and N-1. ebx = lower range, eax = upper range
;	By using randomrange from 0 to N-M, and then adding M to the answer, we effectively use the range M to N-1
; Revision date:

INCLUDE Irvine32.inc
.data
prompt byte "Enter the lower limit: ",0
prompt2 byte "Enter the upper limit: ",0
output byte "A random number in that range is: ",0

.code
main PROC
	call Clrscr

	call randomize

	call GetRange

	; we have an upper and lower limit in ebx and eax, respectively.
	mov ecx, 50
	oranges:
		call BetterRandomRange
		xchg eax, edx
		call writeint
		xchg eax, edx
		call crlf
	loop oranges

	exit
main ENDP

BetterRandomRange PROC USES eax ebx
	;generate a random number between ebx and eax. Store in edx
	; upper = ebx, lower = eax
	mov edx, eax ; store lower limit in edx
	sub ebx, eax ; upper - lower = width
	mov eax, ebx ; move width to eax for random
	inc eax ; inclusive range
	call randomrange ; generate number between below width
	add edx, eax ; add lower limit to random number

	ret
BetterRandomRange ENDP

GetRange PROC
	; get range, put lower limit in eax, upper limit in ebx
	mov eax, lengthof prompt
	mov edx, offset prompt
	call PromptInt

	push eax

	mov eax, lengthof prompt2
	mov edx, offset  prompt2
	call PromptInt

	mov ebx, eax

	pop eax
	ret
GetRange ENDP

PromptInt PROC
	call WriteString
	call ReadInt
	ret
PromptInt ENDP

END main