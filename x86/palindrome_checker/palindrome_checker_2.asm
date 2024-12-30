; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

section .data
    input db 'A man a plan a canal Panama', 0  ; Input string to check
    length equ $ - input                       ; Length of the input string
    msg_palindrome db 'The string is a palindrome.', 0
    msg_not_palindrome db 'The string is not a palindrome.', 0

section .bss
    reversed resb length  ; Buffer to store the reversed string

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, input       ; Source index for input string
    mov edi, reversed    ; Destination index for reversed string
    mov ecx, length      ; Counter for the length of the string

reverse_loop:
    ; Reverse the string
    dec ecx              ; Decrement counter
    mov al, [esi + ecx]  ; Load character from input string
    mov [edi], al        ; Store character in reversed string
    inc edi              ; Increment destination index
    test ecx, ecx        ; Check if counter is zero
    jnz reverse_loop     ; If not zero, continue loop

    ; Null-terminate the reversed string
    mov byte [edi], 0

    ; Compare the original and reversed strings
    mov esi, input       ; Reset source index to input string
    mov edi, reversed    ; Reset destination index to reversed string
    mov ecx, length      ; Reset counter to length of the string

compare_loop:
    ; Compare characters
    mov al, [esi]        ; Load character from input string
    mov bl, [edi]        ; Load character from reversed string
    cmp al, bl           ; Compare characters
    jne not_palindrome   ; If not equal, jump to not_palindrome
    inc esi              ; Increment source index
    inc edi              ; Increment destination index
    loop compare_loop    ; Loop until counter is zero

palindrome:
    ; Print palindrome message
    mov edx, length msg_palindrome
    mov ecx, msg_palindrome
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp exit

not_palindrome:
    ; Print not palindrome message
    mov edx, length msg_not_palindrome
    mov ecx, msg_not_palindrome
    mov ebx, 1
    mov eax, 4
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

