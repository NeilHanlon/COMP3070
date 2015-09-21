TITLE Lab 2 Chpt. 3, prob 2						(main.asm)

INCLUDE Irvine32.inc


.data
MON = 0
TUE = 1
WED = 2
THU = 3
FRI = 4
SAT = 5
SUN = 6
days db MON,TUE,WED,THU,FRI,SAT,SUN
day_length = ($-days)
new_line BYTE " ",0dh,0ah,0

.code
main PROC
	call Clrscr

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	loop_start:
		cmp ecx, day_length
		jge loop_end

		mov al, days[ecx]
		call WriteInt

		mov edx, OFFSET new_line
		call WriteString

		inc ecx
		jmp loop_start
	loop_end:


	exit
main ENDP

END main