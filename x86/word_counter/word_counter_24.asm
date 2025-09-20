; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It reads a string from the user, processes it, and outputs the word count.
; The program demonstrates basic string manipulation and counting techniques in x86 Assembly.
; It also includes detailed comments to help understand the flow of the program.

section .data
    prompt db "Enter a string: ", 0
    input db 100 dup(0)
    word_count_msg db "Word count: ", 0
    word_count db 0
    space db ' '

section .bss
    count resb 1
    index resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 14
    int 0x80

    ; Read the input string
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80

    ; Initialize variables
    mov byte [count], 0
    mov byte [index], 0
    mov byte [temp], 0

    ; Loop through the input string
count_words:
    mov al, [input + byte [index]]
    cmp al, 0
    je done_counting

    ; Check if the current character is a space
    cmp al, [space]
    je found_space

    ; Check if the current character is not a space
    cmp byte [temp], 0
    jne increment_index

    ; Increment the word count
    inc byte [count]
    mov byte [temp], 1

increment_index:
    inc byte [index]
    jmp count_words

found_space:
    mov byte [temp], 0
    jmp increment_index

done_counting:
    ; Store the word count
    mov [word_count], byte [count]

    ; Print the word count message
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count_msg
    mov edx, 12
    int 0x80

    ; Print the word count
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

