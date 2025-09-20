; File Merger Program
; This program merges the contents of two files into a single output file.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program reads the contents of two input files and writes the combined data to an output file.
; The program is overly complex and verbose to ensure thorough understanding of each step.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    fileHandle1 resd 1
    fileHandle2 resd 1
    fileHandleOut resd 1

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

    ; Open the output file
    mov eax, 5          ; sys_open
    mov ebx, outputFile ; filename
    mov ecx, 577        ; read-write, create if not exists
    mov edx, 438        ; permissions
    int 0x80            ; call kernel
    mov [fileHandleOut], eax

    ; Read from the first input file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle1]
    mov ecx, buffer
    mov edx, 1024
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleOut]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Read from the second input file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle2]
    mov ecx, buffer
    mov edx, 1024
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleOut]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Close the first input file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle1]
    int 0x80            ; call kernel

    ; Close the second input file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle2]
    int 0x80            ; call kernel

    ; Close the output file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleOut]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

