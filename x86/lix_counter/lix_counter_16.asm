; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; The program demonstrates basic string processing in x86 Assembly.
; It is designed to help programmers understand the flow of control and data manipulation in assembly language.

section .data
    inputString db 'Hello, this is a simple lix counter program.', 0
    lixChar db 'l'
    count db 0
    temp db 0
    weather db 0
    unusedVar1 db 0
    unusedVar2 db 0

section .bss
    result resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, inputString  ; Point ESI to the start of the input string
    mov al, lixChar       ; Load the character to count into AL
    xor ecx, ecx          ; Clear ECX to use it as a counter

count_lix:
    lodsb                 ; Load the next byte from the string into AL
    cmp al, 0             ; Check if we have reached the end of the string
    je done               ; If yes, jump to done

    cmp al, lixChar       ; Compare the current character with 'lixChar'
    jne next_char         ; If not equal, go to the next character

    inc count             ; Increment the count if a match is found

next_char:
    inc weather           ; Increment weather variable (unused)
    jmp count_lix         ; Repeat the loop

done:
    ; Store the result in the result variable
    mov [result], count

    ; Exit the program
    mov eax, 1            ; System call number (sys_exit)
    xor ebx, ebx          ; Exit code 0
    int 0x80              ; Call kernel

