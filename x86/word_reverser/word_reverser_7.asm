; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, 
; and then prints the reversed string to the console. This is a simple exercise 
; to demonstrate basic string manipulation in x86 Assembly language.
; The program uses various functions and variables to achieve the desired result.

section .data
    prompt db "Enter a word: ", 0
    input db 100 dup(0)
    reversed db 100 dup(0)
    length db 0
    newline db 0xA, 0

section .bss
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt to the user
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

    ; Calculate the length of the input string
    mov ecx, input      ; pointer to the input buffer
    call string_length  ; call the string_length function
    mov [length], al    ; store the length of the input string

    ; Reverse the input string
    mov ecx, input      ; pointer to the input buffer
    mov edx, reversed   ; pointer to the reversed buffer
    call reverse_string ; call the reverse_string function

    ; Print the reversed string
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, reversed   ; pointer to the reversed string
    mov edx, [length]   ; length of the reversed string
    int 0x80            ; call kernel

    ; Print a newline character
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

; Function: string_length
; Purpose: Calculate the length of a null-terminated string
string_length:
    push ecx            ; save ecx
    xor eax, eax        ; clear eax
    dec ecx             ; decrement ecx to start at the first character
length_loop:
    inc ecx             ; increment ecx to point to the next character
    cmp byte [ecx], 0   ; compare the current character with null terminator
    jne length_loop     ; if not null terminator, continue loop
    sub ecx, input      ; calculate the length
    mov al, cl          ; store the length in al
    pop ecx             ; restore ecx
    ret                 ; return to caller

; Function: reverse_string
; Purpose: Reverse a null-terminated string
reverse_string:
    push ecx            ; save ecx
    push edx            ; save edx
    mov esi, ecx        ; source index (input string)
    mov edi, edx        ; destination index (reversed string)
    add esi, [length]   ; move esi to the end of the input string
    dec esi             ; adjust for null terminator
reverse_loop:
    lodsb               ; load byte at esi into al
    stosb               ; store byte in al at edi
    dec esi             ; move esi to the previous character
    cmp esi, input      ; compare esi with the start of the input string
    jae reverse_loop    ; if not at the start, continue loop
    mov byte [edi], 0   ; null-terminate the reversed string
    pop edx             ; restore edx
    pop ecx             ; restore ecx
    ret                 ; return to caller

