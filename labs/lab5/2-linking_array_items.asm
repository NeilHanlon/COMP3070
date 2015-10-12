TITLE Lab 5 Problem 2, Neil Hanlon, Oct. 11, 2015 (2-linking_array_items.ams)

; Description: Essentially, linked lists in MASM
; 
; Revision date:

INCLUDE Irvine32.inc
.data
output1 byte "Original array", 0ah, 0dh, 0
output2 byte "Traveresed/Sorted array", 0ah, 0dh, 0

input_array byte "H","A","C","E","B","D","F","G"
links dword 0d,4d,5d,6d,2d,3d,7d,0d
final_array byte LENGTHOF input_array DUP(?)
links_type byte type links

.code
main PROC
	call Clrscr
	
	mov eax, 0
	mov esi, offset links + 4 ; starting at first array value in esi, to read the next value
	mov edi, offset final_array ; creating new array
	mov ecx, lengthof input_array ; counter
	mov edx, 1 ; this will be the way we reference input array. It should hold the position we are at in the links array, zero indexed

	oranges:
		mov eax, 0
		mov al, input_array[edx] ; get the value we want from the input array, and put it in the new array
		mov [edi], al ; store it into the new, "sorted" array
		call GetNextValue
	loop oranges

	mov edx, offset output1
	call WriteString
	mov esi, offset input_array
	mov ecx, lengthof input_array
	call PrintByteArray

	call crlf
	
	mov edx, offset output2
	call WriteString
	mov esi, offset final_array
	mov ecx, lengthof final_array
	call PrintByteArray

	exit
main ENDP

GetNextValue PROC

	; Moves edi, esi, and edx to the next correct values for them to continue the loop
	; namely, edi goes to the next memory locaiton of the output array
	; edx gets set to the value of the current pointer in the links array (points to the next input_array index)
	; esi gets moved to the beginning of the links array again, but we then take edx, multiply by four (because it's a dword array)
	;		and then move esi to (offset links + 4*edx), where edx is the pointer of the links array to the next array value.
	; Yes. It's confusing. I'm not entirely sure how I got it to work right on my first attempt. Quite frankly, it scares me.
	
	inc edi ; move to the next part of the output array
	mov edx, [esi] ; set edx to the value of the link for this variable
	mov esi, offset links; move links pointer to edx*4 (memory location of the next link)
	mov eax, edx ; temporarily put this here
	mul links_type ; multiply by four to get the right address value
	add esi, eax ; mov esi to the right memory address
	
	ret
GetNextValue ENDP

PrintByteArray PROC
	; Assuming esi and ecx have been put correctly at the start of the array, and the length, respectively
	mov edx, 0

	print_array:
		mov al, byte ptr [esi]
		call WriteChar
		call CrLf
		inc esi
	loop print_array

	ret
PrintByteArray ENDP

END main