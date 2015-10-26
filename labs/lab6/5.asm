TITLE Boolean Calculator(1) (boolCaLisa.asm)

INCLUDE Irvine32.inc
.data

  oprTable BYTE '1'
  DWORD Pres_1
  EntrySize = ($-oprTable)
  BYTE '2'
  DWORD Pres_2
  BYTE '3'
  DWORD Pres_3
  BYTE '4'
  DWORD Pres_4
  BYTE '5'
  DWORD Pres_5
  CountEntries = ($-oprTable) / EntrySize

  op1 BYTE "1. x AND y", 0
  op2 BYTE "2. x OR y", 0
  op3 BYTE "3. NOT x",0
  op4 BYTE "4. x XOR y",0
  op5 BYTE "5. Exit",0
  chOp BYTE "Enter your choice: ",0

  opA BYTE "AND op", 0
  opOr BYTE "OR op", 0
  opN BYTE "NOT op",0
  opX BYTE "XOR op",0

.code
main PROC

  call Clrscr
  call mkMenu

exit
main ENDP

mkMenu PROC USES edx

  mov edx, OFFSET op1
  call WriteString
  call Crlf

  mov edx, OFFSET op2
  call WriteString
  call Crlf

  mov edx, OFFSET op3
  call WriteString
  call Crlf

  mov edx, OFFSET op4
  call WriteString
  call Crlf

  mov edx, OFFSET op5
  call WriteString
  call Crlf

  mov edx, OFFSET chOp
  call WriteString
  call ReadChar
  ;mov edx, eax
  mov esi,OFFSET oprTable

  mov ecx, CountEntries
  call showOp
  call Crlf
  ret
mkMenu ENDP

showOp PROC USES esi ecx eax edx
	Lisa:
  	cmp al,[esi]
  	jne Leona
  	call NEAR PTR [esi+1]
  	call Crlf
  	jmp Lareta
    Leona:
      add esi, CountEntries
      loop Lisa
    Lareta:
ret
showOp ENDP

Pres_1 PROC USES edx
	mov edx, OFFSET opA
	call WriteString
ret
Pres_1 ENDP

Pres_2 PROC USES edx
	mov edx, OFFSET opOr
	call WriteString
ret
Pres_2 ENDP

Pres_3 PROC USES edx
	mov edx, OFFSET opN
	call WriteString
ret
Pres_3 ENDP

Pres_4 PROC USES edx
	mov edx, OFFSET opX
	call WriteString
ret
Pres_4 ENDP

Pres_5 PROC USES edx
ret
Pres_5 ENDP

zeroOut PROC
  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0
ret
zeroOut ENDP

END main
