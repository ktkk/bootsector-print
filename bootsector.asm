; boot sector that prints a message to the screen

[org 0x7c00]		; memory offset

	JMP start
message:
	DB 'Hello World!', 0x0a, 0x0d 
	DB 0

start:
	MOV BX, message	; move message in to BX register
	CALL print

	JMP $		; jump to current adress
			; infinite loop

print:
	PUSHA		; clean A
.loop:
	MOV AL, [BX]	; get character from BX

	MOV AH, 0x0e	; request BIOS TTY mode
	INT 0x10	; raise video service interrupt

	INC BX		; get next character from message

	CMP AL, 0	; check if end
	JNZ .loop	; if not end, repeat

	POPA		; if end, put A back & return
	RET

	; last 2 bytes must be the magic number 0xaa55
	; pad out the rest of the boot sector with 0's
	; 512 minus 2 for the magic number, minus the space for the previous code
	TIMES 510 - ($-$$) DB 0
	DW 0xaa55
