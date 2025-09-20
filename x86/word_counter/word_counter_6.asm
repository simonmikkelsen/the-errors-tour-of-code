; Program: Word Counter
; Purpose: This program counts the number of words in a given input string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program reads an input string, processes it to count the words, and outputs the result.
; It is designed to be verbose with comments to help new programmers understand each step.

section .data
    input db "This is a sample input string to count words.", 0
    input_len equ $ - input
    space db ' '
    newline db 10
    null db 0

section .bss
    word_count resb 1
    temp resb 1
    temp2 resb 1
    temp3 resb 1

section .text
    global _start

_start:
    ; Initialize variables
    mov byte [word_count], 0
    mov esi, input
    mov ecx, input_len

    ; Loop through each character in the input string
count_words:
    cmp ecx, 0
    je done_counting

    ; Load the current character
    lodsb
    cmp al, [space]
    je found_space

    ; Check if the character is a newline
    cmp al, [newline]
    je found_space

    ; If the character is not a space or newline, continue
    jmp continue_loop

found_space:
    ; Increment the word count when a space or newline is found
    inc byte [word_count]

continue_loop:
    ; Decrement the counter and loop
    dec ecx
    jmp count_words

done_counting:
    ; Output the word count
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

