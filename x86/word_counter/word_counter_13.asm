; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; The program reads a string from the user, processes it, and outputs the word count.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    input_len equ $ - input
    word_count db 0
    space db ' '

section .bss
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 14         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, input      ; pointer to the input buffer
    mov edx, input_len  ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Initialize word count to zero
    mov byte [word_count], 0

    ; Initialize index to zero
    mov ecx, 0

count_words:
    ; Load the current character
    mov al, [input + ecx]

    ; Check if the character is a space or end of string
    cmp al, space
    je found_space
    cmp al, 0
    je end_of_string

    ; Move to the next character
    inc ecx
    jmp count_words

found_space:
    ; Increment the word count
    inc byte [word_count]

    ; Skip consecutive spaces
    .skip_spaces:
        inc ecx
        mov al, [input + ecx]
        cmp al, space
        je .skip_spaces

    jmp count_words

end_of_string:
    ; Increment word count for the last word if not followed by space
    cmp byte [input + ecx - 1], space
    je .skip_increment
    inc byte [word_count]

    .skip_increment:

    ; Print the word count
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, word_count ; pointer to the word count
    mov edx, 1          ; length of the word count
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

