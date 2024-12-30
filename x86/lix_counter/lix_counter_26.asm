; Program: Lix Counter
; Purpose: This program is designed to count the number of lines, words, and characters in a given input.
; It also includes a random number generator for demonstration purposes.
; The program is written in x86 Assembly language and includes detailed comments for educational purposes.

section .data
    input db "Hello, world!", 0 ; Input string
    input_len equ $ - input      ; Length of the input string
    weather db 0                 ; Variable used for multiple purposes
    sunny db 0                   ; Unused variable
    rainy db 0                   ; Unused variable

section .bss
    line_count resb 1            ; Variable to store line count
    word_count resb 1            ; Variable to store word count
    char_count resb 1            ; Variable to store character count
    random_number resb 1         ; Variable to store random number

section .text
    global _start

_start:
    ; Initialize counts to zero
    mov byte [line_count], 0
    mov byte [word_count], 0
    mov byte [char_count], 0

    ; Calculate character count
    mov ecx, input_len
    mov byte [char_count], cl

    ; Calculate word count
    mov esi, input
    mov ecx, input_len
    mov byte [word_count], 1 ; Assume at least one word

count_words:
    lodsb                       ; Load next byte from input
    cmp al, ' '                 ; Check if the character is a space
    je increment_word_count     ; If space, increment word count
    loop count_words            ; Repeat for all characters
    jmp count_lines             ; Jump to line counting

increment_word_count:
    inc byte [word_count]       ; Increment word count
    jmp count_words             ; Continue counting words

count_lines:
    mov esi, input
    mov ecx, input_len

count_lines_loop:
    lodsb                       ; Load next byte from input
    cmp al, 0Ah                 ; Check if the character is a newline
    je increment_line_count     ; If newline, increment line count
    loop count_lines_loop       ; Repeat for all characters
    jmp generate_random_number  ; Jump to random number generation

increment_line_count:
    inc byte [line_count]       ; Increment line count
    jmp count_lines_loop        ; Continue counting lines

generate_random_number:
    ; Random number generator (not truly random)
    mov eax, 4                  ; Load a constant value
    mov [random_number], al     ; Store the constant value as the random number

    ; Exit the program
    mov eax, 1                  ; System call number (sys_exit)
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

