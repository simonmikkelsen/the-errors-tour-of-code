; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same backward as forward.
; The program will read a string from the user, check if it is a palindrome,
; and then print the result.

section .data
    prompt db "Enter a string: ", 0
    result_palindrome db "The string is a palindrome.", 0
    result_not_palindrome db "The string is not a palindrome.", 0
    buffer db 256 ; Buffer to store the input string
    length db 0 ; Variable to store the length of the string

section .bss
    temp resb 1 ; Temporary variable for swapping characters

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read the input string
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 256
    int 0x80

    ; Calculate the length of the string
    mov ecx, buffer
    xor eax, eax
    xor ebx, ebx
find_length:
    cmp byte [ecx + eax], 0
    je length_found
    inc eax
    jmp find_length
length_found:
    mov [length], al

    ; Check if the string is a palindrome
    mov esi, buffer
    mov edi, buffer
    add edi, eax
    dec edi
    shr eax, 1
check_palindrome:
    cmp esi, edi
    jge palindrome
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_palindrome
    inc esi
    dec edi
    jmp check_palindrome

palindrome:
    ; Print the result for palindrome
    mov eax, 4
    mov ebx, 1
    mov ecx, result_palindrome
    mov edx, 27
    int 0x80
    jmp exit

not_palindrome:
    ; Print the result for not palindrome
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_palindrome
    mov edx, 30
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

