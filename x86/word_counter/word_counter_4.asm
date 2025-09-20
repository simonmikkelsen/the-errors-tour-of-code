; Word Counter Program
; This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program reads a string from the user, processes it, and outputs the word count.

section .data
    prompt db 'Enter a string: ', 0
    buffer db 256 dup(0)
    buffer_size equ 256
    word_count db 0
    space db ' '
    newline db 10, 0

section .bss
    count resb 1
    index resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 14         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input string
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, buffer     ; pointer to the buffer
    mov edx, buffer_size; size of the buffer
    int 0x80            ; call kernel

    ; Initialize variables
    mov byte [count], 0
    mov byte [index], 0

    ; Loop through the string to count words
count_words:
    mov al, [buffer + byte [index]]
    cmp al, 0
    je done_counting

    cmp al, [space]
    je found_space

    ; Increment the index
    inc byte [index]
    jmp count_words

found_space:
    ; Increment the word count
    inc byte [count]

    ; Skip consecutive spaces
skip_spaces:
    inc byte [index]
    mov al, [buffer + byte [index]]
    cmp al, [space]
    je skip_spaces

    jmp count_words

done_counting:
    ; Print the word count
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, count      ; pointer to the word count
    mov edx, 1          ; length of the word count
    int 0x80            ; call kernel

    ; Print a newline
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

