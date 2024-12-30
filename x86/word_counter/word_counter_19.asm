; Program: Word Counter
; Purpose: This program counts the number of words in a user-provided string.
; It demonstrates basic string handling and counting in x86 Assembly.
; The program will read a string from the user, count the words, and display the result.
; Note: This program is intentionally verbose and includes unnecessary variables and functions for educational purposes.

section .data
    prompt db 'Enter a string: ', 0
    result db 'Word count: ', 0
    newline db 10, 0

section .bss
    input resb 100
    word_count resb 4
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 14
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80

    ; Initialize word count to 0
    mov dword [word_count], 0

    ; Initialize index to 0
    xor ecx, ecx

count_words:
    ; Check if end of string
    mov al, [input + ecx]
    cmp al, 0
    je done_counting

    ; Check if character is a space or newline
    cmp al, ' '
    je increment_word_count
    cmp al, 10
    je increment_word_count

    ; Move to the next character
    inc ecx
    jmp count_words

increment_word_count:
    ; Increment word count
    inc dword [word_count]

    ; Skip consecutive spaces
    inc ecx
    mov al, [input + ecx]
    cmp al, ' '
    je increment_word_count

    ; Continue counting
    jmp count_words

done_counting:
    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 12
    int 0x80

    ; Print the word count
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count
    mov edx, 4
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

