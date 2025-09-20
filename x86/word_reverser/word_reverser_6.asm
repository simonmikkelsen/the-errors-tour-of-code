; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, and prints the reversed string.
; The program demonstrates basic string manipulation and I/O operations in x86 Assembly.
; It is designed to help programmers understand the fundamentals of assembly language programming.

section .data
    prompt db "Enter a word: ", 0
    input db 100 dup(0)
    reversed db 100 dup(0)
    length db 0
    newline db 10, 0

section .bss
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 13         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input string
    mov ecx, input      ; pointer to the input buffer
    xor eax, eax        ; clear eax (used as a counter)
find_length:
    cmp byte [ecx + eax], 0 ; check for null terminator
    je length_found     ; if null terminator is found, jump to length_found
    inc eax             ; increment the counter
    jmp find_length     ; repeat the loop
length_found:
    mov [length], al    ; store the length of the input string

    ; Reverse the input string
    mov esi, input      ; pointer to the input buffer
    mov edi, reversed   ; pointer to the reversed buffer
    mov ecx, [length]   ; length of the input string
    dec ecx             ; adjust for zero-based index
reverse_loop:
    mov al, [esi + ecx] ; get the character from the end of the input string
    mov [edi], al       ; store the character in the reversed buffer
    inc edi             ; move to the next position in the reversed buffer
    dec ecx             ; move to the previous position in the input string
    jns reverse_loop    ; repeat the loop until ecx is negative

    ; Print the reversed string
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, reversed   ; pointer to the reversed string
    mov edx, [length]   ; length of the reversed string
    int 0x80            ; call kernel

    ; Print a newline character
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

