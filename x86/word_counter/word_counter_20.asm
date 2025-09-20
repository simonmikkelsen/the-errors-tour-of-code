; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program reads a string from the user, processes it, and outputs the word count.
; Note: This program is for educational purposes and demonstrates various assembly instructions.

section .data
    prompt db "Enter a string: ", 0
    input db 100 dup(0)
    word_count_msg db "Word count: ", 0
    word_count db 0

section .bss
    count resb 1
    index resb 1
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

    ; Initialize variables
    mov byte [count], 0
    mov byte [index], 0
    mov byte [temp], 0

    ; Process the input string
process_string:
    mov al, [input + byte [index]]
    cmp al, 0
    je done_processing

    ; Check if the character is a space or newline
    cmp al, ' '
    je increment_count
    cmp al, 10
    je increment_count

    ; Move to the next character
    inc byte [index]
    jmp process_string

increment_count:
    ; Increment the word count
    inc byte [count]
    ; Move to the next character
    inc byte [index]
    jmp process_string

done_processing:
    ; Print the word count message
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count_msg
    mov edx, 12
    int 0x80

    ; Print the word count
    movzx eax, byte [count]
    add eax, '0'
    mov [temp], al
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

