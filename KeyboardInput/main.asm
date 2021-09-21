.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	; define variables here

.code

main PROC
	MOV cx, 0Eh
begin:
	
	;Read character
	MOV ah, 0
	INT 16h
	
	;check for special keys
	CMP ah, 1 ; escape
	JE ender
	CMP ah, 1Ch ; enter
	je ender
	CMP AH, 0Eh
	je backspace

	MOV di, cx
	MOV [156h+edi], al
	INC cx
	MOV ah, 0Eh
	MOV bh, 0
	MOV bl, 7
	int 10h
	JMP begin

backspace:
	MOV al, 8
	MOV ah, 0Eh
	MOV bh, 0
	MOV bl, 7
	INT 10h
	MOV al, 20h
	MOV AH, 9
	MOV bh, 0
	MOV bl, 7
	int 10h
	dec cx
	jmp begin

ender:
	push cs
	pop ds
	mov si, 156h

looper:
	lodsb
	mov ah, 0eh
	mov bh, 0
	mov bl, 7
	int 10h
	dec cx
	cmp cx, 0
	jne looper

	INVOKE ExitProcess, 0
main ENDP
END main