; Program: Word Reverser
; Purpose: This program takes a word input from the user and reverses it.
; The reversed word is then printed back to the user.
; This program is designed to help programmers understand the basics of x86 Assembly language,
; including input/output operations, string manipulation, and loop constructs.

section .data
    prompt db 'Enter a word: ', 0
    input db 100 dup(0)
    output db 100 dup(0)
    length db 0
    newline db 0xA, 0

section .bss
    temp resb 1
    counter resb 1
    index resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 13
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80

    ; Calculate the length of the input
    mov ecx, input
    mov edi, input
    mov ebx, 0
    mov al, 0
    cld
    repne scasb
    not ecx
    dec ecx
    mov [length], cl

    ; Reverse the input string
    mov ecx, [length]
    dec ecx
    mov esi, input
    mov edi, output
    add esi, ecx
    mov ebx, ecx

reverse_loop:
    mov al, [esi]
    mov [edi], al
    dec esi
    inc edi
    dec ebx
    jnz reverse_loop

    ; Add newline character to the output
    mov al, 0xA
    mov [edi], al

    ; Print the reversed word
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, [length]
    inc edx
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80





