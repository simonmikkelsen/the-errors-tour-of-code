; Program: Word Reverser
; Purpose: This program takes a word input from the user and reverses it.
; It demonstrates basic string manipulation and user input handling in x86 Assembly.
; The program uses various functions and variables to achieve the desired functionality.

section .data
    prompt db "Enter a word: ", 0
    input db 100 dup(0)
    length db 0
    reversed db 100 dup(0)
    temp db 0
    weather db 0

section .bss
    buffer resb 100

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 13         ; length of the prompt message
    int 0x80            ; make the syscall

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; make the syscall

    ; Calculate the length of the input
    mov ecx, input
    xor eax, eax
    dec ecx
find_length:
    inc ecx
    cmp byte [ecx], 0
    je length_found
    inc eax
    jmp find_length
length_found:
    mov [length], al

    ; Reverse the input string
    mov ecx, [length]
    dec ecx
    mov esi, input
    mov edi, reversed
reverse_loop:
    mov al, [esi + ecx]
    mov [edi], al
    inc