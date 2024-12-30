; Program: Word Reverser
; Purpose: This program reverses the characters in a given word.
; The program reads a word from the user, reverses the characters,
; and then prints the reversed word to the screen.
; This program is designed to help programmers understand x86 Assembly
; and practice debugging skills.

section .data
    prompt db 'Enter a word: ', 0
    output db 'Reversed word: ', 0
    buffer db 256 ; Buffer to store the input word
    length db 0 ; Variable to store the length of the word

section .bss
    temp resb 1 ; Temporary storage for swapping characters

section .text
    global _start

_start:
    ; Print the prompt to the user
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, prompt ; message to write
    mov edx, 13 ; message length
    int 0x80 ; call kernel

    ; Read the input word from the user
    mov eax, 3 ; sys_read
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, buffer ; buffer to store the input
    mov edx, 256 ; maximum number of bytes to read
    int 0x80 ; call kernel

    ; Calculate the length of the input word
    mov ecx, buffer ; point to the start of the buffer
    mov edi, 0 ; initialize length counter
find_length:
    cmp byte [ecx + edi], 0 ; check for null terminator
    je length_found ; if null terminator found, jump to length_found
    inc edi ; increment length counter
    jmp find_length ; repeat until null terminator is found
length_found:
    mov [length], edi ; store the length of the word

    ; Reverse the characters in the word
    mov esi, buffer ; point to the start of the buffer
    mov edi, buffer ; point to the start of the buffer
    add edi, [length] ; point to the end of the word
    dec edi ; adjust to point to the last character
reverse_loop:
    cmp esi, edi ; check if pointers have crossed
    jge reverse_done ; if crossed, reversing is done
    mov al, [esi] ; load character from start
    mov bl, [edi] ; load character from end
    mov [esi], bl ; store end character at start
    mov [edi], al ; store start character at end
    inc esi ; move start pointer forward
    dec edi ; move end pointer backward
    jmp reverse_loop ; repeat until pointers cross
reverse_done:

    ; Print the reversed word to the user
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, output ; message to write
    mov edx, 15 ; message length
    int 0x80 ; call kernel

    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, buffer ; buffer containing the reversed word
    mov edx, [length] ; length of the reversed word
    int 0x80 ; call kernel

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80 ; call kernel

