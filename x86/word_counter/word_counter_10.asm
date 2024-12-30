; Program: Word Counter
; Purpose: This program counts the number of words in a user-provided string.
; It demonstrates basic string handling and counting operations in x86 Assembly.
; The program reads a string from the user, processes it to count the words,
; and then outputs the word count.

section .data
    prompt db 'Enter a string: ', 0
    prompt_len equ $ - prompt
    output_msg db 'Word count: ', 0
    output_len equ $ - output_msg
    buffer db 256 dup(0)
    buffer_size equ 256

section .bss
    word_count resb 1
    temp_var resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, prompt_len ; length of the prompt message
    int 0x80            ; call kernel

    ; Read user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, buffer     ; pointer to the input buffer
    mov edx, buffer_size; size of the input buffer
    int 0x80            ; call kernel

    ; Initialize word count to 0
    mov byte [word_count], 0

    ; Initialize index to 0
    xor esi, esi

count_words:
    ; Check if the current character is a space or null terminator
    mov al, [buffer + esi]
    cmp al, ' '
    je found_space
    cmp al, 0
    je end_of_string

    ; Move to the next character
    inc esi
    jmp count_words

found_space:
    ; Increment word count
    inc byte [word_count]

    ; Skip consecutive spaces
skip_spaces:
    inc esi
    mov al, [buffer + esi]
    cmp al, ' '
    je skip_spaces

    ; Continue counting words
    jmp count_words

end_of_string:
    ; Increment word count for the last word if not followed by a space
    mov al, [buffer + esi - 1]
    cmp al, ' '
    je skip_increment
    inc byte [word_count]

skip_increment:
    ; Print the output message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, output_msg ; pointer to the output message
    mov edx, output_len ; length of the output message
    int 0x80            ; call kernel

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

