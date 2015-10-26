TITLE Lab 6 Problem 8, Mike Welch 10/26/2015		(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
MAX = 128

.data
initMes db "Enter a string: ", 0
encryptMes db "The encrypted string is: ",0
decryptMes db "The decrypted string is: ",0
encryptString db MAX + 1 DUP (0)
stringSize dd ?
key db "YjE4!h"
keySize dd 6

.code
main PROC
	call stringPrompt
	call encrypt	
	mov edx, offset encryptMes
	call printArray
	call encrypt	
	mov edx, offset decryptMes
	call printArray

	exit
main ENDP

stringPrompt proc USES ecx edx
	mov edx, offset initMes
	call writestring	
	mov ecx, MAX
	mov edx, offset encryptString
	call readstring
	mov stringSize, eax	

ret
stringPrompt endp

encrypt proc USES esi ecx edi
	mov edi, 0
	mov esi, 0
	mov ecx, stringSize
	Toucan:
		mov dl, encryptString[esi]
		xor dl, key[edi]
		mov encryptString[esi], dl
		inc esi
		inc edi
		cmp edi, keySize
		je Sam
		Sam:
			mov edi, 0
			loop Toucan
	
	ret
encrypt endp

printArray proc USES edx
	call writestring
	mov edx, offset encryptString	
	call writestring
	call crlf

	ret
printArray endp

END main