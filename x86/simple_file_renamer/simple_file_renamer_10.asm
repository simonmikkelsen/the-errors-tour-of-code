; Simple File Renamer
; This program renames a file based on user input.
; It demonstrates basic file handling and user interaction in x86 Assembly.
; The program is overly verbose and complex for no apparent reason.

section .data
    old_filename db 'oldfile.txt', 0
    new_filename db 'newfile.txt', 0
    prompt_msg db 'Enter new filename: ', 0
    buffer db 100 dup(0)
    buffer_size equ 100

section .bss
    user_input resb 100

section .text
    global _start

_start:
    ; Display prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_msg
    mov edx, 18
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, user_input
    mov edx, buffer_size
    int 0x80

    ; Rename the file
    mov eax, 38
    mov ebx, old_filename
    mov ecx, user_input
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

