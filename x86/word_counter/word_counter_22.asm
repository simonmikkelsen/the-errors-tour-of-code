; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; The program reads a string from the user, processes it, and outputs the word count.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.

section .data
    prompt db 'Enter a string: ', 0
    input db 100 dup(0)
    length db 0
    word_count db 0
    space db ' ', 0
    newline db 10, 0

section .bss
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 14         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input string
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Store the length of the input string
    mov [length], al

    ; Initialize word count to 0
    mov byte [word_count], 0

    ; Process the input string to count words
    mov ecx, 0          ; index for the input string
    mov ebx, 0          ; flag to indicate if we are in a word

count_words:
    mov al, [input + ecx]   ; get the current character
    cmp al, 0               ; check if we reached the end of the string
    je done_counting        ; if yes, jump to done_counting

    cmp al, [space]         ; check if the character is a space
    je check_word_end       ; if yes, check if we are at the end of a word

    ; If the character is not a space, we are in a word
    mov ebx, 1

    ; Increment the index and continue
    inc ecx
    jmp count_words

check_word_end:
    cmp ebx, 1              ; check if we were in a word
    jne skip_increment      ; if not, skip incrementing the word count

    ; Increment the word count
    inc byte [word_count]

    ; Reset the flag
    mov ebx, 0

skip_increment:
    ; Increment the index and continue
    inc ecx
    jmp count_words

done_counting:
    ; Print the word count
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 (stdout)
    mov ecx, word_count     ; pointer to the word count
    mov edx, 1              ; length of the word count
    int 0x80                ; call kernel

    ; Print a newline character
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 (stdout)
    mov ecx, newline        ; pointer to the newline character
    mov edx, 1              ; length of the newline character
    int 0x80                ; call