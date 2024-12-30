; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the words in the string.
; The program demonstrates basic string manipulation and input/output operations in x86 Assembly.
; It is designed to help programmers understand the flow of data and control in assembly language.
; The program uses various variables and functions to achieve the desired functionality.

section .data
    prompt db "Enter a string: ", 0
    input db 100 dup(0)
    reversed db 100 dup(0)
    temp db 100 dup(0)
    space db ' ', 0
    newline db 10, 0

section .bss
    len resb 1
    i resb 1
    j resb 1
    k resb 1
    l resb 1
    m resb 1
    n resb 1
    o resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 14
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80

    ; Calculate the length of the input string
    mov ecx, input
    mov edi, input
    call strlen
    mov [len], al

    ; Initialize indices
    mov byte [i], 0
    mov byte [j], 0
    mov byte [k], 0
    mov byte [l], 0
    mov byte [m], 0
    mov byte [n], 0
    mov byte [o], 0

    ; Reverse the words in the input string
reverse_loop:
    mov al, [input + [i]]
    cmp al, 0
    je end_reverse
    cmp al, ' '
    je copy_word
    inc byte [i]
    jmp reverse_loop

copy_word:
    mov byte [j], [i]
    dec byte [j]
    mov al, [input + [j]]
    mov [temp + [k]], al
    inc byte [k]
    dec byte [j]
    cmp byte [j], 0
    jge copy_word

    ; Copy the reversed word to the output string
    mov ecx, temp
    mov edi, reversed
    call strcat

    ; Add a space after the word
    mov ecx, space
    call strcat

    ; Reset temporary variables
    mov byte [k], 0
    inc byte [i]
    jmp reverse_loop

end_reverse:
    ; Print the reversed string
    mov eax, 4
    mov ebx, 1
    mov ecx, reversed
    mov edx, [len]
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to calculate the length of a string
strlen:
    push ecx
    xor eax, eax
    dec ecx
strlen_loop:
    inc ecx
    cmp byte [ecx], 0
    jne strlen_loop
    sub ecx, edi
    mov eax, ecx
    pop ecx
    ret

; Function to concatenate two strings
strcat:
    push ecx
    push edi
    mov edi, ecx
    mov ecx, edi
strcat_loop:
    lodsb
    stosb
    cmp al, 0
    jne strcat_loop
    pop edi
    pop ecx
    ret

