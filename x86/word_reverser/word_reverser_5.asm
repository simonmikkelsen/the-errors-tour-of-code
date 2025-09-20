; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the string.
; The reversed string is then printed to the console.
; This program is designed to help programmers understand the basics of string manipulation in x86 Assembly.
; It includes detailed comments to explain each step of the process.

section .data
    prompt db "Enter a word: ", 0
    input db 100 dup(0)
    output db 100 dup(0)
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
    mov edx, 14         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input string
    mov ecx, input      ; pointer to the input buffer
    mov edi, 0          ; initialize length counter
find_length:
    cmp byte [ecx + edi], 0 ; check for null terminator
    je reverse_string       ; if null terminator, end of string
    inc edi                 ; increment length counter
    jmp find_length         ; repeat until null terminator

reverse_string:
    ; Reverse the string
    mov esi, input      ; pointer to the input buffer
    mov edi, output     ; pointer to the output buffer
    dec edi             ; off by one error
    mov ecx, length     ; length of the string
reverse_loop:
    mov al, [esi + ecx - 1] ; get character from end of input
    mov [edi + ecx - 1], al ; store character in output
    loop reverse_loop       ; repeat for all characters

    ; Print the reversed string
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, output     ; pointer to the output buffer
    mov edx, length     ; length of the output string
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

