TITLE Lab 6 User supplied array min/max, Neil Hanlon, Oct 24, 2015 (user_array.asm)

; Description: Write a procedure to get the user to input an integer array one element at a time
; If the intger is negative, ignore it, and ask the user to input a non-negative integer. (sep. proc)
; Terminate array with 0
; Now, ask the user if they want to calculate the min/max of the array in a seperate procedure
; Offer a choice to repeat
; 
; Revision date:

INCLUDE Irvine32.inc
.data

initialDisplay byte "You will enter a series of postive integers, followed by the return key.",0ah,0dh,"When you're done entering values, enter a 0.",0ah,0dh,0
prompt byte "Enter an integer: ",0
negativeEntered byte "You entered a negative integer. Only positive integers are allowed.",0ah,0dh,0
invalidresponse byte "Invalid repsonse entered.",0ah,0dh,0

minmax_prompt byte "Would you like to calculate the min/max of your array?",0ah,0dh,"Enter 0 for no, 1 for min, 2 for max, 3 to dump array: ",0
repeat_prompt byte "Would you like to repeat the operation (y/N)? ",0

maxoutput byte "The largest element in the array you entered is: ", 0
minoutput byte "The smallest element in the array you entered is: ", 0

user_array dword 1000 DUP(0)
count byte 0
output dword 0

capN byte 4Eh
lowY byte 79h

.code
main PROC
	call Clrscr

	seven:
		call GetArray
		call AskRepeat
		cmp edx, 1
		je seven

	exit
main ENDP

AskRepeat PROC
	; asks a question. if input is y/Y, store a 1 in edx, Otherwise store a 0 (or really, anything. who cares.)
	promptarea:
	
		mov edx, offset repeat_prompt
		call WriteString
		call ReadChar

		cmp al, lowY
		je affirmative

		cmp al, capN
		je isaidno
	
		badinput:
			mov edx, offset invalidresponse
			call writestring
			jmp promptarea

	affirmative:
		mov edx, 1
		ret

	isaidno:
		mov edx, 0
		ret

	ret
AskRepeat ENDP

GetArray PROC
	call Clrscr
	mov count, 0
	mov edx, offset initialDisplay
	call writestring

	mov esi, offset user_array

	GetIntL:
		call GetInt
		cmp eax, 0
		jg InsertElem
		jl NegativeInput
		je TheEnd

	InsertElem:
		inc count
		mov [esi], eax
		add esi, type user_array
		jmp GetIntL

	NegativeInput:
		mov edx, offset negativeEntered
		call writestring
		jmp GetIntL

	TheEnd:
		mov edx, offset minmax_prompt
		call WriteString
		Call Readint
		call SwitchOnInput

	ret
GetArray ENDP

SwitchOnInput PROC
	; 0 = exit, 1 = getmin, 2 = getmax, 3 = dumparr
	; compare eax

	cmp eax, 3
	je printoutarray
	jg getoutofhere

	cmp eax, 2
	je getmaxelem

	cmp eax, 1
	je getminelem
	jl getoutofhere

	PrintOutArray:
		Call DumpArr
		jmp getoutofhere

	GetMaxElem:
		Call GetMax
		jmp getoutofhere

	GetMinElem:
		Call GetMin
		jmp getoutofhere

	GetOutOfHere:

	ret
SwitchOnInput ENDP

GetMin PROC
	; get value in esi, if it's smaller than what's in the output dword value, store it in the output var

	mov esi, offset user_array
	movzx ecx, count
	mov eax, [esi]
	mov output, eax

	oranges:
		mov eax, [esi]
		mov ebx, output
		add esi, type user_array
		cmp eax, ebx ; if current esi is bigger than output is currently, replace it
		jl itslesser
	loop oranges

	mov edx, offset minoutput
	mov eax, output
	call FormatStringIntOutput
	ret ; exit early

	itslesser:
		mov output, eax
		loop oranges
	ret
GetMin ENDP

FormatStringIntOutput PROC
	;takes string in edx, int in eax. writes in form "edx + eax"
	call writestring
	call writeint
	call crlf

	ret
FormatStringIntOutput ENDP

GetMax PROC
	; get value in esi, if it's bigger than what's in the output dword value, store it in the output var

	mov esi, offset user_array
	movzx ecx, count
	mov eax, [esi]
	mov output, eax

	oranges:
		mov eax, [esi]
		mov ebx, output
		add esi, type user_array
		cmp eax, ebx ; if current esi is bigger than output is currently, replace it
		jg itsgreater
	loop oranges

	mov edx, offset maxoutput
	mov eax, output
	call FormatStringIntOutput
	ret ; exit early

	itsgreater:
		mov output, eax
		loop oranges

	ret
GetMax ENDP

GetInt PROC
	mov edx, offset prompt
	call WriteString
	call ReadInt

	ret
GetInt ENDP

DumpArr PROC
	mov esi, offset user_array
	movzx ecx, count
	printout:
		mov eax, [esi]
		call Writeint
		call crlf
		add esi, type user_array
	loop printout
	
	ret
DumpArr ENDP

END main