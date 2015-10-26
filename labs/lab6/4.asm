TITLE MASM Lab6

INCLUDE Irvine32.inc

TRUE = 1
FALSE = 0

.data

gradeAverage DWORD ?
credits DWORD ?
OkToRegister BYTE ?


promptGradeAvg BYTE "Enter grade average between 0 and 400: ", 0
promptCredits BYTE "Enter credits between 1 to 30: ", 0
printCredOutOfRange BYTE "The credits are not within the range",0
printCanReg BYTE "The student can register.",0
printCannotReg BYTE "The student cannot register.",0


.code 

main PROC

	call clrscr

	mov edx, OFFSET promptGradeAvg
	call WriteString
	call ReadInt

	mov gradeAverage,eax
	call Crlf 
	mov edx, OFFSET promptCredits
	call WriteString 
	call ReadInt 
	mov credits,eax
	call Crlf 

	call registerDecision

	exit
main ENDP

registerDecision PROC USES edx

	mov OkToRegister,FALSE
	cmp credits,1
	jl ErrorMessage
	cmp credits,30
	jg ErrorMessage
	jmp Check1
	ErrorMessage:
		mov edx, OFFSET printCredOutOfRange
		call WriteString
		jmp EndProc

	Check1:
		cmp gradeAverage,350
		jle Check2
		mov OkToRegister,TRUE
		jmp PrintTrueFalse

	Check2:
		cmp gradeAverage,250
		jge Check3
		cmp credits,16
		jg Check3
		mov OkToRegister,TRUE
		jmp PrintTrueFalse

	Check3:
		cmp credits,12
		jg PrintTrueFalse
		mov OkToRegister,TRUE

	PrintTrueFalse:
		cmp OkToRegister,0
		je NotReg
		mov edx, OFFSET printCanReg
		call WriteString 
		jmp EndProc

	NotReg:
		mov edx, OFFSET printCannotReg
		call WriteString 

	EndProc:
		call Crlf

	ret
registerDecision ENDP

END main