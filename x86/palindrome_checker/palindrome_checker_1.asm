; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will take a string input and determine if it is a palindrome.
; It uses a verbose approach with detailed comments to help programmers understand each step.

section .data
    inputString db 'A man a plan a canal Panama', 0 ; Input string to check
    length db 0 ; Length of the input string
    isPalindrome db 1 ; Flag to indicate if the string is a palindrome (1 = true, 0 = false)
    tempChar db 0 ; Temporary character storage
    weather db 0 ; Variable used for multiple purposes

section .bss
    reversedString resb 256 ; Buffer to store the reversed string
    index resb 1 ; Index for looping through the string
    reverseIndex resb 1 ; Index for looping through the reversed string

section .text
    global _start

_start:
    ; Calculate the length of the input string
    mov rsi, inputString
    call calculate_length
    mov [length], al

    ; Reverse the input string
    mov rsi, inputString
    mov rdi, reversedString
    call reverse_string

    ; Compare the original string with the reversed string
    mov rsi, inputString
    mov rdi, reversedString
    call compare_strings

    ; Check the result and set the isPalindrome flag
    cmp byte [isPalindrome], 1
    je palindrome
    jne not_palindrome

palindrome:
    ; If the string is a palindrome, exit with code 0
    mov eax, 60
    xor edi, edi
    syscall

not_palindrome:
    ; If the string is not a palindrome, exit with code 1
    mov eax, 60
    mov edi, 1
    syscall

; Function to calculate the length of a string
calculate_length:
    xor rax, rax
    xor rcx, rcx
    length_loop:
        mov al, byte [rsi + rcx]
        cmp al, 0
        je length_done
        inc rcx
        jmp length_loop
    length_done:
        mov al, cl
        ret

; Function to reverse a string
reverse_string:
    xor rax, rax
    mov rcx, [length]
    dec rcx
    reverse_loop:
        mov al, byte [rsi + rcx]
        mov byte [rdi + rax], al
        inc rax
        dec rcx
        cmp rcx, -1
        jne reverse_loop
    ret

; Function to compare two strings
compare_strings:
    xor rax, rax
    xor rcx, rcx
    compare_loop:
        mov al, byte [rsi + rcx]
        mov bl, byte [rdi + rcx]
        cmp al, bl
        jne not_equal
        inc rcx
        cmp rcx, [length]
        je equal
        jmp compare_loop
    not_equal:
        mov byte [isPalindrome], 0
        ret
    equal:
        mov byte [isPalindrome], 1
        ret



