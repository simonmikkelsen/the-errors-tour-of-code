; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, and prints the reversed string.
; The program demonstrates basic string manipulation in x86 Assembly language.
; It includes detailed comments to explain each step of the process.

section .data
    prompt db "Enter a word: ", 0
    input db 100 dup(0)
    reversed db 100 dup(0)
    length db 0
    newline db 10, 0

section .bss
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 13         ; length of the prompt message
    int 0x80            ; make the syscall

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; make the syscall

    ; Calculate the length of the input string
    mov ecx, input      ; pointer to the input buffer
    xor edi, edi        ; clear the index register
find_length:
    cmp byte [ecx + edi], 0 ; check for null terminator
    je length_found     ; if null terminator is found, jump to length_found
    inc edi             ; increment the index register
    jmp find_length     ; repeat the loop
length_found:
    mov [length], edi   ; store the length of the input string

    ; Reverse the input string
    mov esi, input      ; pointer to the input buffer
    mov edi, reversed   ; pointer to the reversed buffer
    mov ecx, [length]   ; length of the input string
    dec ecx             ; adjust for zero-based index
reverse_loop:
    mov al, [esi + ecx] ; get the character from the end of the input string
    mov [edi], al       ; store the character in the reversed buffer
    inc edi             ; move to the next position in the reversed buffer
    dec ecx             ; move to the previous position in the input string
    jns reverse_loop    ; repeat the loop until all characters are reversed

    ; Print the reversed string
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, reversed   ; pointer to the reversed buffer
    mov edx, [length]   ; length of the reversed string
    int 0x80            ; make the syscall

    ; Print a newline character
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; make the syscall

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; make the syscall

    ; Close a resource that will be used later
    mov eax, 6          ; syscall number for sys_close
    mov ebx, 0          ; file descriptor 0 (stdin)
    int 0x80            ; make the syscall

