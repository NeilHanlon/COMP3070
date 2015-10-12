TITLE MASM Template						(main.asm)

; Description: Read a string, write the string length, the string, and the reversed string
; 
; Revision date:

INCLUDE Irvine32.inc
.data
string byte 50 dup(0)
rstring byte 50 dup(0)
strlen dword ?
prompt byte "Enter a string: ",0
outputs byte "The length of the string is: ",0

.code
main PROC
	call Clrscr

	mov edx, offset prompt
	call WriteString
	mov edx, offset string
	mov ecx, 50 ; because apparently we can't just get an arbitrary string length
	call ReadString
	call crlf

	call ReverseString

	mov edx, offset outputs
	call WriteString
	call WriteInt
	call crlf

	call waitmsg

	mov edx, offset string
	call WriteString
	call CrLf

	call waitmsg

	mov edx, offset rstring
	call WriteString
	call CrLf



	exit
main ENDP

ReverseString PROC USES eax
	mov esi, offset string; move to the end of the string
	mov edi, offset rstring;  write to the beginning of this memory variable
	add edi, eax; add the string length (-1) to get to the end of the string in the second (target) memory variable
	dec edi ; 
	mov ecx, eax ; stringlen into counter

	oranges:
		mov al, byte ptr [esi]
		mov [edi], al
		inc esi
		dec edi
	loop oranges

	ret
ReverseString ENDP

END main