; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates basic string processing and counting techniques in x86 Assembly.
; The program reads a string from the user, processes it to count the words, and outputs the result.

section .data
    prompt db 'Enter a string: ', 0
    buffer db 256 dup(0)
    buffer_len equ $ - buffer
    word_count_msg db 'Word count: ', 0
    result db 0

section .bss
    count resb 1
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
    mov ecx, buffer
    mov edx, buffer_len
    int 0x80

    ; Initialize variables
    mov byte [count], 0
    mov byte [temp], 0
    mov esi, buffer

    ; Count the words in the string
count_words:
    lodsb
    cmp al, 0
    je done
    cmp al, ' '
    je space_found
    cmp al, 10
    je space_found
    jmp count_words

space_found:
    inc byte [count]
    jmp count_words

done:
    ; Print the word count message
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count_msg
    mov edx, 12
    int 0x80

    ; Print the word count result
    mov al, [count]
    add al, '0'
    mov [result], al
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80









