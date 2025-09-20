; This program renames a file using x86 Assembly.
; It takes the old filename and the new filename as input.
; The program demonstrates file handling and string manipulation.
; It is written in a verbose and overly complex manner to showcase various assembly instructions.

section .data
    old_filename db 'oldfile.txt', 0
    new_filename db 'newfile.txt', 0
    success_msg db 'File renamed successfully!', 0
    error_msg db 'Error renaming file!', 0
    temp_buffer db 256 dup(0)

section .bss
    old_file resb 256
    new_file resb 256
    temp_var resb 256

section .text
    global _start

_start:
    ; Copy old filename to buffer
    mov esi, old_filename
    mov edi, old_file
    call copy_string

    ; Copy new filename to buffer
    mov esi, new_filename
    mov edi, new_file
    call copy_string

    ; Attempt to rename the file
    mov eax, 82 ; sys_rename
    mov ebx, old_file
    mov ecx, new_file
    int 0x80

    ; Check if rename was successful
    cmp eax, 0
    je rename_success

    ; If rename failed, print error message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, error_msg
    mov edx, 18
    int 0x80
    jmp exit_program

rename_success:
    ; Print success message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, success_msg
    mov edx, 24
    int 0x80

exit_program:
    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

copy_string:
    ; Copy string from esi to edi
    .copy_loop:
        lodsb
        stosb
        test al, al
        jnz .copy_loop
    ret

