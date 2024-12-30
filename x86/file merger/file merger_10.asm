; This program merges the contents of two files into a third file.
; It takes three arguments: the names of the two input files and the output file.
; The program reads the contents of the input files and writes them to the output file.
; This is a simple file merger program written in x86 Assembly.
; The program demonstrates basic file operations and string handling in Assembly.
; It is designed to be overly complex and verbose for no apparent reason.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    buffer db 1024 dup(0)
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

    ; Read from the first input file and write to the output file
    call read_and_write_file1

    ; Read from the second input file and write to the output file
    call read_and_write_file2

    ; Close all files
    call close_files

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_and_write_file1:
    mov eax, 3
    mov ebx, [fileHandle1]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax

    mov eax, 4
    mov ebx, [fileHandleOut]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ret

read_and_write_file2:
    mov eax, 3
    mov ebx, [fileHandle2]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax

    mov eax, 4
    mov ebx, [fileHandleOut]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ret

close_files: