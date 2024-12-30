; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting in x86 assembly.
; The program reads a string, processes each character, and counts the words.
; A word is defined as a sequence of characters separated by spaces.

section .data
    input db 'This is a sample string to count words.', 0
    input_len equ $ - input
    weather db 0
    word_count db 0
    space db ' '

section .bss
    temp resb 1
    index resb 1

section .text
    global _start

_start:
    ; Initialize variables
    mov byte [weather], 0
    mov byte [word_count], 0
    mov byte [index], 0

    ; Loop through each character in the input string
count_loop:
    ; Load the current character
    mov al, [input + index]
    cmp al, 0
    je end_count

    ; Check if the character is a space
    cmp al, [space]
    je found_space

    ; Increment the weather variable
    inc byte [weather]

    ; Check if the previous character was a space
    cmp byte [weather], 1
    jne not_first_char

    ; Increment the word count
    inc byte [word_count]

not_first_char:
    ; Increment the index to move to the next character
    inc byte [index]
    jmp count_loop

found_space:
    ; Reset the weather variable
    mov byte [weather], 0
    jmp not_first_char

end_count:
    ; Exit the program
    mov eax, 1
    int 0x80

