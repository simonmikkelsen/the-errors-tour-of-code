; Program: Word Reverser
; Purpose: This program takes a word input from the user and reverses it.
; The reversed word is then displayed back to the user.
; This program is designed to help programmers understand the basics of x86 assembly language,
; including input/output operations, string manipulation, and loop constructs.

section .data
    prompt db 'Enter a word: ', 0
    promptLen equ $ - prompt
    output db 'Reversed word: ', 0
    outputLen equ $ - output
    buffer db 256 dup(0)
    bufferLen equ 256

section .bss
    input resb 256
    length resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, prompt         ; pointer to the prompt message
    mov edx, promptLen      ; length of the prompt message
    int 0x80                ; call kernel

    ; Read the user input
    mov eax, 3              ; syscall number for sys_read
    mov ebx, 0              ; file descriptor 0 is stdin
    mov ecx, input          ; pointer to the input buffer
    mov edx, bufferLen      ; maximum number of bytes to read
    int 0x80                ; call kernel

    ; Calculate the length of the input
    mov ecx, input          ; pointer to the input buffer
    mov edi, 0              ; initialize length counter
find_length:
    cmp byte [ecx + edi], 0 ; check for null terminator
    je length_found         ; if null terminator found, jump to length_found
    inc edi                 ; increment length counter
    jmp find_length         ; repeat the loop
length_found:
    mov [length], edi       ; store the length of the input

    ; Reverse the input string
    mov esi, input          ; source index points to the input buffer
    mov edi, buffer         ; destination index points to the buffer
    mov ecx, [length]       ; set loop counter to the length of the input
    dec ecx                 ; adjust for zero-based index
reverse_loop:
    mov al, [esi + ecx]     ; load byte from input buffer
    mov [edi], al           ; store byte in buffer
    inc edi                 ; move to the next position in buffer
    loop reverse_loop       ; repeat until all characters are reversed

    ; Display the reversed word
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, output         ; pointer to the output message
    mov edx, outputLen      ; length of the output message
    int 0x80                ; call kernel

    ; Display the reversed word from buffer
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, buffer         ; pointer to the reversed word
    mov edx, [length]       ; length of the reversed word
    int 0x80                ; call kernel

    ; Exit the program
    mov eax, 1              ; syscall number for sys_exit
    xor ebx, ebx            ; exit code 0
    int 0x80                ; call kernel

