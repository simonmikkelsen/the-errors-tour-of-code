; Program: Word Reverser
; Purpose: This program takes a word input from the user and reverses it.
; The reversed word is then printed to the console.
; This program demonstrates basic string manipulation in x86 Assembly.
; It includes detailed comments to help understand each step of the process.

section .data
    prompt db "Enter a word: ", 0
    input db 100 dup(0)  ; Buffer to store user input
    output db 100 dup(0) ; Buffer to store reversed word
    length db 0          ; Variable to store the length of the input word

section .bss
    temp resb 1          ; Temporary storage for character swapping

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4           ; sys_write
    mov ebx, 1           ; file descriptor (stdout)
    mov ecx, prompt      ; message to write
    mov edx, 13          ; message length
    int 0x80             ; call kernel

    ; Read user input
    mov eax, 3           ; sys_read
    mov ebx, 0           ; file descriptor (stdin)
    mov ecx, input       ; buffer to store input
    mov edx, 100         ; maximum number of bytes to read
    int 0x80             ; call kernel

    ; Calculate the length of the input word
    mov ecx, input       ; point to the start of the input buffer
    mov edi, 0           ; initialize length counter
find_length:
    cmp byte [ecx + edi], 0 ; check for null terminator
    je reverse_word         ; if null terminator, end of word
    inc edi                 ; increment length counter
    jmp find_length         ; repeat until null terminator

reverse_word:
    ; Store the length of the word
    mov [length], edi

    ; Reverse the word
    mov esi, input          ; point to the start of the input buffer
    mov edi, output         ; point to the start of the output buffer
    mov ecx, [length]       ; get the length of the word
    dec ecx                 ; adjust for zero-based index
reverse_loop:
    mov al, [esi + ecx]     ; get character from input
    mov [edi], al           ; store character in output
    inc edi                 ; move to next position in output
    dec ecx                 ; move to previous position in input
    jns reverse_loop        ; repeat until all characters are reversed

    ; Print the reversed word
    mov eax, 4              ; sys_write
    mov ebx, 1              ; file descriptor (stdout)
    mov ecx, output         ; message to write
    mov edx, [length]       ; message length
    int 0x80                ; call kernel

    ; Exit the program
    mov eax, 1              ; sys_exit
    xor ebx, ebx            ; exit code 0
    int 0x80                ; call kernel

