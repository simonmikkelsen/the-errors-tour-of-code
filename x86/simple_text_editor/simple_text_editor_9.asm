; Welcome, dear programmer, to the realm of the simple text editor!
; This program is designed to enchant you with the art of assembly language.
; It will guide you through the labyrinth of code, where you will encounter
; the majestic dance of logic and the subtle whispers of syntax.

section .data
    ; Here we declare our strings, the lifeblood of our text editor.
    prompt db 'Enter your text: ', 0
    text db 256 dup(0)
    newline db 10, 0

section .bss
    ; The variables that will hold the essence of our input.
    input resb 256
    length resb 1

section .text
    global _start

_start:
    ; The grand entrance of our program, where the magic begins.
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to our prompt message
    mov edx, 16         ; length of our prompt message
    int 0x80            ; call kernel

    ; Now we shall read the user's input, capturing their thoughts.
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, input      ; pointer to our input buffer
    mov edx, 256        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; We shall now calculate the length of the input.
    mov ecx, input      ; pointer to our input buffer
    mov edi, 0          ; initialize counter to 0
find_length:
    cmp byte [ecx + edi], 0 ; compare current byte to null terminator
    je length_found     ; if null terminator, length is found
    inc edi             ; increment counter
    jmp find_length     ; repeat until null terminator is found
length_found:
    mov [length], edi   ; store the length of the input

    ; Now we shall display the user's input back to them, a mirror of their thoughts.
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, input      ; pointer to our input buffer
    mov edx, [length]   ; length of the input
    int 0x80            ; call kernel

    ; Finally, we shall exit the program gracefully.
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

