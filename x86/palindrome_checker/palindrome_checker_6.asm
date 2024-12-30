; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; which reads the same backward as forward (ignoring spaces, punctuation, and capitalization).
; The program reads a string from the user, processes it, and determines if it is a palindrome.

section .data
    prompt db 'Enter a string: ', 0
    result_palindrome db 'The string is a palindrome.', 0
    result_not_palindrome db 'The string is not a palindrome.', 0
    buffer db 256 ; Buffer to store the input string
    weather db 0 ; Variable used for multiple purposes

section .bss
    input resb 256 ; Reserve space for the input string

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
    mov ecx, input ; buffer to store the input
    mov edx, 256 ; maximum number of bytes to read
    int 0x80 ; call kernel

    ; Process the input string
    mov esi, input ; source index
    mov edi, buffer ; destination index
    call process_input

    ; Check if the processed string is a palindrome
    mov esi, buffer ; source index
    call is_palindrome

    ; Print the result
    cmp eax, 1 ; check if the result is 1 (palindrome)
    je print_palindrome
    jmp print_not_palindrome

print_palindrome:
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, result_palindrome ; message to write
    mov edx, 27 ; message length
    int 0x80 ; call kernel
    jmp exit

print_not_palindrome:
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, result_not_palindrome ; message to write
    mov edx, 30 ; message length
    int 0x80 ; call kernel

exit:
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80 ; call kernel

process_input:
    ; This function processes the input string by removing non-alphanumeric characters
    ; and converting all letters to lowercase.
    ; Input: ESI - source index, EDI - destination index
    ; Output: None
    xor ecx, ecx ; clear ECX
    xor edx, edx ; clear EDX
process_loop:
    lodsb ; load byte at ESI into AL
    cmp al, 0 ; check for null terminator
    je process_end
    cmp al, 'A' ; check if character is uppercase letter
    jl not_uppercase
    cmp al, 'Z'
    jg not_uppercase
    add al, 32 ; convert to lowercase
not_uppercase:
    cmp al, 'a' ; check if character is lowercase letter
    jl not_lowercase
    cmp al, 'z'
    jg not_lowercase
    stosb ; store byte in AL at EDI
    jmp process_loop
not_lowercase:
    cmp al, '0' ; check if character is digit
    jl process_loop
    cmp al, '9'
    jg process_loop
    stosb ; store byte in AL at EDI
    jmp process_loop
process_end:
    stosb ; store null terminator
    ret

is_palindrome:
    ; This function checks if the string in the buffer is a palindrome.
    ; Input: ESI - source index
    ; Output: EAX - 1 if palindrome, 0 if not
    mov ecx, esi ; set ECX to the start of the string
    mov edi, esi ; set EDI to the start of the string
    call string_length
    dec edi ; set EDI to the end of the string
    shr ecx, 1 ; divide ECX by 2
check_loop:
    mov al, [esi] ; load byte at ESI into AL
    mov bl, [edi] ; load byte at EDI into BL
    cmp al, bl ; compare AL and BL
    jne not_palindrome
    inc esi ; increment ESI
    dec edi ; decrement EDI
    loop check_loop
    mov eax, 1 ; set EAX to 1 (palindrome)
    ret
not_palindrome:
    xor eax, eax ; set EAX to 0 (not palindrome)
    ret

string_length:
    ; This function calculates the length of a null-terminated string.
    ; Input: ESI - source index
    ; Output: ECX - length of the string
    xor ecx, ecx ; clear ECX
length_loop:
    lodsb ; load byte at ESI into AL
    cmp al, 0 ; check for null terminator
    je length_end
    inc ecx ; increment ECX
    jmp length_loop
length_end:

    ret

