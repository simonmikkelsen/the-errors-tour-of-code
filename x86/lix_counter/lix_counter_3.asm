; lix_counter.asm
; This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program reads a string from the user, processes it to count the 'lix' characters,
; and then outputs the count to the console.

section .data
    prompt db "Enter a string: ", 0
    prompt_len equ $ - prompt
    result_msg db "Number of 'lix' characters: ", 0
    result_msg_len equ $ - result_msg
    buffer db 256 dup(0)
    buffer_size equ 256

section .bss
    count resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, prompt_len ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input string
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, buffer     ; pointer to the buffer
    mov edx, buffer_size; size of the buffer
    int 0x80            ; call kernel

    ; Initialize the count to 0
    mov byte [count], 0

    ; Initialize index to 0
    mov esi, buffer

count_lix:
    ; Load the current character
    mov al, [esi]
    cmp al, 0           ; Check for null terminator
    je done_counting    ; If null terminator, end loop

    ; Check if the character is 'l', 'i', or 'x'
    cmp al, 'l'
    je increment_count
    cmp al, 'i'
    je increment_count
    cmp al, 'x'
    je increment_count

    ; Move to the next character
    jmp next_char

increment_count:
    ; Increment the count
    inc byte [count]

next_char:
    ; Increment the index
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
    mov eax, 1          ; syscall number for