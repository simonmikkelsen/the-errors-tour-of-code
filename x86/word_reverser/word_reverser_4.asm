; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, and prints the reversed string.
; The program demonstrates basic string manipulation in x86 Assembly language.
; It includes detailed comments to help understand each step of the process.

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
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 13         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input string
    mov ecx, input      ; pointer to the input buffer
    xor eax, eax        ; clear eax
    xor ebx, ebx        ; clear ebx
find_length:
    cmp byte [ecx + eax], 0 ; compare current byte with null terminator
    je length_found     ; if null terminator is found, jump to length_found
    inc eax             ; increment eax to move to the next byte
    jmp find_length     ; repeat the loop
length_found:
    dec eax             ; decrement eax to exclude the null terminator
    mov [length], al    ; store the length of the input string

    ; Reverse the input string
    mov ecx, input      ; pointer to the input buffer
    mov edx, reversed   ; pointer to the reversed buffer
    mov ebx, [length]   ; length of the input string
    dec ebx             ; adjust for zero-based index
reverse_loop:
    mov al, [ecx + ebx] ; get the character from the end of the input string
    mov [edx], al       ; store the character in the reversed buffer
    inc edx             ; move to the next position in the reversed buffer
    dec ebx             ; move to the previous position in the input string
    jns reverse_loop    ; repeat the loop until ebx is negative

    ; Print the reversed string
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, reversed   ; pointer to the reversed buffer
    mov edx, [length]   ; length of the reversed string
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

