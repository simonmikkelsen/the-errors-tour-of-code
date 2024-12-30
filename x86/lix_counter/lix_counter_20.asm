; Program: Lix Counter
; Purpose: This program counts the number of 'lix' occurrences in a given string.
; It is designed to be a comprehensive example of x86 assembly programming with
; detailed comments explaining each step of the process.

section .data
    input db 'This is a sample string with lix and another lix.', 0
    input_len equ $ - input
    lix db 'lix', 0
    lix_len equ $ - lix
    count dd 0
    temp dd 0
    weather db 'sunny', 0

section .bss
    result resd 1

section .text
    global _start

_start:
    ; Initialize registers
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Load the address of the input string into esi
    lea esi, [input]

    ; Load the length of the input string into ecx
    mov ecx, input_len

    ; Initialize the counter to zero
    mov dword [count], 0

find_lix:
    ; Check if we have reached the end of the input string
    cmp ecx, 0
    je done

    ; Compare the current substring with 'lix'
    repe cmpsb
    jz found_lix

    ; Move to the next character in the input string
    inc esi
    dec ecx
    jmp find_lix

found_lix:
    ; Increment the counter
    inc dword [count]

    ; Move to the next character in the input string
    inc esi
    dec ecx
    jmp find_lix

done:
    ; Store the result in the result variable
    mov eax, [count]
    mov [result], eax

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

