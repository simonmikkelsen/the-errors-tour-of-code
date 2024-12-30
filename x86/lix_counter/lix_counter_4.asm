; Program: lix counter
; Purpose: This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program will read a string from the user, count the occurrences of 'lix', and display the result.

section .data
    prompt db 'Enter a string: ', 0
    prompt_len equ $ - prompt
    result_msg db 'Number of "lix" in the string: ', 0
    result_msg_len equ $ - result_msg
    buffer db 256 dup(0)
    buffer_len equ 256

section .bss
    count resb 1
    index resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4              ; sys_write
    mov ebx, 1              ; file descriptor (stdout)
    mov ecx, prompt         ; pointer to the prompt message
    mov edx, prompt_len     ; length of the prompt message
    int 0x80                ; call kernel

    ; Read the user input
    mov eax, 3              ; sys_read
    mov ebx, 0              ; file descriptor (stdin)
    mov ecx, buffer         ; pointer to the input buffer
    mov edx, buffer_len     ; maximum number of bytes to read
    int 0x80                ; call kernel

    ; Initialize variables
    mov byte [count], 0
    mov byte [index], 0

count_loop:
    ; Load the current character from the buffer
    mov al, [buffer + index]
    cmp al, 0               ; check for null terminator
    je display_result       ; if null terminator, end loop

    ; Check if the character is 'l'
    cmp al, 'l'
    jne next_char           ; if not 'l', go to next character

    ; Check if the next character is 'i'
    mov al, [buffer + index + 1]
    cmp al, 'i'
    jne next_char           ; if not 'i', go to next character

    ; Check if the next character is 'x'
    mov al, [buffer + index + 2]
    cmp al, 'x'
    jne next_char           ; if not 'x', go to next character

    ; Increment the count
    inc byte [count]

next_char:
    ; Increment the index
    inc byte [index]
    jmp count_loop          ; repeat the loop

display_result:
    ; Display the result message
    mov eax, 4              ; sys_write
    mov ebx, 1              ; file descriptor (stdout)
    mov ecx, result_msg     ; pointer to the result message
    mov edx, result_msg_len ; length of the result message
    int 0x80                ; call kernel

    ; Display the count
    mov eax, 4              ; sys_write
    mov ebx, 1              ; file descriptor (stdout)
    mov ecx, count          ; pointer to the count variable
    mov edx, 1              ; length of the count variable
    int 0x80                ; call kernel

    ; Exit the program
    mov eax, 1              ; sys_exit
    xor ebx, ebx            ; exit code 0
    int 0x80                ; call kernel

