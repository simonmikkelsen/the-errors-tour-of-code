; Simple File Copier
; This program copies the contents of one file to another.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program opens the source file, reads its contents, and writes them to the destination file.
; It showcases the use of system calls for file operations and demonstrates error handling.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'destination.txt', 0
    buffer db 1024
    bytesRead dd 0
    bytesWritten dd 0
    errorMsg db 'Error occurred', 0

section .bss
    fileDescriptor resd 1
    fileDescriptor2 resd 1

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, sourceFile ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileDescriptor], eax

    ; Check for errors
    cmp eax, 0
    js error

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, destFile   ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [fileDescriptor2], eax

    ; Check for errors
    cmp eax, 0
    js error

copy_loop:
    ; Read from source file
    mov eax, 3          ; sys_read
    mov ebx, [fileDescriptor]
    mov ecx, buffer
    mov edx, 1024
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileDescriptor2]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop until end of file
    jmp copy_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileDescriptor]
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileDescriptor2]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg
    mov edx, 13         ; length of error message
    int 0x80            ; call kernel

    ; Exit the program with error status
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; status 1
    int 0x80            ; call kernel

