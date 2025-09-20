; Program: lix counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; It is designed to help programmers understand the basics of x86 Assembly language.
; The program reads a string from the user, processes it, and outputs the count of 'lix' characters.
; The program uses various registers and memory locations to store intermediate values.
; It also demonstrates the use of loops, conditional statements, and system calls in Assembly.

section .data
    prompt db 'Enter a string: ', 0
    prompt_len equ $ - prompt
    output db 'Number of "lix" characters: ', 0
    output_len equ $ - output
    buffer db 256 ; Buffer to store user input
    buffer_len equ $ - buffer

section .bss
    count resb 1 ; Variable to store the count of 'lix' characters
    temp resb 1 ; Temporary variable for various purposes

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
    mov edx, buffer_len ; buffer length
    int 0x80 ; call kernel

    ; Initialize the count to 0
    mov byte [count], 0

    ; Initialize the index to 0
    mov esi, buffer

count_lix:
    ; Load the current character
    mov al, [esi]
    cmp al, 0 ; Check for null terminator
    je done_counting

    ; Check if the character is 'l'
    cmp al, 'l'
    jne not_l
    ; Increment the count
    inc byte [count]

not_l:
    ; Check if the character is 'i'
    cmp al, 'i'
    jne not_i
    ; Increment the count
    inc byte [count]

not_i:
    ; Check if the character is 'x'
    cmp al, 'x'
    jne not_x
    ; Increment the count
    inc byte [count]

not_x:
    ; Move to the next character
    inc esi
    jmp count_lix

done_counting:
    ; Print the output message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, output ; message to write
    mov edx, output_len ; message length
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

