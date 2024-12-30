; File Merger Program
; This program merges the contents of two files into a third file.
; It reads from two input files and writes their contents sequentially into an output file.
; The program demonstrates basic file I/O operations in x86 Assembly.
; Written by an overly precise and slightly angry engineer.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    buffer db 1024
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

    ; Create the output file
    mov eax, 8          ; sys_creat
    mov ebx, outputFile ; filename
    mov ecx, 0777o      ; permissions
    int 0x80            ; call kernel
    mov [fileHandleOut], eax

    ; Read from the first input file and write to the output file
    call read_and_write_file
    ; Read from the second input file and write to the output file
    call read_and_write_file

    ; Close all files
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle1]
    int 0x80            ; call kernel

    mov eax, 6          ; sys_close
    mov ebx, [fileHandle2]
    int 0x80            ; call kernel

    mov eax, 6          ; sys_close
    mov ebx, [fileHandleOut]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

read_and_write_file:
    ; Read from the input file
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
    mov [bytesWritten], eax

    ; Return from the function
    ret

