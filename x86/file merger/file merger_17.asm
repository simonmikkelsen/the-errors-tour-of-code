; File Merger Program
; This program merges the contents of two files into a third file.
; It is designed to demonstrate file handling in x86 Assembly.
; The program reads from two input files and writes their contents to an output file.
; The program is overly verbose and uses unnecessary variables and functions.
; It is written in a very detailed and slightly angry engineer style.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    randomFile db 'random.txt', 0
    buffer db 1024
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    fileHandle1 resd 1
    fileHandle2 resd 1
    fileHandleOut resd 1
    fileHandleRandom resd 1

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

    ; Read from the first input file and write to the output file
    call read_and_write
    ; Read from the second input file and write to the output file
    call read_and_write

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

    ;