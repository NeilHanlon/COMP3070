TITLE Lab 6 Problem 3

INCLUDE Irvine32.inc

.data

printScore BYTE "Score is: ", 0
printGrade BYTE "Grade is: ", 0

.code 

main PROC 
	call clrscr

	call Randomize
	mov ecx,20

	Jimmy:
		call GetScore 
	loop Jimmy

	exit
main ENDP

GetScore PROC USES eax

	mov eax,51
	call RandomRange
	add eax,50

	mov edx, OFFSET printScore
	call WriteString
	call WriteDec 

	push eax

	mov eax,0
	mov eax, 20h
	call writechar

	pop eax

	call CalcGrade 
	call crlf

	ret
GetScore endp


CalcGrade PROC USES eax edx

	cmp eax,90
	jge GradeA 

	cmp eax,80
	jge GradeB 

	cmp eax,70
	jge GradeC

	cmp eax,60
	jge GradeD 

	jmp GradeF 

	GradeA: mov al, 'A'
	mov edx,0
	mov edx, OFFSET printGrade
	call writestring
	call WriteChar
	jmp next

	GradeB: mov al, 'B'
	mov edx,0
	mov edx, OFFSET printGrade
	call writestring
	call WriteChar 
	jmp next

	GradeC: mov al, 'C'
	mov edx,0
	mov edx, OFFSET printGrade
	call writestring
	call WriteChar
	jmp next

	GradeD: mov al, 'D'
	mov edx,0
	mov edx, OFFSET printGrade
	call writestring
	call WriteChar
	jmp next

	GradeF: mov al, 'F'
	mov edx,0
	mov edx, OFFSET printGrade
	call writestring
	call WriteChar 
	jmp next

	next: call Crlf
	ret
CalcGrade ENDP


END main