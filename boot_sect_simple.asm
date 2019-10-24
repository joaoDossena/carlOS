; A simple boot sector program that loops forever
; Infinite loop (e9 fd ff)

mov ah, 0x0e ; tty mode

mov al, 'H' ; Moves 'H' to register al
int 0x10      ; Interruption
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10

jmp $ ; jump to current address = infinite loop

; Fill with 510 zeros minus the size of the previous code
times 510 - ($-$$) db 0
; Magic number
dw 0xaa55