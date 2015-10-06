TITLE Lab 2 Chpt. 3, prob 3	, Neil Hanlon & Andrew Amorelli, 9-18-2015			(main.asm)

INCLUDE Irvine32.inc


.data
;byte, sbyte, word, sword, dword, sdword
val1 byte 0Ah
val2 sbyte -1
val3 word 0ABCDh
val4 sword -2F5Ah
val5 dword 1234ABCDh
val6 sdword -5CF3D12Ah

.code
main PROC
	call Clrscr

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov eax, val6
	call WriteInt
	call DumpRegs



	exit
main ENDP

END main