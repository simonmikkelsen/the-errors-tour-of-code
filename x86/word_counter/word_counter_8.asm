; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; The program demonstrates basic string manipulation and counting techniques in x86 Assembly.
; It is designed to help programmers understand the flow of control and data in assembly language.

section .data
    input db 'This is a sample string to count words.', 0
    len equ $ - input
    space db ' '
    newline db 10
    count db 0

section .bss
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, len         ; Length of the input string
    mov esi, input       ; Source index pointing to the input string
    mov al, space        ; Space character for comparison
    mov bl, 0            ; Word count initialized to 0

count_words:
    ; Check if end of string is reached
    cmp ecx, 0
    je done

    ; Load the current character
    lodsb

    ; Compare with space
    cmp al, space
    je found_space

    ; Compare with newline
    cmp al, newline
    je found_space

    ; If not a space or newline, continue
    jmp count_words

found_space:
    ; Increment word count
    inc bl

    ; Continue counting
    jmp count_words

done:
    ; Store the word count in the count variable
    mov [count], bl

    ; Exit the program
    mov eax, 1          ; System call number (sys_exit)
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Call kernel

