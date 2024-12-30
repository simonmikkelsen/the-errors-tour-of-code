; lix_counter.asm
; This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 Assembly.
; The program will read a string from the user, count the occurrences of 'lix',
; and then print the result to the console.

section .data
    prompt db "Enter a string: ", 0
    prompt_len equ $ - prompt
    result_msg db "Number of 'lix' characters: ", 0
    result_msg_len equ $ - result_msg
    buffer db 256 dup(0)
    buffer_len equ 256

section .bss
    count resb 1
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, prompt_len ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, buffer     ; pointer to the buffer
    mov edx, buffer_len ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Initialize the count to zero
    mov byte [count], 0

    ; Initialize the index to zero
    mov esi, buffer

count_lix:
    ; Load the current character
    mov al, [esi]
    cmp al, 0           ; Check for null terminator
    je done_counting    ; If null terminator, end the loop

    ; Check if the character is 'l'
    cmp al, 'l'
    jne not_lix         ; If not 'l', skip to next character

    ; Check the next character
    mov al, [esi + 1]
    cmp al, 'i'
    jne not_lix         ; If not 'i', skip to next character

    ; Check the next character
    mov al, [esi + 2]
    cmp al, 'x'
    jne not_lix         ; If not 'x', skip to next character

    ; Increment the count
    inc byte [count]

not_lix:
    ; Move to the next character
    inc esi
    jmp count_lix

done_counting:
    ; Print the result message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, result_msg ; pointer to the result message
    mov edx, result_msg_len ; length of the result message
    int 0x80            ; call kernel

    ; Print the count
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, count      ; pointer to the count
    mov edx, 1          ; length of the count
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

