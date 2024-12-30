; lix_counter.asm
; This program is designed to count the number of lines, words, and characters in a given input.
; It demonstrates basic input/output operations, string manipulation, and counting algorithms in x86 Assembly.
; The program reads input from the user, processes the input to count lines, words, and characters, and then displays the results.

section .data
    prompt db 'Enter text: ', 0
    line_count_msg db 'Number of lines: ', 0
    word_count_msg db 'Number of words: ', 0
    char_count_msg db 'Number of characters: ', 0
    newline db 10, 0

section .bss
    input resb 256
    line_count resd 1
    word_count resd 1
    char_count resd 1
    temp_var resd 1

section .text
    global _start

_start:
    ; Display prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 12
    int 0x80

    ; Read input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Initialize counters
    xor eax, eax
    mov [line_count], eax
    mov [word_count], eax
    mov [char_count], eax

    ; Process the input
    mov esi, input
    call count_lines
    call count_words
    call count_chars

    ; Display line count
    mov eax, 4
    mov ebx, 1
    mov ecx, line_count_msg
    mov edx, 17
    int 0x80
    mov eax, [line_count]
    call print_number
    call print_newline

    ; Display word count
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count_msg
    mov edx, 17
    int 0x80
    mov eax, [word_count]
    call print_number
    call print_newline

    ; Display character count
    mov eax, 4
    mov ebx, 1
    mov ecx, char_count_msg
    mov edx, 21
    int 0x80
    mov eax, [char_count]
    call print_number
    call print_newline

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

count_lines:
    ; Count the number of lines in the input
    xor eax, eax
    mov edi, input
    mov ecx, 256
    cld
    repne scasb
    not ecx
    dec ecx
    mov edi, input
    mov ebx, ecx
    xor ecx, ecx
    mov edx, 0

count_lines_loop:
    lodsb
    cmp al, 10
    jne not_newline
    inc edx
not_newline:
    loop count_lines_loop
    mov [line_count], edx
    ret

count_words:
    ; Count the number of words in the input
    xor eax, eax
    mov edi, input
    mov ecx, 256
    cld
    repne scasb
    not ecx
    dec ecx
    mov edi, input
    mov ebx, ecx
    xor ecx, ecx
    mov edx, 0
    mov esi, 0

count_words_loop:
    lodsb
    cmp al, 32
    je word_separator
    cmp al, 10
    je word_separator
    cmp al, 0
    je end_of_input
    mov esi, 1
    jmp continue_counting
word_separator:
    cmp esi, 1
    jne continue_counting
    inc edx
    mov esi, 0
continue_counting:
    loop count_words_loop
end_of_input:
    cmp esi, 1
    jne no_last_word
    inc edx
no_last_word:
    mov [word_count], edx
    ret

count_chars:
    ; Count the number of