; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program reads a string from the user, processes it, and then determines if it is a palindrome.
; It uses various registers and memory locations to store intermediate results.

section .data
    prompt db "Enter a string: ", 0
    result_palindrome db "The string is a palindrome.", 0
    result_not_palindrome db "The string is not a palindrome.", 0
    buffer db 256 ; Buffer to store the input string
    length db 0 ; Variable to store the length of the string

section .bss
    temp resb 256 ; Temporary buffer for processing the string

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, prompt ; message to write
    mov edx, 14 ; message length
    int 0x80 ; call kernel

    ; Read the input string
    mov eax, 3 ; sys_read
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, buffer ; buffer to store the input
    mov edx, 256 ; maximum number of bytes to read
    int 0x80 ; call kernel

    ; Calculate the length of the string
    mov ecx, buffer ; point to the start of the buffer
    xor eax, eax ; clear eax
    xor ebx, ebx ; clear ebx
find_length:
    cmp byte [ecx + eax], 0 ; check for null terminator
    je length_found ; if null terminator is found, end loop
    inc eax ; increment length counter
    jmp find_length ; repeat the loop
length_found:
    mov [length], al ; store the length of the string

    ; Process the string to remove non-alphanumeric characters and convert to lowercase
    mov esi, buffer ; source pointer
    mov edi, temp ; destination pointer
    xor ecx, ecx ; clear ecx
process_string:
    mov al, [esi + ecx] ; load the current character
    cmp al, 0 ; check for null terminator
    je string_processed ; if null terminator, end loop
    ; Check if the character is alphanumeric
    cmp al, 'A'
    jl skip_char
    cmp al, 'Z'
    jg check_lowercase
    add al, 32 ; convert to lowercase
check_lowercase:
    cmp al, 'a'
    jl skip_char
    cmp al, 'z'
    jg skip_char
    ; Store the character in the destination buffer
    mov [edi + ecx], al
skip_char:
    inc ecx ; increment counter
    jmp process_string ; repeat the loop
string_processed: