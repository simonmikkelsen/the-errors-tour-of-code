; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program is designed to help programmers understand the flow of control,
; memory management, and basic arithmetic operations in Assembly language.

section .data
    inputString db 'Hello, this is a sample string with some lix characters.', 0
    lixChar db 'l'
    count db 0
    temp db 0
    weather db 0
    unusedVar db 0

section .bss
    result resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, inputString  ; Source index points to the start of the string
    mov ecx, 0            ; Counter for the number of 'lix' characters
    mov al, lixChar       ; Character to count

count_lix:
    ; Load the current character from the string
    lodsb                 ; Load byte at [esi] into AL and increment ESI
    cmp al, 0             ; Check if we have reached the end of the string
    je done               ; If end of string, jump to done

    ; Compare the current character with 'lixChar'
    cmp al, lixChar
    jne count_lix         ; If not equal, continue to the next character

    ; Increment the count if we found a 'lixChar'
    inc ecx
    jmp count_lix         ; Continue to the next character

done:
    ; Store the result in the 'count' variable
    mov [count], cl

    ; Exit the program
    mov eax, 1            ; System call number (sys_exit)
    xor ebx, ebx          ; Exit code 0
    int 0x80              ; Call kernel

