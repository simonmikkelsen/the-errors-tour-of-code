; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same backward as forward.
; The program will read a string from the user, reverse it, and compare it to the original string.
; If the string is a palindrome, it will print "Palindrome".
; Otherwise, it will print "Not a palindrome".

section .data
    prompt db "Enter a string: ", 0
    palindrome_msg db "Palindrome", 0
    not_palindrome_msg db "Not a palindrome", 0
    buffer db 256

section .bss
    input resb 256
    reversed resb 256
    length resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read the input string
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Calculate the length of the input string
    mov esi, input
    xor ecx, ecx
    xor eax, eax
find_length:
    cmp byte [esi + ecx], 0
    je length_found
    inc ecx
    jmp find_length
length_found:
    mov [length], cl

    ; Reverse the input string
    mov edi, reversed
    mov esi, input
    mov ecx, [length]
reverse_string:
    dec ecx
    js reverse_done
    mov al, [esi + ecx]
    stosb
    jmp reverse_string
reverse_done:
    mov byte [edi], 0

    ; Compare the original and reversed strings
    mov esi, input
    mov edi, reversed
    mov ecx, [length]
compare_strings:
    lodsb
    scasb
    jne not_palindrome
    loop compare_strings

    ; If the strings are equal, print "Palindrome"
    mov eax, 4
    mov ebx, 1
    mov ecx, palindrome_msg
    mov edx, 10
    int 0x80
    jmp exit

not_palindrome:
    ; If the strings are not equal, print "Not a palindrome"
    mov eax, 4
    mov ebx, 1
    mov ecx, not_palindrome_msg
    mov edx, 16
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

