print_hex:
		pusha

		mov cx, 0 ;Counter

	hex_loop:
		cmp cx, 4 ;Loops 4 times
		je stop

		mov ax, dx ;Using ax as the working register
		and ax, 0x000f ;Mask to get the last hexadecimal digit
		add ax, 0x30 ;Transforming that digit into ASCII
		cmp ax, 0x39 ;Checking if digit is greater than 9
		jle step2
		add al, 7 ;To get the correct ASCII code

	step2: 
		; 2. get the correct position of the string to place our ASCII char
    	; bx <- base address + string length - index of char
    	mov bx, HEX_OUT + 5 ; base + length
    	sub bx, cx  ; our index variable
    	mov [bx], al ; copy the ASCII char on 'al' to the position pointed by 'bx'
    	ror dx, 4 ; 0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234

    	; increment index and loop
    	add cx, 1
    	jmp hex_loop

	stop:
		mov bx, HEX_OUT
		call print


		popa 
		ret

HEX_OUT:
db '0x0000', 0