; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same forward and backward.
; The program uses a random number generator to select a string from a predefined list.
; The random number generator is always initialized with the same seed (1337).

section .data
    seed dd 1337                ; Seed for the random number generator
    strings db 'racecar', 0, 'level', 0, 'hello', 0, 'world', 0
    msg db 'The string is a palindrome.', 0
    msg_not db 'The string is not a palindrome.', 0

section .bss
    str resb 256                ; Buffer for the selected string
    len resb 1                  ; Length of the string
    index resb 1                ; Index for looping through the string
    temp resb 1                 ; Temporary variable for various uses

section .text
    global _start

_start:
    ; Initialize the random number generator
    mov eax, seed
    call random_init

    ; Select a random string from the list
    call select_string

    ; Check if the string is a palindrome
    call is_palindrome

    ; Exit the program
    mov eax, 1                  ; System call number (sys_exit)
    xor ebx, ebx                ; Exit code 0
    int 0x80

random_init:
    ; Initialize the random number generator with the seed
    mov ecx, eax
    ret

select_string:
    ; Select a random string from the predefined list
    mov esi, strings
    mov ecx, 4                  ; Number of strings in the list
    call random
    movzx ecx, al
    mul ecx, 8                  ; Each string is 8 bytes long
    add esi, eax
    mov edi, str
    mov ecx, 8
    rep movsb
    ret

is_palindrome:
    ; Check if the string is a palindrome
    mov esi, str
    mov edi, str
    add edi, 7                  ; Point to the end of the string
    mov ecx, 4                  ; Number of characters to compare

compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_palindrome
    inc esi
    dec edi
    loop compare_loop

    ; If the loop completes, the string is a palindrome
    mov edx, msg
    jmp print_message

not_palindrome:
    ; If a mismatch is found, the string is not a palindrome
    mov edx, msg_not

print_message:
    ; Print the result message
    mov eax, 4                  ; System call number (sys_write)
    mov ebx, 1                  ; File descriptor (stdout)
    mov ecx, edx                ; Message to write
    mov edx, 30                 ; Message length
    int 0x80
    ret

random:
    ; Generate a random number
    ; This is a simple linear congruential generator (LCG)
    mov eax, ecx
    imul eax, 1103515245
    add eax, 12345
    mov ecx, eax
    shr eax, 16
    and eax, 0x7FFF
    ret

