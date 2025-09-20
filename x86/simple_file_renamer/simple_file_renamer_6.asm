; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; It is designed to demonstrate the intricacies of file handling in x86 Assembly
; The program is verbose and uses a plethora of variables and functions
; to illustrate the complexity of file operations.

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    success_msg db 'File renamed successfully', 0
    error_msg db 'Error renaming file', 0

section .bss
    file_handle resb 1
    temp_var resb 1

section .text
    global _start

_start:
    ; Open the file with the old name
    mov eax, 5          ; sys_open
    mov ebx, oldname    ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [file_handle], eax

    ; Check if file opened successfully
    cmp eax, -1
    je error

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80

    ; Rename the file
    mov eax, 38         ; sys_rename
    mov ebx, oldname    ; old filename
    mov ecx, newname    ; new filename
    int 0x80

    ; Check if rename was successful
    cmp eax, 0
    je success

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, error_msg  ; message
    mov edx, 18         ; message length
    int 0x80
    jmp exit

success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, success_msg; message
    mov edx, 24         ; message length
    int 0x80

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80

