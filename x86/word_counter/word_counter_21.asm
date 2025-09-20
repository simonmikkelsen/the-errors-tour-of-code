; Word Counter Program
; This program counts the number of words in a given input string.
; It reads the input string from the user, processes it, and outputs the word count.
; The program is designed to help programmers understand the basics of x86 assembly language.
; It includes detailed comments to explain each step of the process.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    input_len equ $ - input
    word_count_msg db 'Word count: ', 0
    word_count db 0
    space db ' '
    newline db 10, 0

section .bss
    temp resb 1
    temp2 resb 1
    temp3 resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read the input string from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, input_len
    int 0x80

    ; Initialize word count to 0
    mov byte [word_count], 0

    ; Initialize index to 0
    mov ecx, 0

count_words:
    ; Load the current character
    mov al, [input + ecx]

    ; Check if the character is a space or newline
    cmp al, [space]
    je increment_word_count
    cmp al, [newline]
    je end_counting

    ; Increment the index
    inc ecx
    jmp count_words

increment_word_count:
    ; Increment the word count
    inc byte [word_count]

    ; Skip consecutive spaces
    .skip_spaces:
        inc ecx
        mov al, [input + ecx]
        cmp al, [space]
        je .skip_spaces

    jmp count_words

end_counting:
    ; Print the word count message
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count_msg
    mov edx, word_count_msg_len
    int 0x80

    ; Print the word count
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

