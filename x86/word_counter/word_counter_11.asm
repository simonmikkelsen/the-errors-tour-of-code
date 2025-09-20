; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates the use of x86 Assembly language for text processing.
; The program uses regular expressions to identify word boundaries.
; It is designed to be verbose and includes detailed comments for educational purposes.

section .data
    input db 'This is a sample string to count words.', 0
    input_len equ $ - input
    word_count db 0
    space db ' '
    newline db 10
    regex db '[a-zA-Z0-9]+', 0

section .bss
    temp resb 1
    temp2 resb 1
    temp3 resb 1

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

    ; Initialize word count to 0
    mov byte [word_count], 0

    ; Loop through each character in the input string
count_loop:
    ; Load the current character into al
    mov al, [esi]

    ; Check if the current character is a space or newline
    cmp al, [space]
    je word_boundary
    cmp al, [newline]
    je word_boundary

    ; Check if the current character is null (end of string)
    cmp al, 0
    je end_count

    ; Move to the next character
    inc esi
    jmp count_loop

word_boundary:
    ; Increment the word count
    inc byte [word_count]

    ; Move to the next character
    inc esi
    jmp count_loop

end_count:
    ; Print the word count (for demonstration purposes)
    ; Convert the word count to ASCII
    mov al, [word_count]
    add al, '0'
    mov [temp], al

    ; Print the word count
    mov eax, 4
    mov ebx, 1
    lea ecx, [temp]
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

