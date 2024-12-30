; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program reads a string from the user, processes it, and outputs the word count.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    length db 0
    wordCount db 0
    space db ' ', 0
    newline db 10, 0
    msg db 'Word count: ', 0

section .bss
    temp resb 1

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
    mov edx, 100
    int 0x80

    ; Store the length of the input
    mov [length], al

    ; Initialize word count to 0
    mov byte [wordCount], 0

    ; Initialize index to 0
    mov ecx, 0

count_words:
    ; Check if we reached the end of the string
    mov al, [input + ecx]
    cmp al, 0
    je print_result

    ; Check if the current character is a space or newline
    cmp al, [space]
    je increment_word_count
    cmp al, [newline]
    je increment_word_count

    ; Move to the next character
    inc ecx
    jmp count_words

increment_word_count:
    ; Increment the word count
    inc byte [wordCount]

    ; Skip consecutive spaces
skip_spaces:
    inc ecx
    mov al, [input + ecx]
    cmp al, [space]
    je skip_spaces
    cmp al, [newline]
    je skip_spaces

    jmp count_words

print_result:
    ; Print the word count message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 12
    int 0x80

    ; Print the word count
    mov eax, 4
    mov ebx, 1
    mov ecx, wordCount
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80










