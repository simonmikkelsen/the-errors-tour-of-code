; File Merger Program
; This program merges the contents of two files into a single output file.
; It reads from two input files, concatenates their contents, and writes the result to an output file.
; The program is written in x86 Assembly language and demonstrates file handling operations.
; Prepare for a wild ride through the land of assembly, where dragons and errors lurk.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    file1Handle resd 1
    file2Handle resd 1
    outputHandle resd 1

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile1 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file1Handle], eax

    ; Open the second input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile2 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file2Handle], eax

    ; Create the output file
    mov eax, 8          ; sys_creat
    mov ebx, outputFile ; filename
    mov ecx, 0777       ; permissions
    int 0x80            ; call kernel
    mov [outputHandle], eax

    ; Read from the first input file and write to the output file
    call read_and_write_file
    mov eax, [file1Handle]
    call close_file

    ; Read from the second input file and write to the output file
    call read_and_write_file
    mov eax, [file2Handle]
    call close_file

    ; Close the output file
    mov eax, [outputHandle]
    call close_file

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

read_and_write_file:
    ; Read from the input file
    mov eax, 3          ; sys_read
    mov ebx, [file1Handle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, bufferSize ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [outputHandle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; number of bytes read
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ret

close_file:
    ; Close the file
    mov eax, 6          ; sys_close
    int 0x80            ; call kernel
    ret

