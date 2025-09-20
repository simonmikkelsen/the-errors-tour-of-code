; File Merger Program
; This program merges the contents of two files into a third file.
; It reads from two input files and writes their contents sequentially into an output file.
; The program is designed to demonstrate file handling in x86 Assembly.
; Prepare yourself for a wild ride through the land of Assembly!

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0

section .bss
    file1Descriptor resd 1
    file2Descriptor resd 1
    outputDescriptor resd 1
    bytesRead resd 1

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile1 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file1Descriptor], eax

    ; Open the second input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile2 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file2Descriptor], eax

    ; Open the output file
    mov eax, 5          ; sys_open
    mov ebx, outputFile ; filename
    mov ecx, 577        ; read-write-create
    mov edx, 438        ; permissions
    int 0x80            ; call kernel
    mov [outputDescriptor], eax

    ; Read from the first input file and write to the output file
    call readAndWriteFile
    ; Read from the second input file and write to the output file
    call readAndWriteFile

    ; Close the files
    mov eax, 6          ; sys_close
    mov ebx, [file1Descriptor]
    int 0x80            ; call kernel

    mov eax, 6          ; sys_close
    mov ebx, [file2Descriptor]
    int 0x80            ; call kernel

    mov eax, 6          ; sys_close
    mov ebx, [outputDescriptor]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ;