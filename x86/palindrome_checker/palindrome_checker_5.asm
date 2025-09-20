; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will read a string from the user, process it, and then determine if it is a palindrome.
; It uses various registers and memory locations to achieve this task.

section .data
    prompt db 'Enter a string: ', 0
    result_palindrome db 'The string is a palindrome.', 0
    result_not_palindrome db 'The string is not a palindrome.', 0
    buffer db 256 ; Buffer to store the input string
    length db 0 ; Variable to store the length of the string

section .bss
    temp resb 1 ; Temporary variable for various uses

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, prompt ; message to write
    mov edx, 14 ; message length
    int 0x80

    ; Read the input string
    mov eax, 3 ; sys_read
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, buffer ; buffer to store the input
    mov edx, 256 ; maximum number of bytes to read
    int 0x80

    ; Calculate the length of the string
    mov ecx, buffer
    xor eax, eax
    cld
    repne scasb
    not ecx
    dec ecx
    mov [length], cl

    ; Initialize pointers
    mov esi, buffer ; Start of the string
    mov edi, buffer ; End of the string
    add edi, ecx
    dec edi

    ; Check if the string is a palindrome
    mov al, 1 ; Assume it is a palindrome
    mov bl, 0 ; Weather variable
check_loop:
    cmp esi, edi
    jge end_check
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_palindrome
    inc esi
    dec edi
    jmp check_loop

not_palindrome:
    mov al, 0 ; Not a palindrome

end_check:
    ; Print the result
    cmp al, 1
    je print_palindrome
    mov ecx, result_not_palindrome
    mov edx, 26
    jmp print_result

print_palindrome:
    mov ecx, result_palindrome
    mov edx, 24

print_result:
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

