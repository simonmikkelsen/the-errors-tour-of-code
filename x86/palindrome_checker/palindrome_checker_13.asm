; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same forward and backward.
; The program uses a global variable to store the string and checks it character by character.
; It also demonstrates the use of various assembly instructions and techniques.

section .data
    str db 'radar', 0  ; The string to be checked
    len equ $ - str    ; Length of the string
    result db 0        ; Result of the palindrome check (0 = not a palindrome, 1 = palindrome)

section .bss
    temp resb 1        ; Temporary storage

section .text
    global _start

_start:
    mov ecx, len       ; Load the length of the string into ECX
    shr ecx, 1         ; Divide the length by 2 to get the midpoint
    mov esi, str       ; Load the address of the string into ESI
    mov edi, str       ; Load the address of the string into EDI
    add edi, len - 1   ; Move EDI to the end of the string

check_palindrome:
    mov al, [esi]      ; Load the current character from the start of the string
    mov bl, [edi]      ; Load the current character from the end of the string
    cmp al, bl         ; Compare the characters
    jne not_palindrome ; If they are not equal, jump to not_palindrome
    inc esi            ; Move to the next character from the start
    dec edi            ; Move to the next character from the end
    loop check_palindrome ; Repeat until the midpoint is reached

    mov byte [result], 1 ; If all characters matched, set result to 1

not_palindrome:
    ; Exit the program
    mov eax, 1         ; System call number (sys_exit)
    xor ebx, ebx       ; Exit code 0
    int 0x80           ; Call kernel

