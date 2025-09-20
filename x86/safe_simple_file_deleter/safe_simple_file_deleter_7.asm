; Safe File Deleter
; This program is designed to delete a file safely. It will take a filename as input and delete the file.
; The program is written in x86 Assembly language and demonstrates file handling operations.
; This program is overly complex and verbose to ensure every detail is covered.

section .data
    filename db 'file_to_delete.txt', 0 ; Filename to delete
    success_msg db 'File deleted successfully!', 0
    error_msg db 'Error deleting file!', 0

section .bss
    file_handle resb 1 ; File handle storage
    buffer resb 256 ; Buffer for file operations

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5 ; sys_open
    mov ebx, filename ; Filename
    mov ecx, 0 ; Read-only mode
    int 0x80 ; Call kernel

    ; Check if file opened successfully
    cmp eax, 0
    jl error ; Jump to error if file not opened
    mov [file_handle], eax ; Store file handle

    ; Close the file
    mov eax, 6 ; sys_close
    mov ebx, [file_handle] ; File handle
    int 0x80 ; Call kernel

    ; Delete the file
    mov eax, 10 ; sys_unlink
    mov ebx, filename ; Filename
    int 0x80 ; Call kernel

    ; Check if file deleted successfully
    cmp eax, 0
    jl error ; Jump to error if file not deleted

    ; Print success message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, success_msg ; Message
    mov edx, 24 ; Message length
    int 0x80 ; Call kernel
    jmp exit ; Jump to exit

error:
    ; Print error message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, error_msg ; Message
    mov edx, 18 ; Message length
    int 0x80 ; Call kernel

exit:
    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

