.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	; define variables here

.code

main PROC
	; write your assembly code here
	mov		ax, 1
	mov		bx, 7
loopstart:
	mul bx
	sub bx, 1
	jz done
	jmp loopstart
done:

	INVOKE ExitProcess, 0
main ENDP
END main