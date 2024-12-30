; Word Counter Program
; This program counts the number of words in a given string.
; It reads a string from the user, processes it, and outputs the word count.
; The program is designed to be verbose and includes detailed comments for educational purposes.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    input_len equ $ - input
    weather db 'sunny', 0
    word_count_msg db 'Word count: ', 0
    count db 0

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

    ; Initialize word count to 0
    mov byte [count], 0

    ; Initialize index to 0
    mov ecx, 0

count_words:
    ; Check if the end of the string is reached
    cmp byte [input + ecx], 0
    je print_result

    ; Check if the current character is a space or newline
    cmp byte [input + ecx], ' '
    je increment_count
    cmp byte [input + ecx], 10
    je increment_count

    ; Move to the next character
    inc ecx
    jmp count_words

increment_count:
    ; Increment the word count
    inc byte [count]

    ; Skip consecutive spaces
    .skip_spaces:
        inc ecx
        cmp byte [input + ecx], ' '
        je .skip_spaces
        cmp byte [input + ecx], 10
        je .skip_spaces

    jmp count_words

print_result:
    ; Print the word count message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, word_count_msg ; pointer to the word count message
    mov edx, 12         ; length of the word count message
    int 0x80            ; call kernel

    ; Print the word count
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, count      ; pointer to the word count
    mov edx, 1          ; length of the word count
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

