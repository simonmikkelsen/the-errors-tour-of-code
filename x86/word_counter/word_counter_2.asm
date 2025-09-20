; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program reads a string from the user, processes it to count the words, and displays the result.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    output db 'Word count: ', 0
    newline db 10, 0
    space db ' ', 0

section .bss
    count resb 1
    temp resb 1

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

    ; Initialize word count to 0
    mov byte [count], 0

    ; Initialize index to 0
    xor esi, esi

count_words:
    ; Load the current character
    mov al, [input + esi]
    cmp al, 0
    je done_counting

    ; Check if the character is a space
    cmp al, [space]
    jne not_space

    ; Increment word count
    inc byte [count]

not_space:
    ; Increment index
    inc esi
    jmp count_words

done_counting:
    ; Print the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 12
    int 0x80

    ; Print the word count
    mov al, [count]
    add al, '0'
    mov [temp], al
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

