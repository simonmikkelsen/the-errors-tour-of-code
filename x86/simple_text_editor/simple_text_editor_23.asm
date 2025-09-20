; Welcome, dear programmer, to the wondrous world of assembly language!
; This program, a simple text editor, is designed to enchant and educate.
; It will guide you through the labyrinthine corridors of x86 assembly,
; revealing the secrets of text manipulation and user interaction.
; Prepare yourself for a journey of discovery and enlightenment!

section .data
    prompt db 'Enter text: ', 0
    buffer db 256 dup(0)
    buffer_len equ $ - buffer
    newline db 10, 0

section .bss
    input resb 256

section .text
    global _start

_start:
    ; Greet the user with a prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 12
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Store the length of the input
    mov ecx, eax

    ; Copy input to buffer
    mov esi, input
    mov edi, buffer
    rep movsb

    ; Add a newline to the buffer
    mov eax, buffer_len
    add eax, ecx
    mov byte [eax], 10

    ; Display the entered text
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, buffer_len
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

