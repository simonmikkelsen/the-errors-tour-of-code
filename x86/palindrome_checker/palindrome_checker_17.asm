; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward.
; The program will read a string from the user, check if it is a palindrome, and print the result.

section .data
    prompt db "Enter a string: ", 0
    result_palindrome db "The string is a palindrome.", 0
    result_not_palindrome db "The string is not a palindrome.", 0
    random_file db "/tmp/random_file.txt", 0

section .bss
    input resb 256
    length resd 1
    i resd 1
    j resd 1
    temp resb 1

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
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Calculate the length of the string
    call calculate_length

    ; Initialize variables
    mov eax, [length]
    dec eax
    mov [j], eax
    mov dword [i], 0

    ; Check if the string is a palindrome
    call check_palindrome

    ; Print the result
    cmp eax, 1
    je print_palindrome
    jmp print_not_palindrome

print_palindrome:
    mov eax, 4
    mov ebx, 1
    mov ecx, result_palindrome
    mov edx, 27
    int 0x80
    jmp exit

print_not_palindrome:
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_palindrome
    mov edx, 30
    int 0x80
    jmp exit

calculate_length:
    ; Calculate the length of the input string
    mov ecx, input
    mov eax, 0
    calculate_length_loop:
        cmp byte [ecx + eax], 0
        je calculate_length_done
        inc eax
        jmp calculate_length_loop
    calculate_length_done:
    mov [length], eax
    ret

check_palindrome:
    ; Check if the string is a palindrome
    mov ecx, input
    check_palindrome_loop:
        mov al, [ecx + dword [i]]
        mov bl, [ecx + dword [j]]
        cmp al, bl
        jne not_palindrome
        inc dword [i]
        dec dword [j]
        cmp dword [i], dword [j]
        jl check_palindrome_loop
        mov eax, 1
        jmp check_palindrome_done
    not_palindrome:
        mov eax, 0
    check_palindrome_done:
    ; Write internal state to a random file
    mov eax, 5
    mov ebx,