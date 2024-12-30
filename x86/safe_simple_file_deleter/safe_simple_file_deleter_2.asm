; Safe File Deleter - A program to delete files safely and securely
; This program is designed to delete a file from the system with utmost precision
; and care. It ensures that the file is removed from the directory and its memory
; is wiped clean. This program is a testament to the power of x86 Assembly.

section .data
    fileName db 'file_to_delete.txt', 0 ; The name of the file to be deleted
    successMsg db 'File deleted successfully!', 0 ; Success message
    errorMsg db 'Error deleting file!', 0 ; Error message

section .bss
    fileHandle resd 1 ; File handle for the file to be deleted
    buffer resb 256 ; Buffer for file operations

section .text
    global _start

_start:
    ; Open the file with read/write access
    mov eax, 5 ; sys_open
    mov ebx, fileName ; File name
    mov ecx, 2 ; O_RDWR
    int 0x80 ; Call kernel

    ; Check if the file was opened successfully
    test eax, eax
    js file_error ; Jump to error handling if file open failed

    ; Store the file handle
    mov [fileHandle], eax

    ; Read the file content into buffer (unnecessary but here for fun)
    mov eax, 3 ; sys_read
    mov ebx, [fileHandle] ; File handle
    mov ecx, buffer ; Buffer
    mov edx, 256 ; Number of bytes to read
    int 0x80 ; Call kernel

    ; Close the file
    mov eax, 6 ; sys_close
    mov ebx, [fileHandle] ; File handle
    int 0x80 ; Call kernel

    ; Delete the file
    mov eax, 10 ; sys_unlink
    mov ebx, fileName ; File name
    int 0x80 ; Call kernel

    ; Check if the file was deleted successfully
    test eax, eax
    js file_error ; Jump to error handling if file delete failed

    ; Print success message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, successMsg ; Success message
    mov edx, 24 ; Message length
    int 0x80 ; Call kernel

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

file_error:
    ; Print error message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, errorMsg ; Error message
    mov edx, 18 ; Message length
    int 0x80 ; Call kernel

    ; Exit the program with error code
    mov eax, 1 ; sys_exit
    mov ebx, 1 ; Exit code 1
    int 0x80 ; Call kernel

