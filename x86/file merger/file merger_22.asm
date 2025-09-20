; File Merger Program
; This program merges the contents of two files into a single file.
; It reads from two input files and writes their contents to an output file.
; The program is written in x86 Assembly language.
; It demonstrates file handling, buffer management, and system calls.
; Prepare yourself for a wild ride through the land of assembly!

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    bytesRead dd 0
    bytesWritten dd 0
    fileHandle1 dd 0
    fileHandle2 dd 0
    fileHandleOut dd 0

section .bss
    tempBuffer resb bufferSize

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5
    mov ebx, inputFile1
    mov ecx, 0
    int 0x80
    mov [fileHandle1], eax

    ; Open the second input file
    mov eax, 5
    mov ebx, inputFile2
    mov ecx, 0
    int 0x80
    mov [fileHandle2], eax

    ; Create the output file
    mov eax, 8
    mov ebx, outputFile
    mov ecx, 0x41
    mov edx, 0x1FF
    int 0x80
    mov [fileHandleOut], eax

    ; Read from the first input file and write to the output file
    call read_and_write_file
    ; Read from the second input file and write to the output file
    call read_and_write_file

    ; Close all files
    mov eax, 6
    mov ebx, [fileHandle1]
    int 0x80

    mov eax, 6
    mov ebx, [fileHandle2]
    int 0x80

    mov eax, 6
    mov ebx, [fileHandleOut]
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_and_write_file:
    ; Read from the input file
    mov eax, 3
    mov ebx, [fileHandle1]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4
    mov ebx, [fileHandleOut]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ret

