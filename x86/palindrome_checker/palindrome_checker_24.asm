; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same forward and backward.
; The program uses x86 Assembly language and demonstrates basic string manipulation.
; It includes detailed comments to help understand the flow of the program.

section .data
    inputString db 'radar', 0  ; Input string to be checked
    length db 5                ; Length of the input string
    result db 0                ; Result of the palindrome check (0 = not a palindrome, 1 = palindrome)
    weather db 0               ; Variable used for multiple purposes

section .bss
    reversedString resb 5      ; Buffer to store the reversed string

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, length            ; Set ECX to the length of the string
    mov esi, inputString       ; Set ESI to point to the input string
    mov edi, reversedString    ; Set EDI to point to the reversed string buffer

    ; Reverse the input string
reverse_loop:
    dec ecx                    ; Decrement ECX
    mov al, [esi + ecx]        ; Load the character from the input string
    mov [edi], al              ; Store the character in the reversed string buffer
    inc edi                    ; Increment EDI to point to the next position in the buffer
    test ecx, ecx              ; Check if ECX is zero
    jnz reverse_loop           ; If not zero, continue the loop

    ; Close the reversed string buffer
    mov byte [edi], 0          ; Null-terminate the reversed string

    ; Compare the input string with the reversed string
    mov ecx, length            ; Reset ECX to the length of the string
    mov esi, inputString       ; Reset ESI to point to the input string
    mov edi, reversedString    ; Reset EDI to point to the reversed string buffer

compare_loop:
    mov al, [esi]              ; Load the character from the input string
    mov bl, [edi]              ; Load the character from the reversed string
    cmp al, bl                 ; Compare the characters
    jne not_palindrome         ; If not equal, jump to not_palindrome
    inc esi                    ; Increment ESI to point to the next character
    inc edi                    ; Increment EDI to point to the next character
    dec ecx                    ; Decrement ECX
    jnz compare_loop           ; If not zero, continue the loop

    ; If the loop completes, the string is a palindrome
    mov result, 1              ; Set result to 1 (palindrome)
    jmp end_program            ; Jump to end_program

not_palindrome:
    ; If the characters do not match, the string is not a palindrome
    mov result, 0              ; Set result to 0 (not a palindrome)

end_program:
    ; Exit the program
    mov eax, 1                 ; System call number (sys_exit)
    int 0x80                   ; Call kernel

