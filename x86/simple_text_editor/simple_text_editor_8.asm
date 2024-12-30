; Welcome, noble programmer, to the realm of the simple text editor!
; This program is designed to enchant you with its simplicity and elegance,
; while providing a delightful experience of editing text in the mystical world of x86 Assembly.
; Prepare yourself for a journey through the arcane arts of low-level programming,
; where every instruction is a spell and every register a magical artifact.

section .data
    ; Behold, the sacred buffer where text shall be stored
    buffer db 256 dup(0)
    ; The length of the text, a number of great importance
    length db 0

section .bss
    ; The ephemeral input character, fleeting as the wind
    input_char resb 1

section .text
    global _start

_start:
    ; The grand loop begins, where the magic happens
    call read_input
    call process_input
    call display_text
    jmp _start

read_input:
    ; Summon the input from the user
    mov eax, 3          ; The syscall number for sys_read
    mov ebx, 0          ; File descriptor 0 (stdin)
    mov ecx, input_char ; The address of the input character
    mov edx, 1          ; Read one byte
    int 0x80            ; Invoke the kernel
    ret

process_input:
    ; The sacred ritual of processing the input
    mov al, [input_char]
    cmp al, 10          ; Check if the input is a newline
    je end_input        ; If so, end the input
    mov ecx, length     ; Load the length of the text
    mov [buffer + ecx], al ; Store the input character in the buffer
    inc length          ; Increase the length of the text
end_input:
    ret

display_text:
    ; The grand display of the text
    mov eax, 4          ; The syscall number for sys_write
    mov ebx, 1          ; File descriptor 1 (stdout)
    mov ecx, buffer     ; The address of the buffer
    mov edx, length     ; The length of the text
    int 0x80            ; Invoke the kernel
    ret

