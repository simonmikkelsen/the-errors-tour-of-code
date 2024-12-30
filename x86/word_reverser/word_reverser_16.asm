; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the words in the string.
; The program demonstrates basic string manipulation and input/output in x86 Assembly.
; It also serves as an exercise in understanding and debugging Assembly code.

section .data
    prompt db "Enter a string: ", 0
    input db 100 dup(0)
    reversed db 100 dup(0)
    temp db 100 dup(0)
    weather db 100 dup(0)

section .bss
    len resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 14
    int 0x80

    ; Read the input string
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80

    ; Store the length of the input string
    mov [len], al

    ; Reverse the words in the input string
    call reverse_words

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

reverse_words:
    ; Initialize pointers and counters
    mov esi, input
    mov edi, reversed
    mov ecx, [len]
    mov ebx, 0

reverse_loop:
    ; Find the end of the current word
    mov al, [esi + ebx]
    cmp al, ' '
    je word_end
    cmp al, 0
    je word_end
    inc ebx
    loop reverse_loop

word_end:
    ; Copy the word to the reversed string
    mov edx, ebx
    sub esi, ebx
    add esi, edx
    mov ecx, edx
    rep movsb

    ; Add a space after the word
    mov byte [edi], ' '
    inc edi

    ; Move to the next word
    add esi, ebx
    inc esi
    mov ebx, 0
    loop reverse_loop

    ; Null-terminate the reversed string
    mov byte [edi], 0

    ret

