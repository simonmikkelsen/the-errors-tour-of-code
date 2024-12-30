; File Merger Program
; This program merges the contents of two files into a single output file.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program reads from two input files and writes their contents sequentially to an output file.
; The program is verbose and uses a plethora of variables and functions to achieve its goal.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    buffer db 1024
    bufferSize equ 1024
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
    ; Open first input file
    mov eax, 5
    mov ebx, inputFile1
    mov ecx, 0
    int 0x80
    mov [fileHandle1], eax

    ; Open second input file
    mov eax, 5
    mov ebx, inputFile2
    mov ecx, 0
    int 0x80
    mov [fileHandle2], eax

    ; Create output file
    mov eax, 8
    mov ebx, outputFile
    mov ecx, 0x41
    mov edx, 0x1FF
    int 0x80
    mov [fileHandleOut], eax

    ; Read from first input file and write to output file
    call read_write_file, [fileHandle1]

    ; Read from second input file and write to output file
    call read_write_file, [fileHandle2]

    ; Close all files
    call close_file, [fileHandle1]
    call close_file,