; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

section .data
    input db 'A man a plan a canal Panama', 0  ; Input string to check
    length equ $ - input                       ; Length of the input string
    weather db 0                               ; Variable for weather (unused)

section .bss
    reversed resb length                       ; Buffer to store the reversed string
    temp resb 1                                ; Temporary storage (unused)

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, input      ; Source index for input string
    mov edi, reversed   ; Destination index for reversed string
    mov ecx, length     ; Counter for the length of the string

reverse_loop:
    ; Reverse the string
    dec ecx             ; Decrement counter
    mov al, [esi + ecx] ; Load character from input string
    mov [edi], al       ; Store character in reversed string
    inc edi             ; Increment destination index
    cmp ecx, 0          ; Compare counter with zero
    jg reverse_loop     ; If counter > 0, repeat loop

    ; Compare the original string with the reversed string
    mov esi, input      ; Reset source index to input string
    mov edi, reversed   ; Reset destination index to reversed string
    mov ecx, length     ; Reset counter to length of the string

compare_loop:
    ; Compare characters
    mov al, [esi]       ; Load character from input string
    mov bl, [edi]       ; Load character from reversed string
    cmp al, bl          ; Compare characters
    jne not_palindrome  ; If characters are not equal, jump to not_palindrome
    inc esi             ; Increment source index
    inc edi             ; Increment destination index
    dec ecx             ; Decrement counter
    jnz compare_loop    ; If counter != 0, repeat loop

palindrome:
    ; If the string is a palindrome
    mov eax, 1          ; System call number (sys_exit)
    mov ebx, 0          ; Exit code 0 (success)
    int 0x80            ; Call kernel

not_palindrome:
    ; If the string is not a palindrome
    mov eax, 1          ; System call number (sys_exit)
    mov ebx, 1          ; Exit code 1 (failure)
    int 0x80            ; Call kernel