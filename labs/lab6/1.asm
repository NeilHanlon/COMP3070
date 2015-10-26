TITLE Lab6 Problem 1

INCLUDE Irvine32.inc

.data

askN BYTE "Enter the amount of elements in the array",0
askLower BYTE "Enter the lower limit of the array",0
askUpper BYTE "Enter the upper limit of the array",0
arraySize DWORD ?
randArray DWORD 100 DUP (?)

.code 

main PROC

	mov edx, OFFSET askN
	call writestring
	call crlf
	call readint
	mov arraySize, eax

	mov eax,0
	mov edx,0
	mov edx, OFFSET askLower
	call writestring
	call crlf
	call readint
	mov ebx, eax

	mov eax,0
	mov edx,0
	mov edx, OFFSET askUpper
	call writestring
	call crlf
	call readint
	mov edx,0
	mov edx, eax

	mov esi,OFFSET randArray
	mov ecx,arraySize

	call Randomize

	Jimmy:

		mov eax,edx
		sub eax,ebx
		inc eax
		call randomRange
		add eax,ebx
		mov [esi],eax
		add esi,4

	loop Jimmy

	call printLimitArray

exit
main ENDP

printLimitArray PROC USES esi ecx edi
	mov eax,0
	mov esi, OFFSET randArray
	mov ecx, arraySize

	Jim:
		mov eax,[esi]
		call writeint
		call crlf
		add esi,4
	loop Jim

	ret
printLimitArray endp

END main