TITLE Lab 5 Problem 6, Neil Hanlon, Oct 11 2015 (6-random_strings.asm)

; Description: Create a proceedure that generates a random string of length L
;	containing all capital letters. Pass L in eax to the proceedures
;	also pass a pointer to a byte array to hold the string.
;	Run it 20 times and display the strings generated
; 
; Revision date:

INCLUDE Irvine32.inc
.data
caps BYTE "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
prompt byte "Enter a string length: ",0
output BYTE 100 dup(0)

.code
main PROC
	call Clrscr
	call Randomize ; seed

	call GetStringLength ;store in eax

	mov ecx, 20
	write_strings:
		mov esi, offset output ; pointer to ouput variable
		call RandomString
		mov edx, offset output
		call WriteString
		call crlf
	loop write_strings
	exit
main ENDP

GetStringLength PROC
	mov edx, offset prompt
	call Writestring
	call readint
	ret
GetStringLength ENDP

RandomString PROC USES ecx
	mov ecx, eax ; counter to string length
	oranges:
		call RandomChar ; stores char ascii value in ebx
		mov byte ptr [esi], bl
		inc esi
	loop oranges

	ret
RandomString ENDP

RandomChar PROC uses esi eax
	mov ebx, 0
	mov eax, 26d; we're picking something between 0 and 25 (so +1 for randomrange) (a letter)
	call RandomRange ; generate a number between 0 and eax-1
	mov esi, offset caps
	add esi, eax
	mov bl, byte ptr [esi]
	ret
RandomChar ENDP

END main