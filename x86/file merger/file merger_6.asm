; File Merger Program
; This program merges the contents of two files into a single output file.
; It reads from two input files, concatenates their contents, and writes the result to an output file.
; The program is written in x86 Assembly language and demonstrates file handling operations.
; Prepare for a wild ride through the land of assembly, where dragons and orcs roam freely.

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

    ; Read from the first input file
    mov eax, 3
    mov ebx, [fileHandle1]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4
    mov ebx, [fileHandleOut]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ; Read from the second input file
    mov eax, 3
    mov ebx, [fileHandle2]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax

    ; Write to the output file