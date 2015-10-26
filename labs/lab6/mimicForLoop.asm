TITLE Mimic forLoop

INCLUDE Irvine32.inc
.data

  userMes BYTE "Enter an integer greater than zero to be the max of the for loop: ", 0
  outPut BYTE "ANd the sum of even numbers is: ", 0

.code
main PROC

  call zeroOut

  mov edx, OFFSET userMes
  call WriteString
  call readInt
  call crlf
  mov edi, eax
  call forLoop

exit
main ENDP

forLoop PROC

    mov ecx, 2

  Leona:
	cmp edi, ecx
    jl Lisa_Escapes
    mov eax, ecx
    call writeInt
    add ebx, ecx
    call crlf

    add ecx, 3

  Loop Leona

  Lisa_Escapes:
	call crlf
    mov edx, OFFSET outPut
    call WriteString
    mov eax, ebx
    call writeInt
	call crlf

ret
forLoop ENDP



zeroOut PROC
  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0
  mov esi, 0
  mov edi, 0

ret
zeroOut ENDP

END main
