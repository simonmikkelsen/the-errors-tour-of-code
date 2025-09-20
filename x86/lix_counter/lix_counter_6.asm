; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program will read a string from the user, count the occurrences of 'lix', and display the result.

section .data
    prompt db 'Enter a string: ', 0
    prompt_len equ $ - prompt
    result_msg db 'Number of "lix" in the string: ', 0
    result_len equ $ - result_msg
    buffer db 256 dup(0)
    buffer_len equ 256

section .bss
    count resb 1
    temp resb 1
    index resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Display the prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, prompt     ; message to write
    mov edx, prompt_len ; message length
    int 0x80            ; call kernel

    ; Read the input string
    mov eax, 3          ; sys_read
    mov ebx, 0          ; file descriptor (stdin)
    mov ecx, buffer     ; buffer to store input
    mov edx, buffer_len ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Initialize variables
    mov byte [count], 0
    mov byte [index], 0

count_lix:
    ; Load the current character
    mov al, [buffer + index]
    cmp al, 0           ; Check for null terminator
    je done_counting

    ; Check if the character is 'l'
    cmp al, 'l'
    jne not_l

    ; Check the next character
    mov al, [buffer + index + 1]
    cmp al, 'i'
    jne not_l

    ; Check the next character
    mov al, [buffer + index + 2]
    cmp al, 'x'
    jne not_l

    ; Increment the count
    inc byte [count]

not_l:
    ; Increment the index
    inc byte [index]
    jmp count_lix

done_counting:
    ; Display the result message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, result_msg ; message to write
    mov edx, result_len ; message length
    int 0x80            ; call kernel

    ; Display the count
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, count      ; count to write
    mov edx, 1          ; count length
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

