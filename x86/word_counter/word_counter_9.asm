; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates basic string processing in x86 assembly language.
; The program reads a string from the user, processes it to count the words,
; and then outputs the word count.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    output db 'Word count: ', 0
    wordCount db 0
    space db ' ', 0
    newline db 10, 0

section .bss
    count resb 1
    index resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt to the user
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 14         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input string from the user
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Initialize variables
    mov byte [count], 0
    mov byte [index], 0

count_words:
    ; Load the current character
    mov al, [input + index]
    cmp al, 0           ; check for null terminator
    je done_counting    ; if null terminator, end of string

    ; Check if the character is a space
    cmp al, [space]
    je found_space

    ; Check if the character is a newline
    cmp al, [newline]
    je found_space

    ; Increment the index
    inc byte [index]
    jmp count_words

found_space:
    ; Increment the word count
    inc byte [count]

    ; Skip consecutive spaces
    inc byte [index]
    mov al, [input + index]
    cmp al, [space]
    je found_space

    ; Continue counting words
    jmp count_words

done_counting:
    ; Print the word count message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, output     ; pointer to the output message
    mov edx, 12         ; length of the output message
    int 0x80            ; call kernel

    ; Print the word count
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, count      ; pointer to the word count
    mov edx, 1          ; length of the word count
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

