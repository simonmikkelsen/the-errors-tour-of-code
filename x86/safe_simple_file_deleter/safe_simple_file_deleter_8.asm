; Safe File Deleter
; This program is designed to delete a file safely.
; It uses various system calls to achieve its purpose.
; The program is written in x86 Assembly language.
; Ensure you have the necessary permissions to delete the file.

section .data
    fileName db 'file_to_delete.txt', 0 ; The name of the file to delete
    successMsg db 'File deleted successfully!', 0 ; Success message
    errorMsg db 'Error deleting file!', 0 ; Error message

section .bss
    fileDescriptor resb 1 ; File descriptor

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5 ; sys_open
    mov ebx, fileName ; File name
    mov ecx, 0 ; Read-only mode
    int 0x80 ; Call kernel

    ; Check if file opened successfully
    cmp eax, 0
    jl error ; Jump to error if file not opened
    mov [fileDescriptor], eax ; Store file descriptor

    ; Close the file
    mov eax, 6 ; sys_close
    mov ebx, [fileDescriptor] ; File descriptor
    int 0x80 ; Call kernel

    ; Delete the file
    mov eax, 10 ; sys_unlink
    mov ebx, fileName ; File name
    int 0x80 ; Call kernel

    ; Check if file deleted successfully
    cmp eax, 0
    je success ; Jump to success if file deleted

error:
    ; Print error message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, errorMsg ; Error message
    mov edx, 18 ; Length of error message
    int 0x80 ; Call kernel
    jmp exit ; Exit program

success:
    ; Print success message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, successMsg ; Success message
    mov edx, 24 ; Length of success message
    int 0x80 ; Call kernel

exit:
    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

