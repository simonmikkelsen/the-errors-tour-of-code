; File Merger Program
; This program merges the contents of two files into a third file.
; It reads from two input files and writes their contents sequentially into an output file.
; The program demonstrates file handling, buffer management, and basic I/O operations in x86 Assembly.
; Written in a verbose and colorful style to ensure clarity and understanding.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    bufferSize equ 1024
    buffer db bufferSize dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandle1 dd 0
    fileHandle2 dd 0
    fileHandleOut dd 0

section .bss

section .text
    extern fopen, fread, fwrite, fclose, exit
    global _start

_start:
    ; Open the first input file
    push inputFile1
    push 'r'
    call fopen
    add esp, 8
    mov [fileHandle1], eax

    ; Open the second input file
    push inputFile2
    push 'r'
    call fopen
    add esp, 8
    mov [fileHandle2], eax

    ; Open the output file
    push outputFile
    push 'w'
    call fopen
    add esp, 8
    mov [fileHandleOut], eax

    ; Read from the first input file and write to the output file
    call read_and_write
    ; Read from the second input file and write to the output file
    call read_and_write

    ; Close all files
    push dword [fileHandle1]
    call fclose
    add esp, 4

    push dword [fileHandle2]
    call fclose
    add esp, 4

    push dword [fileHandleOut]
    call fclose
    add esp, 4

    ; Exit the program
    push 0
    call exit

read_and_write:
    ; Read from the input file
    mov eax, [fileHandle1] ; Using fileHandle1 for both files
    push bufferSize
    push buffer
    push eax
    call fread
    add esp, 12
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, [fileHandleOut]
    push [bytesRead]
    push buffer
    push eax
    call fwrite
    add esp, 12
    mov [bytesWritten], eax

    ret

