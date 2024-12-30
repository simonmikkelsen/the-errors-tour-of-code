; Safe File Deleter
; This program is designed to delete a file safely.
; It takes a filename as input and attempts to delete it.
; If the file does not exist, it will notify the user.
; If the file is successfully deleted, it will confirm the deletion.
; This program is written in x86 Assembly language.
; Prepare for a wild ride through the land of Mordor.

section .data
    filename db 'file_to_delete.txt', 0
    success_msg db 'File deleted successfully!', 0
    error_msg db 'Error: File not found!', 0
    buffer db 256 dup(0)

section .bss
    file_handle resb 1
    temp_var resb 1

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, filename   ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [file_handle], eax

    ; Check if file exists
    cmp eax, -1
    je file_not_found

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, filename
    int 0x80

    ; Check if deletion was successful
    cmp eax, 0
    je deletion_success

file_not_found:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, error_msg  ; message to write
    mov edx, 18         ; message length
    int 0x80
    jmp exit

deletion_success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, success_msg; message to write
    mov edx, 24         ; message length
    int 0x80

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80

