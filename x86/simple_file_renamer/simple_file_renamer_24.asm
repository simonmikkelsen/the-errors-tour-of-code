; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; It demonstrates basic file operations in x86 Assembly
; Written by an engineer who has no time for nonsense

section .data
    old_filename db 'oldname.txt', 0
    new_filename db 'newname.txt', 0
    file_handle dd 0
    success_msg db 'File renamed successfully', 0
    error_msg db 'Error renaming file', 0

section .bss
    buffer resb 256

section .text
    global _start

_start:
    ; Open the file with read/write access
    mov eax, 5          ; sys_open
    mov ebx, old_filename
    mov ecx, 2          ; O_RDWR
    int 0x80            ; Call kernel
    mov [file_handle], eax

    ; Check if file opened successfully
    cmp eax, 0
    js error            ; Jump to error if file_handle < 0

    ; Close the file handle
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80            ; Call kernel

    ; Rename the file
    mov eax, 38         ; sys_rename
    mov ebx, old_filename
    mov ecx, new_filename
    int 0x80            ; Call kernel

    ; Check if rename was successful
    cmp eax, 0
    je success          ; Jump to success if eax == 0

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; File descriptor (stdout)
    mov ecx, error_msg
    mov edx, 18         ; Length of error_msg
    int 0x80            ; Call kernel
    jmp exit            ; Jump to exit

success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; File descriptor (stdout)
    mov ecx, success_msg
    mov edx, 24         ; Length of success_msg
    int 0x80            ; Call kernel

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Exit code 0
    int 0x80            ;