; Program: Word Reverser
; Purpose: This program reverses the characters in a given word.
; It demonstrates basic string manipulation in x86 Assembly.
; The program reads a word from the user, reverses it, and prints the reversed word.
; It also includes a random number generator for demonstration purposes.

section .data
    prompt db 'Enter a word: ', 0
    output db 'Reversed word: ', 0
    buffer db 100 dup(0)
    length db 0
    random_seed db 42 ; Seed for the random number generator

section .bss
    reversed resb 100

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 13
    int 0x80

    ; Read the input word
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 100
    int 0x80

    ; Calculate the length of the input word
    mov ecx, buffer
    xor edi, edi
find_length:
    cmp byte [ecx + edi], 0
    je length_found
    inc edi
    jmp find_length
length_found:
    mov [length], edi

    ; Reverse the word
    mov esi, buffer
    mov edi, reversed
    mov ecx, [length]
reverse_loop:
    dec ecx
    js reverse_done
    mov al, [esi + ecx]
    stosb
    jmp reverse_loop
reverse_done:

    ; Print the reversed word
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 16
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, reversed
    mov edx, [length]
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Random number generator function
random_number:
    mov al, [random_seed]
    add al, 13 ; Increment the seed by a constant value
    mov [random_seed], al
    ret

