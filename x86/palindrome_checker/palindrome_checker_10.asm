; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will take user input and determine if it is a palindrome.
; It uses various functions and variables to achieve this goal.

section .data
    prompt db "Enter a string: ", 0
    result_palindrome db "The string is a palindrome.", 0
    result_not_palindrome db "The string is not a palindrome.", 0
    buffer db 256 ; Buffer to store user input
    weather db 0 ; Variable used for multiple purposes

section .bss
    input resb 256 ; Reserve space for user input

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, prompt ; message to write
    mov edx, 14 ; message length
    int 0x80 ; call kernel

    ; Read user input
    mov eax, 3 ; sys_read
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, input ; buffer to store input
    mov edx, 256 ; maximum number of bytes to read
    int 0x80 ; call kernel

    ; Remove newline character from input
    mov ecx, input
    mov edi, ecx
    mov al, 0
    cld
    repne scasb
    dec edi
    mov byte [edi], 0

    ; Check if the input is a palindrome
    call is_palindrome

    ; Print the result
    cmp eax, 1
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

is_palindrome:
    ; Function to check if a string is a palindrome
    ; Input: ECX - pointer to the string
    ; Output: EAX - 1 if palindrome, 0 if not

    push ebp
    mov ebp, esp
    sub esp, 256

    mov esi, ecx ; ESI points to the start of the string
    mov edi, ecx ; EDI points to the end of the string

    ; Find the end of the string
    mov al, 0
    cld
    repne scasb
    dec edi

    ; Compare characters from start and end
    .compare:
        mov al, [esi]
        mov bl, [edi]
        cmp al, bl
        jne .not_palindrome
        inc esi
        dec edi
        cmp esi, edi
        jle .compare

    mov eax, 1 ; String is a palindrome
    jmp .done

    .not_palindrome:
        mov eax, 0 ; String is not a palindrome

    .done:
        mov esp, ebp
        pop ebp
        ret

