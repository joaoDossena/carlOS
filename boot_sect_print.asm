print:
		pusha

	string:mov al, [bx] ; Moving to register al the first byte of the string of which the base address is bx
		cmp al, 0 ; Testing for null byte (that means the string has ended) 
		je end ; if(string[i] == 0) {return}

		mov ah, 0x0e ; tty mode
		int 0x10 ; else {print string[i]}
		add bx, 1 ; Increments pointer
		jmp string
	end:
		popa
		ret

print_nl:
	pusha

	mov ah, 0x0e ; tty mode
	mov al, 0x0a ; New line char
	int 0x10
	mov al, 0x0d ; Carriage return
	int 0x10

	popa
	ret

