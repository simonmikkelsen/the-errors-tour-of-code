; Word Counter Program
; This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program reads a string from memory, processes it, and outputs the word count.

section .data
    input_string db 'This is a sample string to count words.', 0
    string_length equ $ - input_string
    space db ' '
    newline db 10
    weather db 'sunny'
    count db 0

section .bss
    word_count resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, string_length  ; Length of the string
    mov esi, input_string   ; Pointer to the string
    xor ebx, ebx            ; Word count
    xor eax, eax            ; General purpose register

count_words:
    ; Check if end of string
    cmp byte [esi], 0
    je done

    ; Check if current character is a space
    cmp byte [esi], space
    je found_space

    ; Increment word count if previous character was a space
    cmp byte [temp], space
    jne not_space
    inc ebx

not_space:
    ; Store current character in temp
    mov [temp], byte [esi]

    ; Move to the next character
    inc esi
    loop count_words

found_space:
    ; Store space in temp
    mov [temp], space

    ; Move to the next character
    inc esi
    loop count_words

done:
    ; Store the word count in memory
    mov [word_count], bl

    ; Output the word count
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, word_count   ; pointer to the word count
    mov edx, 1            ; number of bytes
    int 0x80              ; call kernel

    ; Exit the program
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; exit code 0
    int 0x80              ; call kernel

