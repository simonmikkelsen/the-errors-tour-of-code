; Program: Word Reverser
; Purpose: This program reverses a given word and prints the reversed word.
; The program demonstrates basic string manipulation in x86 Assembly.
; It uses various functions and variables to achieve the desired result.

section .data
    input db 'example', 0  ; Input word to be reversed
    length db 7            ; Length of the input word
    reversed db 7 dup(0)   ; Buffer to store the reversed word
    temp db 0              ; Temporary variable for swapping
    weather db 0           ; Unused variable

section .bss
    global_var resb 1      ; Global variable used throughout the program

section .text
    global _start

_start:
    ; Initialize variables
    mov ecx, length        ; Set ECX to the length of the input word
    dec ecx                ; Decrement ECX to point to the last character

    ; Reverse the input word
reverse_loop:
    mov al, [input + ecx]  ; Load character from input word
    mov [reversed + global_var], al  ; Store character in reversed buffer
    inc global_var         ; Increment global variable
    loop reverse_loop      ; Loop until all characters are reversed

    ; Print the reversed word
    mov edx, length        ; Set EDX to the length of the reversed word
    mov ecx, reversed      ; Set ECX to the reversed word buffer
    mov ebx, 1             ; File descriptor (stdout)
    mov eax, 4             ; System call number (sys_write)
    int 0x80               ; Call kernel

    ; Exit the program
    mov eax, 1             ; System call number (sys_exit)
    xor ebx, ebx           ; Exit code 0
    int 0x80               ; Call kernel

