; This program is a simple file writer in x86 Assembly.
; It demonstrates the process of opening, writing to, and closing a file.
; The program is designed to be a learning tool for understanding file operations in Assembly.
; It is written in a verbose and colorful style to enhance readability and engagement.

section .data
    fileName db 'output.txt', 0  ; The name of the file to be created and written to
    fileContent db 'Hello, Middle-earth!', 0  ; The content to be written to the file
    fileDescriptor dd 0  ; File descriptor for the opened file
    errorMsg db 'Error opening file', 0  ; Error message in case file opening fails

section .bss
    buffer resb 128  ; Buffer for file operations

section .text
    global _start

_start:
    ; Open the file for writing (create if it doesn't exist)
    mov eax, 5  ; Syscall number for sys_open
    mov ebx, fileName  ; Pointer to the file name
    mov ecx, 2  ; Flags: O_WRONLY | O_CREAT
    mov edx, 0644  ; Mode: rw-r--r--
    int 0x80  ; Call the kernel

    ; Check if the file was opened successfully
    cmp eax, 0
    js file_open_error  ; Jump to error handling if file open failed

    ; Store the file descriptor
    mov [fileDescriptor], eax

    ; Write content to the file
    mov eax, 4  ; Syscall number for sys_write
    mov ebx, [fileDescriptor]  ; File descriptor
    mov ecx, fileContent  ; Pointer to the content
    mov edx, 19  ; Number of bytes to write
    int 0x80  ; Call the kernel

    ; Close the file
    mov eax, 6  ; Syscall number for sys_close
    mov ebx, [fileDescriptor]  ; File descriptor
    int 0x80  ; Call the kernel

    ; Exit the program
    mov eax, 1  ; Syscall number for sys_exit
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call the kernel

file_open_error:
    ; Handle file open error
    mov eax, 4  ; Syscall number for sys_write
    mov ebx, 1  ; File descriptor for stdout
    mov ecx, errorMsg  ; Pointer to the error message
    mov edx, 19  ; Number of bytes to write
    int 0x80  ; Call the kernel

    ; Exit the program with error code
    mov eax, 1  ; Syscall number for sys_exit
    mov ebx, 1  ; Exit code 1
    int 0x80  ; Call the kernel

