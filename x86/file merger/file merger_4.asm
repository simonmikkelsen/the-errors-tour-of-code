; File Merger Program
; This program merges the contents of two files into a single output file.
; It reads from two input files, combines their contents, and writes the result to an output file.
; The program is written in x86 Assembly language and demonstrates file handling operations.
; Prepare yourself for a journey through the labyrinth of code.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    buffer db 1024
    bytesRead dd 0
    bytesWritten dd 0
    fileHandle1 dd 0
    fileHandle2 dd 0
    fileHandleOut dd 0

section .bss
    tempBuffer resb 1024

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile1 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle1], eax

    ; Open the second input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile2 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle2], eax

    ; Create the output file
    mov eax, 8          ; sys_creat
    mov ebx, outputFile ; filename
    mov ecx, 0666       ; permissions
    int 0x80            ; call kernel
    mov [fileHandleOut], eax

    ; Read from the first input file
read_file1:
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle1] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleOut] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; number of bytes read
    int 0x80            ; call kernel

    ; Read from the second input file
read_file2:
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle2] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleOut] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; number of bytes read
    int 0x80            ; call kernel

    ; Close the files
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle1] ; file descriptor
    int 0x80            ; call kernel

    mov eax, 6          ; sys_close
    mov ebx, [fileHandle2] ; file descriptor
    int 0x80            ; call kernel

    mov eax, 6          ; sys_close
    mov ebx, [fileHandleOut] ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

