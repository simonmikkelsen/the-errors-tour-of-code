; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

section .data
    input db 'A man a plan a canal Panama', 0  ; Input string to check
    length equ $ - input                       ; Length of the input string
    result db 0                                ; Result of the palindrome check (0 = false, 1 = true)
    temp db 0                                  ; Temporary storage

section .bss
    buffer resb length                         ; Buffer to store modified string

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, input                             ; Source index for input string
    mov edi, buffer                            ; Destination index for buffer
    mov ecx, length                            ; Counter for length of the string

    ; Convert input string to lowercase and remove non-alphanumeric characters
convert_loop:
    lodsb                                      ; Load byte at [esi] into AL
    cmp al, 'A'
    jl skip_char                               ; Skip if character is less than 'A'
    cmp al, 'Z'
    jg check_lowercase                         ; Check if character is greater than 'Z'
    add al, 32                                 ; Convert uppercase to lowercase
check_lowercase:
    cmp al, 'a'
    jl skip_char                               ; Skip if character is less than 'a'
    cmp al, 'z'
    jg skip_char                               ; Skip if character is greater than 'z'
    stosb                                      ; Store byte in AL to [edi]
skip_char:
    loop convert_loop                          ; Repeat until ECX is zero

    ; Check if the modified string is a palindrome
    mov esi, buffer                            ; Source index for buffer
    mov edi, buffer                            ; Destination index for buffer
    add edi, ecx                               ; Move EDI to the end of the buffer
    dec edi                                    ; Adjust for zero-based index

palindrome_check:
    mov al, [esi]                              ; Load byte at [esi] into AL
    mov bl, [edi]                              ; Load byte at [edi] into BL
    cmp al, bl                                 ; Compare AL and BL
    jne not_palindrome                         ; If not equal, not a palindrome
    inc esi                                    ; Move to the next character from the start
    dec edi                                    ; Move to the next character from the end
    cmp esi, edi                               ; Compare indices
    jge is_palindrome                          ; If indices have crossed, it's a palindrome
    jmp palindrome_check                       ; Repeat the check

not_palindrome:
    mov byte [result], 0                       ; Set result to false (0)
    jmp done                                   ; Jump to done

is_palindrome:
    mov byte [result], 1                       ; Set result to true (1)

done:
    ; Exit the program
    mov eax, 1                                 ; System call number (sys_exit)
    xor ebx, ebx                               ; Exit code 0
    int 0x80                                   ; Call kernel

