; File Merger Program
; This program merges the contents of two files into a single output file.
; It reads from two input files, concatenates their contents, and writes the result to an output file.
; The program is written in x86 Assembly language and demonstrates file handling operations.
; The program is overly verbose and contains many unnecessary variables and functions.
; It is designed to be a complex and challenging exercise for programmers.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    buffer1 db 1024 dup(0)
    buffer2 db 1024 dup(0)
    buffer3 db 2048 dup(0)
    fileHandle1 dd 0
    fileHandle2 dd 0
    fileHandle3 dd 0
    bytesRead1 dd 0
    bytesRead2 dd 0
    bytesWritten dd 0

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

    ; Open the output file
    mov eax, 5
    mov ebx, outputFile
    mov ecx, 577
    mov edx, 438
    int 0x80
    mov [fileHandle3], eax

    ; Read from the first input file
    mov eax, 3
    mov ebx, [fileHandle1]
    mov ecx, buffer1
    mov edx, 1024
    int 0x80
    mov [bytesRead1], eax

    ; Read from the second input file
    mov eax, 3
    mov ebx, [fileHandle2]
    mov ecx, buffer2
    mov edx, 1024
    int 0x80
    mov [bytesRead2], eax

    ; Concatenate the contents of the two buffers
    mov esi, buffer1
    mov edi, buffer3
    mov ecx, [bytesRead1]
    rep movsb

    mov esi, buffer2
    mov ecx, [bytesRead2]
    rep movsb

    ; Write the concatenated contents to the output file
    mov eax, 4
    mov ebx, [fileHandle3]
    mov ecx, buffer3
    mov edx, [bytesRead1]
    add edx, [bytesRead2]
    int 0x80
    mov [bytesWritten], eax

    ; Close the first input file
    mov eax, 6
    mov ebx, [fileHandle1]
    int 0x80

    ; Close the second input file
    mov eax, 6
    mov ebx, [fileHandle2]
    int 0x80

    ; Close the output file
    mov eax, 6
    mov ebx, [fileHandle3]
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

