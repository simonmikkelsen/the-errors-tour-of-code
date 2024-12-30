; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will take user input and determine if it is a palindrome.
; It is designed to help programmers understand the basics of string manipulation
; and control flow in assembly language.

section .data
    prompt db "Enter a string: ", 0
    len_prompt equ $ - prompt
    result_palindrome db "The string is a palindrome.", 0
    len_result_palindrome equ $ - result_palindrome
    result_not_palindrome db "The string is not a palindrome.", 0
    len_result_not_palindrome equ $ - result_not_palindrome
    buffer db 256 dup(0)
    buffer_len equ $ - buffer

section .bss
    user_input resb 256
    input_length resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len_prompt
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, user_input
    mov edx, 256
    int 0x80

    ; Store the length of the input
    mov [input_length], al

    ; Remove newline character from input
    mov ecx, user_input
    mov al, 0
    mov edi, ecx
    mov esi, ecx
    cld
    repne scasb
    dec edi
    mov byte [edi], 0

    ; Check if the input is a palindrome
    mov esi, user_input
    mov edi, user_input
    add edi, [input_length]
    dec edi

check_palindrome:
    ; Skip non-alphanumeric characters from the start
    mov al, [esi]
    cmp al, 'A'
    jl skip_start
    cmp al, 'Z'
    jle to_lowercase_start
    cmp al, 'a'
    jl skip_start
    cmp al, 'z'
    jle to_lowercase_start
    cmp al, '0'
    jl skip_start
    cmp al, '9'
    jle valid_start
skip_start:
    inc esi
    jmp check_palindrome
to_lowercase_start:
    or al, 0x20
valid_start:

    ; Skip non-alphanumeric characters from the end
    mov al, [edi]
    cmp al, 'A'
    jl skip_end
    cmp al, 'Z'
    jle to_lowercase_end
    cmp al, 'a'
    jl skip_end
    cmp al, 'z'
    jle to_lowercase_end
    cmp al, '0'
    jl skip_end
    cmp al, '9'
    jle valid_end
skip_end:
    dec edi
    jmp check_palindrome
to_lowercase_end:
    or al, 0x20
valid_end:

    ; Compare characters
    mov al, [esi]
    mov ah, [edi]
    cmp al, ah
    jne not_palindrome

    ; Move pointers
    inc esi
    dec edi
    cmp esi, edi
    jl check_palindrome

    ; If all characters match, it is a palindrome
    mov eax, 4
    mov ebx, 1
    mov ecx, result_palindrome
    mov edx, len_result_palindrome
    int 0x80
    jmp exit

not_palindrome:
    ; If any character does not match, it is not a palindrome
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_palindrome
    mov edx, len_result_not_palindrome
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

