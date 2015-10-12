TITLE Lab 5 Problem 9, Neil Hanlon, Oct 11 2015 (9-recursive.asm)

; Description: Write a recursive procedure that executes a fixed number of time using only loop calls--no conditional exits
; 
; Revision date:

INCLUDE Irvine32.inc
.data

.code
main PROC
	call Clrscr

	mov ecx, 10 ; loop 7 times
	mov eax, 1
	mov ebx, 2
	mov edx, 0
	call RecurseSum
	
	exit
main ENDP

RecurseSum PROC uses eax ebx

	; add eax and ebx, write the sum
	add eax, ebx
	call WriteInt
	call crlf

	inc edx ; increase our counter 

	;push ecx and eax (counter, and running sum)
	push ecx
	push eax

	sub ecx, edx ; subtract edx from ecx to. Essentially, if ecx is now zero, we're on the second to last run
	inc ecx ; because we want to go +1 more time for the full value
	
	loop oranges ; call loop here. If ecx != we go to the next line, which returns from the procedure.
	ret
	oranges: ; otherwise, we go to this label, and continue
		pop eax
		pop ecx
		call RecurseSum
RecurseSum ENDP

END main