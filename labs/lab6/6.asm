TITLE Problem6

INCLUDE Irvine32.inc
.data
  choice DWORD ?
  op1 BYTE "1. x AND y", 0
  op2 BYTE "2. x OR y", 0
  op3 BYTE "3. NOT x",0
  op4 BYTE "4. x XOR y",0
  op5 BYTE "5. Exit program",0
  chOp BYTE "What operation are you preforming: ",0
  opA BYTE "AND operation", 0
  opO BYTE "OR operation", 0
  opN BYTE "NOT operation",0
  opX BYTE "XOR operation",0
  mesOp1 BYTE "Enter one hexadecimal value: ",0
  mesOp2 BYTE "Enter two hexadecimal values (enter after each): ",0
  mesResult BYTE "The result of operation is: ",0
.code
main PROC

  call Clrscr
  call MakeMenu
  call DisOp

exit
main ENDP

MakeMenu PROC USES edx

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
  call ReadInt

  mov choice, eax
  call Crlf

ret
MakeMenu ENDP

DisOp PROC USES edx

  mov eax, choice

  cmp eax, 1
  jne Lisa

  mov edx, OFFSET opA
  call WriteString
  call Crlf
  call AND_op
  jmp Leona

  Lisa:
    cmp eax, 2
    jne Livia
    mov edx, OFFSET opO
    call WriteString
    call Crlf
    call OR_op
    jmp Leona

  Livia:
    cmp eax, 3
    jne Linda
    mov edx, OFFSET opN
    call WriteString
    call Crlf
    call NOT_op
    jmp Leona

  Linda:
    cmp eax, 4
    jne Leona
    mov edx, OFFSET opX
    call WriteString
    call Crlf
    call XOR_op

  Leona:
ret
DisOp ENDP

AND_op PROC USES ebx edx

  mov edx, OFFSET mesOp2
  call WriteString
  call Crlf

  call ReadHex
  mov ebx, eax

  call ReadHex
  AND ebx, eax
  mov eax, ebx

  mov edx, OFFSET mesResult
  call WriteString
  call WriteHex
  call Crlf
ret
AND_op ENDP

OR_op PROC USES ebx edx

  mov edx, OFFSET mesOp2
  call WriteString
  call Crlf

  call ReadHex
  mov ebx, eax
  call ReadHex
  OR ebx, eax
  mov eax,ebx

  mov edx, OFFSET mesResult
  call WriteString

  call WriteHex
  call Crlf
ret
OR_op ENDP

NOT_op PROC USES edx

  mov edx, OFFSET mesOp1
  call WriteString

  call Crlf
  call ReadHex
  NOT eax
  mov edx, OFFSET mesResult
  call WriteString
  call WriteHex
  call Crlf
ret
NOT_op ENDP

XOR_op PROC USES ebx edx

  mov edx, OFFSET mesOp2
  call WriteString
  call Crlf

  call ReadHex
  mov ebx, eax

  call ReadHex
  XOR ebx, eax
  mov eax, ebx

  mov edx, OFFSET mesResult
  call WriteString
  call WriteHex
  call Crlf
ret
XOR_op ENDP

END main
