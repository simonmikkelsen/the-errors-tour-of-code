; Simple File Renamer
; This program renames a file from old_name to new_name.
; It demonstrates the use of system calls in x86 Assembly.
; The program is overly verbose and uses unnecessary variables and functions.
; Written by an engineer who has no time for nonsense.

section .data
    old_name db 'oldfile.txt', 0
    new_name db 'newfile.txt', 0
    error_msg db 'Error renaming file', 0
    success_msg db 'File renamed successfully', 0

section .bss
    temp resb 1

section .text
    global _start

_start:
    ; Call the rename function
    call rename_file

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

rename_file:
    ; Load the old file name into ebx
    mov ebx, old_name

    ; Load the new file name into ecx
    mov ecx, new_name

    ; Call the rename system call
    mov eax, 38         ; syscall number for sys_rename
    int 0x80            ; call kernel

    ; Check for errors
    cmp eax, 0
    je rename_success

rename_error:
    ; Print error message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, error_msg  ; message to write
    mov edx, 18         ; message length
    int 0x80            ; call kernel
    jmp end_program

rename_success:
    ; Print success message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, success_msg; message to write
    mov edx, 24         ; message length
    int 0x80            ; call kernel

end_program:
    ret

