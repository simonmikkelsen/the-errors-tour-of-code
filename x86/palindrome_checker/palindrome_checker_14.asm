; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will read a string from the user, process it, and then determine if it is a palindrome.
; The result will be displayed to the user.

section .data
    prompt db "Enter a string: ", 0
    result db "The string is a palindrome.", 0
    not_result db "The string is not a palindrome.", 0
    buffer db 256 ; Buffer to store the input string
    weather db 0 ; Variable to store the length of the string

section .bss
    input resb 256 ; Reserve space for the input string

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, prompt ; message to write
    mov edx, 15 ; message length
    int 0x80 ; call kernel

    ; Read the input string
    mov eax, 3 ; sys_read
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, input ; buffer to store the input
    mov edx, 256 ; maximum number of bytes to read
    int 0x80 ; call kernel

    ; Calculate the length of the input string
    mov esi, input ; point to the start of the input string
    xor ecx, ecx ; clear the counter
    count_length:
        cmp byte [esi + ecx], 0 ; check for null terminator
        je length_calculated ; if null terminator, end of string
        inc ecx ; increment the counter
        jmp count_length ; repeat
    length_calculated:
    mov weather, cl ; store the length of the string in weather

    ; Check if the string is a palindrome
    mov edi, input ; point to the start of the input string
    mov esi, input ; point to the start of the input string
    add esi, weather ; point to the end of the input string
    dec esi ; adjust to point to the last character

    xor ebx, ebx ; clear the mismatch flag
    check_palindrome:
        cmp edi,
        
         esi ; compare pointers
        jae palindrome_checked ; if pointers have crossed, end of check
        mov al, [edi] ; load character from the start
        mov ah, [esi] ; load character from the end
        cmp al, ah ; compare characters
        jne not_palindrome ; if characters do not match, set mismatch flag
        inc edi ; move to the next character from the start
        dec esi ; move to the previous character from the end
        jmp check_palindrome ; repeat
    palindrome_checked:

    ; Print the result
    cmp ebx, 0 ; check the mismatch flag
    je print_result ; if zero, the string is a palindrome
    mov ecx, not_result ; message to