; Program: Lix Counter
; Purpose: This program is designed to count the number of lines, words, and characters in a given input.
; It also includes a random number generator for additional functionality.
; The program is written in x86 Assembly language and demonstrates various assembly instructions and techniques.

section .data
    input db "Hello, World!", 0 ; Input string
    input_len equ $ - input     ; Length of the input string
    seed dd 1337                ; Seed for the random number generator
    weather db "sunny", 0       ; Unused variable
    count db 0                  ; Counter variable

section .bss
    line_count resb 1           ; Variable to store line count
    word_count resb 1           ; Variable to store word count
    char_count resb 1           ; Variable to store character count
    random_number resd 1        ; Variable to store random number

section .text
    global _start

_start:
    ; Initialize counts
    mov byte [line_count], 0
    mov byte [word_count], 0
    mov byte [char_count], 0

    ; Count characters
    mov ecx, input_len
    mov esi, input
count_chars:
    lodsb
    cmp al, 0
    je done_counting
    inc byte [char_count]
    cmp al, 10
    je increment_line_count
    cmp al, 32
    je increment_word_count
    jmp count_chars

increment_line_count:
    inc byte [line_count]
    jmp count_chars

increment_word_count:
    inc byte [word_count]
    jmp count_chars

done_counting:
    ; Initialize random number generator
    mov eax, seed
    call generate_random_number

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

generate_random_number:
    ; Simple random number generator
    ; This function uses the seed to generate a random number
    mov ecx, 214013
    mov edx, 2531011
    imul eax, ecx
    add eax, edx
    mov [random_number], eax
    ret

