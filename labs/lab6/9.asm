TITLE Lab 6 Problem 9

INCLUDE Irvine32.inc

.data

invalidString BYTE "Invalid", 0
validString BYTE "Valid", 0
pinPrint BYTE "The PIN under validation is: ", 0

minArr DD 5,2,4,1,3
maxArr DD 9,5,8,4,6
arr1 DD 6,4,5,3,5
arr2 DD 1,4,5,3,5
arr3 DD 8,4,5,2,5
arr4 DD 5,4,9,2,6

SPACE DD ' '

.code 

main PROC

	mov esi, OFFSET arr1
	call printArray
	call validate_pin
	call writedec
	cmp eax,0
	je CheckValid
	jmp CheckInvalid

	CheckValid:
		call printValid
		jmp SecondArrayCheck
	CheckInvalid:
		call printInvalid

	SecondArrayCheck:
		mov esi, OFFSET arr2
		call printArray
		call validate_pin
		call writedec
		cmp eax,0
		je CheckValid2
		jmp CheckInvalid2

	CheckValid2:
		call printValid
		jmp ThirdArrayCheck

	CheckInvalid2:
		call printInvalid
	
	ThirdArrayCheck: 
		mov esi, OFFSET arr3
		call printArray
		call validate_pin
		call writedec
		cmp eax,0
		je CheckValid3
		jmp CheckInvalid3

	CheckValid3:
		call printValid
		jmp FourthArrayCheck
	CheckInvalid3:
		call printInvalid

	FourthArrayCheck:
		mov esi, OFFSET arr4
		call printArray
		call validate_pin
		call writeDec
		cmp eax,0
		je CheckValid4
		jmp CheckInvalid4

	CheckValid4:
		call printValid
		jmp endMe
	CheckInvalid4:
		call printInvalid

	endMe:

	exit
main ENDP

Validate_PIN PROC USES ecx esi edi

	mov edi,0 
	mov ecx,5 
	mov eax, 0

	StepOne:
	inc eax
	mov ebx, [esi]
	cmp ebx,minArr[edi] 
	jl StepTwo
	cmp ebx,maxArr[edi]
	jg StepTwo
	add esi, 4
	add edi, 4

	cmp eax,5
	je StepThree 
	loop StepOne ; continue the loop

	StepTwo: 
	jmp L4

	StepThree:
	mov eax,0

	L4:
	ret
Validate_PIN ENDP

printValid PROC USES edx

	call writeSpace
	mov edx, OFFSET validString
	call writestring
	call crlf

ret
printValid endp

printInvalid PROC USES edx

	call writeSpace
	mov edx, OFFSET invalidString
	call writestring
	call crlf

ret
printInvalid endp

writeSpace PROC USES eax
	xchg SPACE, eax
	call writechar
	xchg SPACE,eax
ret
writeSpace endp

printArray PROC USES ecx edi eax edx

	mov edx, OFFSET pinPrint
	call writestring

	mov ecx,5
	mov edi,0

	Jimmy:

		xchg eax, [esi]
		call writeDec
		call writeSpace
		xchg eax, [esi]
		add esi,4

	loop Jimmy

	call crlf

	ret
	printArray endp

END main