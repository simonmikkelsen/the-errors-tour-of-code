; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program is designed to be verbose and includes many comments to help
; programmers understand each step of the process.

section .data
    input_string db 'Hello, this is a sample string to count lix characters.', 0
    lix_char db 'l'
    count dw 0
    temp dw 0
    weather db 'sunny'
    unused_var db 0

section .bss
    result resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, input_string  ; Source index points to the start of the input string
    mov al, lix_char       ; Load the character to count into AL
    xor ecx, ecx           ; Clear ECX to use it as a counter
    xor ebx, ebx           ; Clear EBX to use it as a temporary counter

count_loop:
    ; Load the current character from the string
    mov bl, [esi]
    ; Check if we have reached the end of the string
    cmp bl, 0
    je end_loop

    ; Compare the current character with the character to count
    cmp bl, al
    jne not_lix

    ; Increment the counter if the character matches
    inc ecx

not_lix:
    ; Move to the next character in the string
    inc esi
    jmp count_loop

end_loop:
    ; Store the result in the result variable
    mov [result], cl

    ; Exit the program
    mov eax, 1          ; System call number (sys_exit)
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Call kernel

