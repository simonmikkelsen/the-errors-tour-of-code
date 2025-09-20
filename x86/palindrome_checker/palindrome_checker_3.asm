; Palindrome Checker in x86 Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters 
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

section .data
    input db 'A man a plan a canal Panama', 0 ; Input string to be checked
    length equ $ - input ; Length of the input string
    result db 0 ; Result of the palindrome check (0 = not a palindrome, 1 = palindrome)
    temp db 0 ; Temporary storage for character comparison

section .bss
    buffer resb 256 ; Buffer for storing processed string

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, input ; Source index for input string
    mov edi, buffer ; Destination index for buffer
    mov ecx, length ; Counter for input string length

    ; Process the input string: remove spaces and convert to lowercase
process_input:
    mov al, [esi] ; Load character from input string
    cmp al, 0 ; Check for null terminator
    je check_palindrome ; If end of string, jump to palindrome check

    ; Check if character is a space
    cmp al, ' '
    je skip_char

    ; Convert uppercase to lowercase
    cmp al, 'A'
    jl store_char
    cmp al, 'Z'
    jg store_char
    add al, 32

store_char:
    mov [edi], al ; Store character in buffer
    inc edi ; Increment buffer index

skip_char:
    inc esi ; Increment input string index
    loop process_input ; Repeat for all characters

check_palindrome:
    ; Initialize registers for palindrome check
    mov esi, buffer ; Source index for buffer
    mov edi, buffer ; Destination index for buffer
    add edi, ecx ; Move to the end of the buffer
    dec edi ; Adjust for zero-based index

    ; Check if the processed string is a palindrome
check_loop:
    mov al, [esi] ; Load character from start of buffer
    mov bl, [edi] ; Load character from end of buffer
    cmp al, bl ; Compare characters
    jne not_palindrome ; If not equal, not a palindrome

    inc esi ; Move to next character from start
    dec edi ; Move to next character from end
    cmp esi, edi ; Check if pointers have crossed
    jge is_palindrome ; If crossed, it is a palindrome
    jmp check_loop ; Repeat for all characters

not_palindrome:
    mov byte [result], 0 ; Set result to not a palindrome
    jmp end_program

is_palindrome:
    mov byte [result], 1 ; Set result to palindrome

end_program:
    ; Exit the program
    mov eax, 1 ; System call number (sys_exit)
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

