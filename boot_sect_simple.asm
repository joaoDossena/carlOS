; A simple boot sector program that loops forever
; Infinite loop (e9 fd ff)

[org 0x7c00]

mov ah, 0x0e ; tty mode


mov al, 'C' ; Moves 'H' to register al
int 0x10      ; Interruption
mov al, 'a'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10

mov al, '1'
int 0x10
mov al, the_secret
int 0x10

mov al, '2'
int 0x10
mov al, [the_secret]
int 0x10

mov al, '3'
int 0x10
mov al, [the_secret + 0x7C00]
int 0x10

mov al, '4'
int 0x10
mov al, [0x7C3f]
int 0x10

jmp $ ; jump to current address = infinite loop

the_secret:
	db "X"

; Fill with 510 zeros minus the size of the previous code
times 510 - ($-$$) db 0
; Magic number
dw 0xaa55