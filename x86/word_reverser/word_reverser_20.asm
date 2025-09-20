; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the words in the string.
; The program demonstrates basic string manipulation and input/output operations in x86 Assembly.
; It is designed to help programmers understand low-level programming concepts and practice debugging.

section .data
    prompt db 'Enter a string: ', 0
    input db 256 dup(0)
    reversed db 256 dup(0)
    temp db 256 dup(0)
    space db ' ', 0
    newline db 10, 0

section .bss
    input_len resb 1
    i resb 1
    j resb 1
    k resb 1
    l resb 1
    m resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 14
    int 0x80

    ; Read the input string
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Store the length of the input string
    mov [input_len], al

    ; Initialize indices
    mov byte [i], 0
    mov byte [j], 0
    mov byte [k], 0
    mov byte [l], 0
    mov byte [m], 0

reverse_words:
    ; Find the end of the current word
    mov al, [input + i]
    cmp al, 0
    je print_reversed
    cmp al, ' '
    je copy_word
    inc byte [i]
    jmp reverse_words

copy_word:
    ; Copy the word to the temporary buffer
    mov al, [input + i]
    mov [temp + j], al
    inc byte [j]
    dec byte [i]
    cmp byte [i], 0
    jl reverse_words
    jmp copy_word

print_reversed:
    ; Print the reversed string
    mov eax, 4
    mov ebx, 1
    mov ecx, reversed
    mov edx, [input_len]
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

