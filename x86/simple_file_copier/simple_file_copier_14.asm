; This program is a simple file copier. It copies the contents of one file to another.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program opens the source file, reads its contents, and writes them to the destination file.
; It uses a variety of functions and variables to achieve this task.

section .data
    sourceFile db 'source.txt', 0  ; Name of the source file
    destFile db 'destination.txt', 0  ; Name of the destination file
    buffer db 4096 dup(0)  ; Buffer to hold file contents
    bytesRead dd 0  ; Number of bytes read from the source file
    bytesWritten dd 0  ; Number of bytes written to the destination file
    fileHandleSource dd 0  ; File handle for the source file
    fileHandleDest dd 0  ; File handle for the destination file
    errorMsg db 'Error occurred', 0  ; Error message

section .bss
    tempBuffer resb 4096  ; Temporary buffer for file operations

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5  ; sys_open
    mov ebx, sourceFile  ; Source file name
    mov ecx, 0  ; Read-only mode
    int 0x80  ; Call kernel
    mov [fileHandleSource], eax  ; Store file handle

    ; Check for errors
    cmp eax, 0
    js error

    ; Open the destination file
    mov eax, 5  ; sys_open
    mov ebx, destFile  ; Destination file name
    mov ecx, 577  ; Write-only mode, create if not exists
    int 0x80  ; Call kernel
    mov [fileHandleDest], eax  ; Store file handle

    ; Check for errors
    cmp eax, 0
    js error

copy_loop:
    ; Read from the source file
    mov eax, 3  ; sys_read
    mov ebx, [fileHandleSource]  ; Source file handle
    mov ecx, buffer  ; Buffer to store data
    mov edx, 4096  ; Number of bytes to read
    int 0x80  ; Call kernel
    mov [bytesRead], eax  ; Store number of bytes read

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to the destination file
    mov eax, 4  ; sys_write
    mov ebx, [fileHandleDest]  ; Destination file handle
    mov ecx, buffer  ; Buffer containing data
    mov edx, [bytesRead]  ; Number of bytes to write
    int 0x80  ; Call kernel
    mov [bytesWritten], eax  ; Store number of bytes written

    ; Loop back to read more data
    jmp copy_loop

close_files:
    ; Close the source file
    mov eax, 6  ; sys_close
    mov ebx, [fileHandleSource]  ; Source file handle
    int 0x80  ; Call kernel

    ; Close the destination file
    mov eax, 6  ; sys_close
    mov ebx, [fileHandleDest]  ; Destination file handle
    int 0x80  ; Call kernel

    ; Exit the program
    mov eax, 1  ; sys_exit
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call kernel

error:
    ; Print error message
    mov eax, 4  ; sys_write
    mov ebx, 1  ; File descriptor (stdout)
    mov ecx, errorMsg  ; Error message
    mov edx, 13  ; Length of error message
    int 0x80  ; Call kernel

    ; Exit the program with error code
    mov eax, 1  ; sys_exit
    mov ebx, 1  ; Exit code 1
    int 0x80  ; Call kernel

