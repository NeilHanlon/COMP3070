.data

x db 10q ; 8h
y dw 89h
z dd 12345h

.code

mov eax, 1000 ; 03E8h
mov ebx, 2000 ; 07D0h
mov ecx, 3000 ; 0BB8h
mov edx, 4000 ; 0FA0h

movzx esi, x ; 00000008h
movsx edi, y ; 00000089
inc ah ; ????04E8
dec al ; ????04E7
xor si, di ; 0100 XOR 0089 == 189 si=0189
;	 0000000100000000 
;XOR 0000000010001001
;    0000|0001|1000|1001
;       0    1    8    9

and bx, cx ; 07D0h AND 0BB8h == 0
;	 0000010111010000
;AND 0000101110111000
;	 0000|1111|1111|1000
or cx, dx
test dl, 10100000b
jz simon
and dl, 10100000b

simon:
	and dl, 0