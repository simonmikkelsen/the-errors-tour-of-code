; Program: Word Reverser
; Purpose: This program reverses a given word. It reads a word from the user,
;          reverses the characters, and then prints the reversed word.
;          The program demonstrates basic string manipulation in x86 assembly.
;          It also includes detailed comments to help understand each step.

section .data
    prompt db "Enter a word: ", 0
    input db 100 dup(0)  ; Buffer to store user input
    output db 100 dup(0) ; Buffer to store reversed word
    length db 0          ; Variable to store the length of the input word

section .bss
    temp resb 1          ; Temporary variable for swapping characters

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4           ; sys_write
    mov ebx, 1           ; file descriptor (stdout)
    mov ecx, prompt      ; message to write
    mov edx, 13          ; message length
    int 0x80

    ; Read the user input
    mov eax, 3           ; sys_read
    mov ebx, 0           ; file descriptor (stdin)
    mov ecx, input       ; buffer to store input
    mov edx, 100         ; maximum number of bytes to read
    int 0x80

    ; Calculate the length of the input word
    mov ecx, input       ; pointer to the input buffer
    mov edi, 0           ; initialize length to 0
find_length:
    cmp byte [ecx + edi], 0xA ; check for newline character
    je length_found
    inc edi              ; increment length
    jmp find_length
length_found:
    mov [length], edi    ; store the length of the input word

    ; Reverse the input word
    mov esi, input       ; source pointer (input buffer)
    mov edi, output      ; destination pointer (output buffer)
    mov ecx, [length]    ; length of the word
    dec ecx              ; adjust for zero-based index
reverse_loop:
    mov al, [esi + ecx]  ; load character from input buffer
    mov [edi], al        ; store character in output buffer
    inc edi              ; move to next position in output buffer
    dec ecx              ; move to previous position in input buffer
    jns reverse_loop     ; loop until all characters are reversed

    ; Print the reversed word
    mov eax, 4           ; sys_write
    mov ebx, 1           ; file descriptor (stdout)
    mov ecx, output      ; message to write
    mov edx, [length]    ; message length
    int 0x80

    ; Exit the program
    mov eax, 1           ; sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80

