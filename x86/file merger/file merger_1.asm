; File Merger Program
; This program merges the contents of two files into a third file.
; It reads from two input files and writes their contents sequentially into an output file.
; The program demonstrates file handling, buffer management, and string operations in x86 Assembly.
; Written in a verbose and overly complex manner to showcase various assembly instructions.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    bufferSize equ 1024
    buffer db bufferSize dup(0)
    msgOpenError db 'Error opening file', 0
    msgReadError db 'Error reading file', 0
    msgWriteError db 'Error writing file', 0

section .bss
    fileHandle1 resd 1
    fileHandle2 resd 1
    fileHandleOut resd 1
    bytesRead resd 1
    bytesWritten resd 1

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile1 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    test eax, eax
    js open_error
    mov [fileHandle1], eax

    ; Open the second input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile2 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    test eax, eax
    js open_error
    mov [fileHandle2], eax

    ; Create the output file
    mov eax, 8          ; sys_creat
    mov ebx, outputFile ; filename
    mov ecx, 0644       ; permissions
    int 0x80            ; call kernel
    test eax, eax
    js open_error
    mov [fileHandleOut], eax

    ; Read from the first input file and write to the output file
    call read_and_write_file
    mov eax, [fileHandle1]
    call close_file

    ; Read from the second input file and write to the output file
    call read_and_write_file
    mov eax, [fileHandle2]
    call close_file

    ; Close the output file
    mov eax, [fileHandleOut]
    call close_file

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

read_and_write_file:
    ; Read from the input file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle1] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, bufferSize ; buffer size
    int 0x80            ; call kernel
    test eax, eax
    js read_error
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleOut] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; number of bytes read
    int 0x80            ; call kernel
    test eax, eax
    js write_error
    mov [bytesWritten], eax

    ret

close_file:
    ; Close the file
    mov eax, 6          ; sys_close
    int 0x80            ; call kernel
    ret

open_error:
    ; Handle file open error
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msgOpenError ; error message
    mov edx, 17         ; message length
    int 0x80            ; call kernel
    jmp exit

read_error:
    ; Handle file read error