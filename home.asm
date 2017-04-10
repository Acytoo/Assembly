;判断给定的两个数是否都是正数，负数，还是一正一负，或者有0
;2017-04-10 22:54:45

assume cs:code, ds:data
data segment
ARDX	db	2h
ARDY	db	4h
FLAG	db	1
data ends

code segment
start:	mov ax, data
		mov ds, ax
		mov bx, 0
		mov al, [bx]
		inc bx
		mov ah, [bx]
	
		cmp al, 0	;第一个是正数
		jg do1
		
		cmp al, 0	;第一个是负数
		jl do3
		
		;如果第一个为0，则肯定是第三种情况，直接跳转
		
		jmp do	

do:		mov cx, 0ffh	;第一个正数，第二个负数,或者有0出现
		mov bx, 3
		mov [bx], cx
		jmp exit		
				
do1:	cmp ah, 0	;比较另一个是不是正数
		jg do2
		jmp do
				
do2:	mov cx, 0	;两个都是正数
		mov bx, 3
		mov [bx], cx
		jmp exit
		
do3:	cmp ah, 0	;第二个是不是正数
		jl do4
		jmp do
				
do4:	mov cx, 1
		mov bx, 3
		mov [bx], cx
		jmp exit
		
exit:	mov ax, 4c00h
		int 21h
code ends
end start