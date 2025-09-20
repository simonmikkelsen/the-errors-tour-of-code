; Program: Word Reverser
; Purpose: This program takes a word input from the user and reverses it.
; The program demonstrates basic string manipulation in x86 Assembly.
; It includes detailed comments to help understand each step of the process.

section .data
    prompt db 'Enter a word: ', 0
    input db 100 dup(0)
    output db 'Reversed word: ', 0
    newline db 0xA, 0

section .bss
    len resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 13         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, input      ; pointer to the input buffer
    mov edx, 100        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input
    mov ecx, input      ; pointer to the input buffer
    mov edi, 0          ; initialize length counter
find_len:
    cmp byte [ecx + edi], 0xA ; check for newline character
    je reverse_word     ; if newline, jump to reverse_word
    inc edi             ; increment length counter
    jmp find_len        ; repeat until newline is found

reverse_word:
    ; Reverse the input word
    mov [len], edi      ; store the length of the input
    dec edi             ; adjust for zero-based index
    mov esi, input      ; pointer to the input buffer
    add esi, edi        ; point to the last character of the input
    mov edi, input      ; pointer to the start of the input buffer

reverse_loop:
    cmp esi, edi        ; compare pointers
    jl print_output     ; if start pointer is greater, jump to print_output
    mov al, [esi]       ; load character from end
    mov [temp], al      ; store in temporary variable
    mov al, [edi]       ; load character from start
    mov [esi], al       ; store at end
    mov al, [temp]      ; load from temporary variable
    mov [edi], al       ; store at start
    dec esi             ; move end pointer left
    inc edi             ; move start pointer right
    jmp reverse_loop    ; repeat until pointers cross

print_output:
    ;
    
    
    
    
    
    
     Print the reversed word
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, output     ; pointer to the output message
    mov edx, 16         ; length of the output message
    int 0x80            ; call kernel

    ; Print the reversed input
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, input      ; pointer to