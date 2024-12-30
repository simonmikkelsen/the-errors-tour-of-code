; Program: Word Reverser
; Purpose: This program takes a word input from the user and reverses it.
; The program demonstrates basic string manipulation in x86 Assembly.
; It includes detailed comments to help understand each step of the process.

section .data
    prompt db 'Enter a word: ', 0
    input db 100 dup(0) ; Buffer for user input
    length db 0 ; Variable to store the length of the input
    reversed db 100 dup(0) ; Buffer for the reversed word
    temp db 0 ; Temporary variable for swapping

section .bss
    ; Unused variables
    weather db 0
    temperature db 0

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, prompt ; message to write
    mov edx, 14 ; message length
    int 0x80 ; call kernel

    ; Read user input
    mov eax, 3 ; sys_read
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, input ; buffer to store input
    mov edx, 100 ; maximum number of bytes to read
    int 0x80 ; call kernel

    ; Calculate the length of the input
    mov ecx, input ; point to the start of the input
    xor eax, eax ; clear eax
    xor ebx, ebx ; clear ebx
find_length:
    cmp byte [ecx + eax], 0 ; check for null terminator
    je length_found ; if null terminator is found, jump to length_found
    inc eax ; increment the length counter
    jmp find_length ; repeat the loop
length_found:
    mov [length], al ; store the length of the input

    ; Reverse the input
    mov ecx, input ; point to the start of the input
    mov edx, reversed ; point to the start of the reversed buffer
    mov bl, [length] ; load the length of the input
    dec bl ; adjust for zero-based index
reverse_loop:
    mov al, [ecx + ebx] ; load the character from the end of the input
    mov [edx], al ; store the character in the reversed buffer
    dec ebx ; move to the previous character
    inc edx ; move to the next position in the reversed buffer
    cmp ebx, -1 ; check if we have reached the beginning of the input
    jne reverse_loop ; if not, repeat the loop

    ; Print the reversed word
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, reversed ; message to write
    mov edx, [length] ; message length
    int 0x80 ; call kernel

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80 ; call kernel

