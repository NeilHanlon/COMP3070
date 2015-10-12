TITLE Lab 4 Lower/Upper Limit Print, Neil Hanlon, Oct. 7th, 2015

; Description: Write a program with procedures to accept lower 
;	and upper limits from the user, and then print all numbers 
;	between those limits, inclusive.
; 
; Revision date:

INCLUDE Irvine32.inc
.data
prompt1 BYTE "Enter the lower limit: ",0
prompt2 BYTE "Enter the upper limit: ",0

.code
main PROC
	call Clrscr

	call GetNumbers

	mov eax, ebx ; move lower limit back to eax
	inc ecx ; add one to the count, because loops are not inclusive
	oranges:
		call writeint
		call crlf
		inc eax
	loop oranges

	exit
main ENDP

GetNumbers PROC
	mov edx, offset prompt1
	call GetInput
	mov ebx, eax ; lower limit in ebx
	mov edx, offset prompt2
	call GetInput
	mov ecx, eax ; upper limit in ecx for counter
	sub ecx, ebx ; upper limit - lower limit for number of times
	ret
GetNumbers ENDP

GetInput PROC
	mov eax, 0
	call WriteString
	call ReadInt
	call crlf
	ret
GetInput ENDP

END main