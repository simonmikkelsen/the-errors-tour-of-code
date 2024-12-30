; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

section .data
    input db 'A man a plan a canal Panama', 0  ; Input string to check
    length equ $ - input                       ; Length of the input string
    result db 0                                ; Result of the palindrome check (0 = false, 1 = true)

section .bss
    temp resb 1                                ; Temporary storage for characters
    i resb 1                                   ; Index variable for forward traversal
    j resb 1                                   ; Index variable for backward traversal

section .text
    global _start

_start:
    ; Initialize variables
    mov byte [i], 0                            ; Start index at 0
    mov byte [j], length - 1                   ; End index at length - 1

check_palindrome:
    ; Skip non-alphanumeric characters from the start
    mov al, [input + i]
    call is_alnum
    cmp al, 0
    je skip_start

    ; Skip non-alphanumeric characters from the end
    mov al, [input + j]
    call is_alnum
    cmp al, 0
    je skip_end

    ; Compare characters
    mov al, [input + i]
    mov bl, [input + j]
    call to_lower
    mov [temp], al
    call to_lower
    cmp [temp], bl
    jne not_palindrome

    ; Move to the next characters
    inc byte [i]
    dec byte [j]

    ; Check if indices have crossed
    mov al, [i]
    cmp al, [j]
    jle check_palindrome

    ; If all characters matched, it's a palindrome
    mov byte [result], 1
    jmp done

skip_start:
    inc byte [i]
    jmp check_palindrome

skip_end:
    dec byte [j]
    jmp check_palindrome

not_palindrome:
    ; If any characters didn't match, it's not a palindrome
    mov byte [result], 0

done:
    ; Exit the program
    mov eax, 1
    int 0x80

is_alnum:
    ; Check if the character in AL is alphanumeric
    ; Return 1 if true, 0 if false
    cmp al, 'A'
    jl not_alnum
    cmp al, 'Z'
    jle is_alpha

    cmp al, 'a'
    jl not_alnum
    cmp al, 'z'
    jle is_alpha

    cmp al, '0'
    jl not_alnum
    cmp al, '9'
    jle is_digit

not_alnum:
    mov al, 0
    ret

is_alpha:
    mov al, 1
    ret

is_digit:
    mov al, 1
    ret

to_lower:
    ; Convert the character in AL to lowercase if it's uppercase
    cmp al, 'A'
    jl done_lower
    cmp al, 'Z'
    jg done_lower
    add al, 32

done_lower:
    ret

