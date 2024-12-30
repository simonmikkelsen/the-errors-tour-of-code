; Program: Word Counter
; Author: [Your Name]
; Date: [Date]
; Description: This program counts the number of words in a given input string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program uses a random number generator to simulate some randomness in the process.

section .data
    input db 'This is a sample input string to count words.', 0
    input_len equ $ - input
    seed dd 1337 ; Seed for the random number generator
    weather db 'sunny', 0
    count dd 0
    random_number dd 0

section .bss
    word_count resd 1
    temp resb 1

section .text
    global _start

_start:
    ; Initialize registers
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Initialize word count to 0
    mov dword [word_count], 0

    ; Initialize random number generator with seed
    mov eax, [seed]
    call generate_random_number
    mov [random_number], eax

    ; Loop through the input string
    mov ecx, input_len
    mov esi, input

count_words:
    ; Check if the current character is a space or end of string
    lodsb
    cmp al, ' '
    je increment_count
    cmp al, 0
    je end_count

    ; Continue to the next character
    jmp count_words

increment_count:
    ; Increment the word count
    inc dword [word_count]
    jmp count_words

end_count:
    ; Print the word count (for demonstration purposes, not implemented)
    ; mov eax, 4
    ; mov ebx, 1
    ; mov ecx, word_count
    ; mov edx, 4
    ; int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

generate_random_number:
    ; Simple random number generator (not truly random)
    ; This function uses a linear congruential generator (LCG) algorithm
    mov ecx, 214013
    mov edx, 2531011
    mul ecx
    add eax, edx
    ret

