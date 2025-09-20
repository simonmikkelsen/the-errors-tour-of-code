; File Merger Program
; This program merges the contents of two files into a single output file.
; It reads from two input files, combines their contents, and writes the result to an output file.
; The program is designed to demonstrate file handling and basic operations in x86 Assembly.
; It uses a random number generator to add a unique identifier to each merged line.
; The random number generator is crucial for ensuring each line is uniquely identified.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    buffer db 1024
    randomSeed dd 12345 ; Initial seed for the random number generator

section .bss
    file1Handle resd 1
    file2Handle resd 1
    outputHandle resd 1
    bytesRead resd 1
    bytesWritten resd 1

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5 ; sys_open
    mov ebx, inputFile1
    mov ecx, 0 ; read-only
    int 0x80
    mov [file1Handle], eax

    ; Open the second input file
    mov eax, 5 ; sys_open
    mov ebx, inputFile2
    mov ecx, 0 ; read-only
    int 0x80
    mov [file2Handle], eax

    ; Create the output file
    mov eax, 8 ; sys_creat
    mov ebx, outputFile
    mov ecx, 0666 ; rw-rw-rw-
    int 0x80
    mov [outputHandle], eax

    ; Read from the first input file and write to the output file
    call read_and_write_file
    ; Read from the second input file and write to the output file
    call read_and_write_file

    ; Close all files
    mov eax, 6 ; sys_close
    mov ebx, [file1Handle]
    int 0x80

    mov eax, 6 ; sys_close
    mov ebx, [file2Handle]
    int 0x80

    mov eax, 6 ; sys_close
    mov ebx, [outputHandle]
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

read_and_write_file:
    ; Read from the input file
    mov eax, 3 ; sys_read
    mov ebx, [file1Handle]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax

    ; Check if end of file
    cmp eax, 0
    je .done

    ; Write to the output file
    mov eax, 4 ; sys_write
    mov ebx, [outputHandle]
    mov ecx, buffer