TITLE Lab 6 Problem 10 -- parity checking, Neil Hanlon, Raymond Deng, Michael Welch, Zach Zeigler, Oct 24, 2015 (10.asm)

; This program checks arrays for even or odd parities
INCLUDE Irvine32.inc

.data

arr1 byte 0,0,1,0,1,0,0,0,1,1
arr2 byte 1,0,0,0,0,1,0,0,0,1
paritycounter byte 0

evenOutput byte "Parity: Even", 0ah, 0dh, 0
oddOutput byte "Parity: Odd", 0ah, 0dh, 0
blockOutputSlice byte "Checking block: ",0

.code
main PROC
	call Clrscr

	;check parity of arr1
	mov esi,  offset arr1 
	mov ecx, lengthof arr1
	
	call Display
	call ParityCheck
	call OutputParity
	
	; check parity of arr2
	mov esi,  offset arr2
	mov ecx, lengthof arr2
	
	call Display
	call ParityCheck
	call OutputParity
	
	exit
main ENDP

OutputParity PROC
	;compares output of paritycheck procedure to determine even/odd parity
	cmp eax,0
	je isodd ; if eax is zero, the parity is odd.
	
	mov edx,  offset evenOutput
	call WriteString 
	jmp theend
	
	isodd:
		mov edx, offset oddOutput
		call WriteString

	theend:
		call crlf
	ret
OutputParity ENDP

ParityCheck PROC USES ecx esi edi
	; checks arrays for even or odd parities
	; Receives: ESI=address of array, ECX=length of array
	; Returns: EAX= 1 for even parity or 0 for odd parity

	mov eax, 0
	mov edi, 0
	mov paritycounter, 0

	oranges:
		mov al, byte ptr [esi]
		xor al, 0 ; XOR the data bits with 0
		jpe storeven
		goback:
		inc esi
		loop oranges

		xor paritycounter, 0
		jpe iseven
		jpo isodd

	storeven:
		inc paritycounter
		jmp goback
	iseven:
		mov eax, 1 ; true (even)
		jmp theend
	isodd:
		mov eax, 0 ; false (odd)
	theend:
	ret
ParityCheck ENDP

Display PROC USES esi ecx edx

	; displays array elements
	; Receives: ESI=address of array, ECX=length of array
	; Returns: Nothing

	mov edx, offset blockOutputSlice
	call WriteString
	
	oranges:
		mov eax, [esi] 
		call WriteDec
		inc esi 
	loop oranges 
	
	call Crlf
	ret
Display ENDP

END main