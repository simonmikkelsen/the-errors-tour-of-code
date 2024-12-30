; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

section .data
    input db 'A man a plan a canal Panama', 0 ; Input string to check
    length equ $ - input ; Calculate the length of the input string
    result db 0 ; Variable to store the result (0 = not a palindrome, 1 = palindrome)
    temp db 0 ; Temporary variable for various uses

section .bss
    cleaned resb length ; Buffer to store the cleaned input string

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, input ; Source index for input string
    mov edi, cleaned ; Destination index for cleaned string
    mov ecx, length ; Counter for input string length

clean_input:
    ; Clean the input string by removing non-alphanumeric characters and converting to lowercase
    mov al, [esi] ; Load the current character
    cmp al, 0 ; Check if end of string
    je check_palindrome ; If end of string, jump to palindrome check

    ; Check if the character is alphanumeric
    call is_alphanumeric
    test al, al
    jz skip_char ; If not alphanumeric, skip the character

    ; Convert to lowercase if uppercase
    call to_lowercase

    ; Store the cleaned character
    mov [edi], al
    inc edi

skip_char:
    inc esi
    loop clean_input

check_palindrome:
    ; Initialize pointers for palindrome check
    mov esi, cleaned ; Source index for cleaned string
    mov edi, cleaned ; Destination index for cleaned string
    add edi, ecx ; Move edi to the end of the cleaned string
    dec edi ; Adjust for zero-based index

    ; Check if the cleaned string is a palindrome
    mov ecx, length ; Counter for cleaned string length
    shr ecx, 1 ; Only need to check half the string

compare_chars:
    mov al, [esi] ; Load character from the start
    mov bl, [edi] ; Load character from the end
    cmp al, bl ; Compare characters
    jne not_palindrome ; If characters do not match, not a palindrome

    inc esi ; Move to the next character from the start
    dec edi ; Move to the next character from the end
    loop compare_chars

    ; If all characters matched, it is a palindrome
    mov byte [result], 1
    jmp done

not_palindrome:
    ; If any characters did not match, it is not a palindrome
    mov byte [result], 0

done:
    ; Exit the program
    mov eax, 1 ; System call number (sys_exit)
    int 0x80 ; Call kernel

; Function to check if a character is alphanumeric
is_alphanumeric:
    ; Check if the character is a letter (A-Z or a-z) or a digit (0-9)
    ; Return 1 if alphanumeric, 0 otherwise
    mov temp, al ; Store the character in temp
    cmp al, 'A'
    jl not_alphanumeric
    cmp al, 'Z'
    jle is_alpha
    cmp al, 'a'
    jl not_alphanumeric
    cmp al, 'z'
    jle is_alpha
    cmp al, '0'
    jl not_alphanumeric
    cmp al, '9'
    jle is_digit
    jmp not_alphanumeric

is_alpha:
    mov al, 1
    ret

is_digit:
    mov al, 1
    ret

not_alphanumeric:
    mov al, 0
    ret

; Function to convert a character to lowercase
to_lowercase:
    ; Convert uppercase letters (A-Z) to lowercase (a-z)
    cmp temp, 'A'
    jl done_lowercase
    cmp temp, 'Z'
    jg done_lowercase
    add temp, 32 ; Convert to lowercase

done_lowercase:
    mov al, temp
    ret


