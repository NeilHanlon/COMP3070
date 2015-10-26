TITLE Lab 6 Problem #infinity, Neil Hanlon, Raymond Deng, Michael Welch, Zach Zeigler, Oct 24, 2015 (string_operations.asm)

; Description: ReadInpStr procedure to read in a string
; countvowels procedure to count number of vowels
; reversestring procedure to reverse
; count number of words (count hex 20)
; capitalize the first letter of each word.
; 
; Revision date:

lowa = 61h
lowe = 65h
lowi = 69h
lowo = 6fh
lowu = 75h
capA = 41h
capE = 45h
capI = 49h
capO = 4eh
capU = 55h
space = 20h


INCLUDE Irvine32.inc
.data

;defines for program
vowels byte lowa, capa, lowe, cape, lowi, capi, lowo, capo, lowu, capu
lowercase byte 61h, 62h, 63h, 64h, 65h, 66h, 67h, 68h, 69h, 6Ah, 6Bh, 6Ch, 6Dh, 6Eh, 6Fh, 70h, 71h, 72h, 73h, 74h, 75h, 76h, 77h, 78h, 79h, 7Ah

;user stuff
user_string byte 1000 dup(0)
strlen word 0

; prompts
prompt_readinpstr byte "Enter a string, followed by the return key: ",0ah,0dh,0

; outputs
out_vowelnum byte "The number of vowels is: ",0
out_reverse byte "The string in reverse is: ",0
out_wordnum byte "The total number of words is: ",0
out_original byte "The original input was: ",0

; random bullshit
genericcounter byte 0

.code
main PROC
	call Clrscr

	call clearreg

	call ReadInpStr

	exit
main ENDP

ReadInpStr PROC

	mov edx, offset prompt_readinpstr
	call writestring
	mov ecx, 1000 ; this will be the max length of the string
	call ReadString
	mov strlen, ax; move actual input length to memory
	mov esi, offset user_string
	call StringToMem

	call crlf

	;do the things
	movzx ecx, strlen
	call CountVowels
	call ReverseString
	call CountWords
	call CapFirst

	mov edx, offset out_original
	call writestring
	mov edx, offset user_string
	call writestring

	call crlf

	ret
ReadInpStr ENDP

CountVowels PROC uses esi ecx
	; counts the number of vowels by comparing it to each value in the vowels array
	; loops through esi, increments "genericcounter" variable when a vowel is encountered

	mov genericcounter, 0

	oranges:

		mov edi, offset vowels
		push ecx
		mov ecx, lengthof vowels

		seven:
			mov al, byte ptr [esi]
			mov ah, byte ptr [edi]
			cmp ah, al
			je foundvowel
			inc edi
		loop seven

		goback:
			inc esi
			pop ecx

	loop oranges
	jmp theend

	foundvowel:
		inc genericcounter
		jmp goback

	theend:
		mov eax, 0
		mov al, genericcounter
		mov edx, offset out_vowelnum
		call writestring
		call writedec
		call crlf

	ret
CountVowels ENDP

ReverseString PROC uses esi ecx
	; esi = what to write (pls be at end offset arr+lengthof arr-1)
	; ecx = how many
	; writes byte by byte

	movzx eax, strlen
	add esi, eax
	dec esi

	mov edx, offset out_reverse
	call WriteString

	oranges:
		mov al, byte ptr [esi]
		call writechar
		dec esi
	loop oranges

	call crlf

	ret
ReverseString ENDP

CountWords PROC uses esi ecx
	; ptr to array in esi, length in ecx
	; counts number of spaces (20h) in word, stores in generic counter.
	; number of words is spaces + 1

	mov genericcounter, 1 ; start at 1 becuase even if we don't find a space, it's still one word

	oranges:
		mov al, byte ptr [esi]
		cmp al, space
		je foundspace
		
		goback:
			inc esi
	loop oranges
	jmp theend

	foundspace:
		; we're going to cheat here and also capitalize the first letter of each word while we're at it
		inc esi ; move to the letter after the space
		mov al, [esi]
		call TransformUpper
		mov [esi], al
		dec esi ; go back

		inc genericcounter
		jmp goback

	theend:
		mov edx, offset out_wordnum
		movzx eax, genericcounter
		call writestring
		call writedec
		call crlf
	ret
CountWords ENDP

CapFirst PROC
	; capitalizes the first byte of what's in esi by subtracting 20h

	mov al, [esi]
	call TransformUpper
	mov [esi], al

	ret
CapFirst ENDP

TransformUpper PROC uses esi ecx
	;takes letter in al. If it's a lowercase letter (in range 61-7A), it will be replaced with the uppercase version of itself (-20h)

	mov esi, offset lowercase
	mov ecx, lengthof lowercase
	oranges:
		cmp al, byte ptr [esi]
		je foundlower
		inc esi
	loop oranges
	jmp theend

	foundlower:
		; we've determined that al is a lowercase letter.
		sub al, 20h ; subtract 20h from the letter

	theend:

	ret
TransformUpper ENDP

StringToMem PROC uses esi ecx
	;edx contains memory location of the string at pos0, read through byte by byte and store in esi
	mov ecx, 0
	mov cx, strlen
	oranges:
		mov al, byte ptr [edx]
		mov byte ptr [esi], al
		inc esi
		inc edx
	loop oranges

	ret
StringToMem ENDP

clearreg proc
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	ret
clearreg endp

END main