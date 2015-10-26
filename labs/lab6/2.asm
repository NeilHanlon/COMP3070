TITLE Summing Array Elements in a Range (Problem2.asm)

INCLUDE Irvine32.inc

.data

  minmes BYTE "Enter the min value: ", 0
  maxmes BYTE "Enter the max value: ", 0
  first BYTE "The sum of array elements within first range: ", 0
  second BYTE "The sum of array elements within second range: ", 0
  third BYTE "Array elements: ", 0
  arrSize DWORD 10
  ar1 DWORD 1,3,13,28,42,50,64,76,99,61

.code
main PROC

  call zeroOut
  call Clrscr

  call Crlf
  call display
  call Crlf

  mov ebx, 2 ;min
  mov edx, 70 ;max

  call sumArr

  mov edx,OFFSET first
  call WriteString
  call WriteInt
  call Crlf

  mov esi,OFFSET ar1
  mov ecx,arrSize

  mov ebx, 20 ;min
  mov edx, 50 ;max

  call sumArr

  mov edx, OFFSET second
  call WriteString
  call WriteInt
  call Crlf
exit
main ENDP

sumArr PROC USES ecx esi ebx edx

  mov eax, 0
  mov esi, OFFSET ar1
  mov ecx, LENGTHOF ar1
  Lisa:
    cmp [esi], ebx
    jl Luna
    cmp [esi], edx
	jg Luna
	add eax, [esi]

	Luna:
		add esi, TYPE ar1
		loop Lisa

  ret
sumArr ENDP

display PROC USES eax esi ecx edx

  mov edx, OFFSET third
  call WriteString
  call Crlf
  mov esi, OFFSET ar1
  mov ecx, LENGTHOF ar1

  Loreta:
    mov eax, [esi]
    call WriteInt
	call Crlf
    add esi, TYPE ar1
  loop Loreta
ret
display ENDP

zeroOut PROC
  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0
  ret
zeroOut ENDP

END main
