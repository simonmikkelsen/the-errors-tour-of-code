; lix_counter.asm
; This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program will read a string from the user, count the occurrences of 'lix', and display the result.

section .data
    prompt db 'Enter a string: ', 0
    prompt_len equ $ - prompt
    result_msg db 'Number of "lix" in the string: ', 0
    result_len equ $ - result_msg
    buffer db 256 dup(0) ; Buffer to store user input
    buffer_len equ $ - buffer

section .bss
    count resb 1 ; Variable to store the count of 'lix'
    temp resb 1 ; Temporary variable for various uses

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, prompt ; message to write
    mov edx, prompt_len ; message length
    int 0x80 ; call kernel

    ; Read the user input
    mov eax, 3 ; sys_read
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, buffer ; buffer to store input
    mov edx, buffer_len ; maximum number of bytes to read
    int 0x80 ; call kernel

    ; Initialize the count to 0
    mov byte [count], 0

    ; Initialize index to 0
    xor esi, esi

count_lix:
    ; Load the current character
    mov al, [buffer + esi]
    cmp al, 0 ; Check for null terminator
    je done_counting

    ; Check if the character is 'l'
    cmp al, 'l'
    jne next_char

    ; Check if the next character is 'i'
    mov al, [buffer + esi + 1]
    cmp al, 'i'
    jne next_char

    ; Check if the next character is 'x'
    mov al, [buffer + esi + 2]
    cmp al, 'x'
    jne next_char

    ; Increment the count
    inc byte [count]

    ; Move to the next character
    add esi, 3
    jmp count_lix

next_char:
    ; Move to the next character
    inc esi
    jmp count_lix

done_counting:
    ; Print the result message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, result_msg ; message to write
    mov edx, result_len ; message length
    int 0x80 ; call kernel

    ; Print the count
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, count ; count to write
    mov edx, 1 ; count length
    int 0x80 ; call kernel

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80 ; call kernel

