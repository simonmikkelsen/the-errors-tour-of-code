; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It reads a string from the user, processes it, and outputs the word count.
; The program demonstrates basic string handling and counting in x86 Assembly.

section .data
    prompt db 'Enter a string: ', 0
    buffer db 256 dup(0)
    bufferSize equ 256
    wordCount db 0
    space db ' '

section .bss
    count resb 1

section .text
    global _start

_start:
    ; Print the prompt to the user
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, prompt     ; message to write
    mov edx, 14         ; message length
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, buffer     ; buffer to store input
    mov edx, bufferSize ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Initialize variables
    mov esi, buffer     ; point to the start of the buffer
    mov byte [wordCount], 0 ; initialize word count to 0
    mov byte [count], 0 ; initialize count to 0

count_words:
    ; Check if the current character is a space or null terminator
    mov al, [esi]
    cmp al, 0
    je done_counting
    cmp al, space
    je found_space

    ; Increment the word count if a non-space character is found
    inc byte [count]
    jmp next_char

found_space:
    ; If a space is found, check if the previous character was not a space
    cmp byte [count], 0
    je next_char
    inc byte [wordCount]
    mov byte [count], 0

next_char:
    ; Move to the next character in the buffer
    inc esi
    jmp count_words

done_counting:
    ; If the last character was not a space, increment the word count
    cmp byte [count], 0
    je print_result
    inc byte [wordCount]

print_result:
    ; Print the word count
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, wordCount  ; word count to print
    mov edx, 1          ; length of the word count
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

