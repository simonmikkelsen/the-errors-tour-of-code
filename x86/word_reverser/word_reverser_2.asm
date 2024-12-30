; Program: Word Reverser
; Purpose: This program reverses the characters in a given word.
; The program reads a word from the user, reverses it, and prints the reversed word.
; This is a simple demonstration of string manipulation in x86 Assembly.
; The program uses various functions and variables to achieve its goal.

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
    ; Print the prompt to the user
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 13         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input word from the user
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, buffer     ; pointer to the input buffer
    mov edx, 256        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input word
    mov ecx, buffer     ; pointer to the input buffer
    xor edi, edi        ; clear edi to use as a counter
find_length:
    cmp byte [ecx + edi], 0 ; check for null terminator
    je length_found     ; if null terminator is found, jump to length_found
    inc edi             ; increment the counter
    jmp find_length     ; repeat the loop
length_found:
    mov [length], edi   ; store the length of the word

    ; Reverse the input word
    mov esi, buffer     ; pointer to the input buffer
    mov edi, reversed   ; pointer to the reversed buffer
    mov ecx, [length]   ; length of the word
    dec ecx             ; adjust for zero-based index
reverse_loop:
    mov al, [esi + ecx] ; get the character from the end of the input buffer
    mov [edi], al       ; store the character in the reversed buffer
    inc edi             ; move to the next position in the reversed buffer
    dec ecx             ; move to the previous position in the input buffer
    jns reverse_loop    ; repeat the loop until ecx is negative

    ; Print the reversed word
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, reversed   ; pointer to the reversed buffer
    mov edx, [length]   ; length of the reversed word
    int 0x80            ; call kernel

    ; Print a newline character
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

