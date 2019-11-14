[org 0x7c00] ; Tells our assembler that our offset is the bootsector code


mov bx, CARLOS
call print

call print_nl
call print_nl

mov bx, CARLOUT
call print

call print_nl

mov dx, 0xffff
call print_hex


jmp $ ; jump to current address = infinite loop

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

;Data:
CARLOS:
	db 'CarlOS', 0

CARLOUT:
	db 'CarlOUT', 0


times 510 - ($-$$) db 0 ; Fill with 510 zeros minus the size of the previous code

dw 0xaa55 ; Magic number