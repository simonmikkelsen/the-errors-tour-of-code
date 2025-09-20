; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; The program reads a string from the user, processes it, and outputs the word count.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program uses various registers and memory locations to achieve its goal.

section .data
    prompt db 'Enter a string: ', 0
    buffer db 256 dup(0)
    buffer_size equ 256
    word_count db 0
    space db ' '

section .bss
    temp resb 1
    temp2 resb 1
    temp3 resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 14         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input string
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, buffer     ; pointer to the buffer
    mov edx, buffer_size; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Initialize word count to zero
    mov byte [word_count], 0

    ; Initialize index to zero
    mov ecx, 0

count_words:
    ; Load the current character
    mov al, [buffer + ecx]

    ; Check if the character is a space or null terminator
    cmp al, space
    je increment_word_count
    cmp al, 0
    je done_counting

    ; Increment the index
    inc ecx
    jmp count_words

increment_word_count:
    ; Increment the word count
    inc byte [word_count]

    ; Skip consecutive spaces
    inc ecx
    mov al, [buffer + ecx]
    cmp al, space
    je increment_word_count

    jmp count_words

done_counting:
    ; Print the word count
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, word_count ; pointer to the word count
    mov edx, 1          ; length of the word count
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

