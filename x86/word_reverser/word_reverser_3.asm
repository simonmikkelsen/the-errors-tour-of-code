; Program: Word Reverser
; Purpose: This program reads a word from the user, reverses it, and prints the reversed word.
; The program demonstrates basic string manipulation in x86 Assembly.
; It includes detailed comments to explain each step of the process.

section .data
    prompt db "Enter a word: ", 0
    buffer db 256 dup(0)
    reversed db 256 dup(0)
    length db 0
    newline db 10, 0

section .bss
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 13         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input word
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, buffer     ; pointer to the buffer
    mov edx, 256        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input word
    mov ecx, buffer     ; pointer to the buffer
    xor edi, edi        ; index for the length
find_length:
    cmp byte [ecx + edi], 0xA ; check for newline character
    je length_found
    inc edi
    jmp find_length
length_found:
    mov [length], edi   ; store the length of the word

    ; Reverse the word
    mov esi, buffer     ; source pointer
    mov edi, reversed   ; destination pointer
    mov ecx, [length]   ; length of the word
    dec ecx             ; adjust for zero-based index
reverse_loop:
    mov al, [esi + ecx] ; get the character from the end of the word
    mov [edi], al       ; store it in the reversed buffer
    inc edi
    dec ecx
    jns reverse_loop    ; continue until ecx is negative

    ; Print the reversed word
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, reversed   ; pointer to the reversed word
    mov edx, [length]   ; length of the reversed word
    int 0x80            ; call kernel

    ; Print a newline
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

