; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program is designed to help programmers understand the fundamentals of assembly language.
; It includes detailed comments to explain each step of the process.

section .data
    inputString db 'Hello, this is a sample string with some lix characters.', 0
    lixChar db 'l'
    count db 0
    length db 0
    temp db 0
    weather db 0

section .bss
    result resb 1

section .text
    global _start

_start:
    ; Initialize variables
    mov esi, inputString
    mov ecx, 0

    ; Calculate the length of the input string
calculate_length:
    mov al, [esi + ecx]
    cmp al, 0
    je length_calculated
    inc ecx
    jmp calculate_length

length_calculated:
    mov length, cl

    ; Reset the counter
    mov count, 0

    ; Loop through the string to count 'lix' characters
count_lix:
    mov al, [esi]
    cmp al, 0
    je done_counting
    cmp al, lixChar
    jne next_char
    inc count

next_char:
    inc esi
    jmp count_lix

done_counting:
    ; Store the result in the result variable
    mov [result], count

    ; Exit the program
    mov eax, 1
    int 0x80

