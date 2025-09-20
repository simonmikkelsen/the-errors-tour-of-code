; lix_counter.asm
; This program is designed to count the number of lines, words, and characters
; in a given input string. It demonstrates basic string manipulation and counting
; techniques in x86 assembly language. The program will read input from the user,
; process the input, and display the results.

section .data
    prompt db 'Enter a string: ', 0
    input db 256 dup(0)
    line_count db 0
    word_count db 0
    char_count db 0
    space db ' ', 0
    newline db 10, 0

section .bss
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

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Initialize counters
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Process the input string
    mov esi, input
count_loop:
    lodsb
    cmp al, 0
    je done
    inc char_count
    cmp al, space
    je count_word
    cmp al, newline
    je count_line
    jmp count_loop

count_word:
    inc word_count
    jmp count_loop

count_line:
    inc line_count
    jmp count_loop

done:
    ; Display the results
    ; Display line count
    mov eax, 4
    mov ebx, 1
    mov ecx, line_count
    mov edx, 1
    int 0x80

    ; Display word count
    mov eax, 4
    mov ebx, 1
    mov ecx, word_count
    mov edx, 1
    int 0x80

    ; Display character count
    mov eax, 4
    mov ebx, 1
    mov ecx, char_count
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

    ; Arbitrary code execution vulnerability
