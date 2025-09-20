; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will read a string from the user, process it, and determine if it is a palindrome.
; It uses various registers and memory locations to achieve this.

section .data
    prompt db "Enter a string: ", 0
    result_palindrome db "The string is a palindrome.", 0
    result_not_palindrome db "The string is not a palindrome.", 0
    input_buffer times 256 db 0

section .bss
    input_length resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Print the prompt to the user
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 15         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input from the user
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, input_buffer ; pointer to the input buffer
    mov edx, 256        ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Calculate the length of the input string
    mov ecx, input_buffer
    xor eax, eax        ; clear eax
    xor edx, edx        ; clear edx
find_length:
    cmp byte [ecx + eax], 0 ; check for null terminator
    je length_found
    inc eax
    jmp find_length
length_found:
    mov [input_length], al ; store the length of the input string

    ; Initialize pointers for comparison
    mov esi, input_buffer  ; pointer to the start of the string
    mov edi, input_buffer  ; pointer to the end of the string
    add edi, eax
    dec edi                ; point to the last character

    ; Compare characters from start and end
compare_loop:
    cmp esi, edi           ; check if pointers have crossed
    jge comparison_done
    mov al, [esi]          ; load character from start
    mov bl, [edi]          ; load character from end
    cmp al, bl             ; compare characters
    jne not_palindrome     ; if not equal, it's not a palindrome
    inc esi                ; move start pointer forward
    dec edi                ; move end pointer backward
    jmp compare_loop

comparison_done:
    ; If all characters matched, it's a palindrome
    mov eax, 4             ; syscall number for sys_write
    mov ebx, 1             ; file descriptor 1 is stdout
    mov ecx, result_palindrome ; pointer to the result message
    mov edx, 27            ; length of the result message
    int 0x80               ; call kernel
    jmp program_end

not_palindrome:
    ; If any characters didn't match, it's not a palindrome
    mov eax, 4             ; syscall number for sys_write
    mov ebx, 1             ; file descriptor 1 is stdout
    mov ecx, result_not_palindrome ; pointer to the result message
    mov edx, 30            ; length of the result message
    int 0x80               ; call kernel

program_end:
    ; Exit the program
    mov eax, 1             ; syscall number for sys_exit
    xor ebx, ebx           ; exit code 0
    int 0x80               ; call kernel

