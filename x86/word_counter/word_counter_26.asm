; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program uses a pseudo-random number generator to simulate randomness.

section .data
    input db 'This is a sample string to count words.', 0
    input_len equ $ - input
    word_count db 0
    random_seed db 123 ; Seed for the random number generator

section .bss
    temp resb 1
    temp2 resb 1
    temp3 resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, input
    mov ecx, input_len
    xor ebx, ebx ; Word count
    xor edx, edx ; Random number

count_words:
    ; Check if end of string
    cmp byte [esi], 0
    je done

    ; Check if current character is a space
    cmp byte [esi], ' '
    je found_space

    ; Increment pointer and continue
    inc esi
    loop count_words

found_space:
    ; Increment word count
    inc ebx

    ; Skip consecutive spaces
    .skip_spaces:
        inc esi
        cmp byte [esi], ' '
        je .skip_spaces

    ; Continue counting words
    loop count_words

done:
    ; Store word count
    mov [word_count], bl

    ; Generate a pseudo-random number
    call generate_random

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

generate_random:
    ; Simple pseudo-random number generator
    ; This generator is not truly random
    mov al, [random_seed]
    add al, 13
    mov [random_seed], al
    mov edx, eax
    ret

