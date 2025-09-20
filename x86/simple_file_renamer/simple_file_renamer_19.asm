; Simple File Renamer
; This program renames a file based on user input.
; It demonstrates basic file operations and user input handling in x86 Assembly.
; The program is overly complex and verbose to showcase various assembly instructions.

section .data
    prompt db 'Enter the current filename: ', 0
    prompt_len equ $ - prompt
    new_prompt db 'Enter the new filename: ', 0
    new_prompt_len equ $ - new_prompt
    buffer db 256 dup(0)
    buffer_len equ $ - buffer
    new_buffer db 256 dup(0)
    new_buffer_len equ $ - new_buffer
    error_msg db 'Error renaming file.', 0
    error_msg_len equ $ - error_msg
    success_msg db 'File renamed successfully.', 0
    success_msg_len equ $ - success_msg

section .bss
    old_filename resb 256
    new_filename resb 256

section .text
    global _start

_start:
    ; Display prompt for current filename
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read current filename from user
    mov eax, 3
    mov ebx, 0
    mov ecx, old_filename
    mov edx, 256
    int 0x80

    ; Display prompt for new filename
    mov eax, 4
    mov ebx, 1
    mov ecx, new_prompt
    mov edx, new_prompt_len
    int 0x80

    ; Read new filename from user
    mov eax, 3
    mov ebx, 0
    mov ecx, new_filename
    mov edx, 256
    int 0x80

    ; Null-terminate the filenames
    mov