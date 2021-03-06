TITLE MASM Lab6Extra


INCLUDE Irvine32.inc

.data
Heading BYTE "X Y Z (X&&(Y||NOT Z))",0

T1 BYTE 0,0,0,0,1,1,1,1
T2 BYTE 0,0,1,1,0,0,1,1
T3 BYTE 0,1,0,1,0,1,0,1
space DD ' '

.code 

main PROC

mov eax,0
mov esi,0
mov ecx,8
mov edx, OFFSET Heading
call writestring
call crlf

Jimmy:
	call writeTruthLine
	inc esi
Loop Jimmy



exit
main ENDP

writeSpace PROC USES eax

mov eax, SPACE
call writechar

ret
writeSpace endp

writeTruthLine PROC 

mov al, t1[esi]
call writedec
call writespace
mov al, t2[esi]
call writedec
call writespace
mov al, t3[esi]
call writedec
call writespace

cmp t1[esi],1
je checkY
mov al, 0
call writeIndent
call writedec
call crlf
jmp endMe

checkY:
	cmp t2[esi],1
	jne checkZ
	mov al,1
	call writeIndent
	call writeDec
	call crlf
	jmp endMe

checkZ:
	cmp t3[esi], 0
	je printTrue
	mov al,0
	call writeIndent
	call writedec
	call crlf
	jmp endMe

printTrue:
	mov al,1
	call writeIndent
	call writedec
	call crlf


endMe:
ret
writeTruthLine endp

writeIndent PROC USES eax ecx

mov ecx, 5

Jim:
call writeSpace
loop Jim

ret
writeIndent endp


END main
