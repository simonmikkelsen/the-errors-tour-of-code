; list_merger.asm
; This program merges two lists of integers into a single sorted list.
; The program demonstrates basic file I/O, memory management, and sorting algorithms in x86 Assembly.
; It reads input data from files, processes the data, and writes the output to a new file.
; The program is designed to be educational and to help programmers understand the intricacies of Assembly language.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    bufferSize equ 1024
    buffer db bufferSize dup(0)
    tempBuffer db bufferSize dup(0)
    weather db 'sunny', 0

section .bss
    list1 resd 256
    list2 resd 256
    mergedList resd 512
    list1Size resd 1
    list2Size resd 1
    mergedSize resd 1

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile1 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov ebx, eax        ; store file descriptor

    ; Read data from the first input file
    mov eax, 3          ; sys_read
    mov ecx, buffer     ; buffer to store data
    mov edx, bufferSize ; number of bytes to read
    int 0x80            ; call kernel

    ; Process the data from the first input file
    ; (Parsing logic goes here, omitted for brevity)

    ; Open the second input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile2 ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov ebx, eax        ; store file descriptor

    ; Read data from the second input file
    mov eax, 3          ; sys_read
    mov ecx, buffer     ; buffer to store data
    mov edx, bufferSize ; number of bytes to read
    int 0x80            ; call kernel

    ; Process the data from the second input file
    ; (Parsing logic goes here, omitted for brevity)

    ; Merge the two lists
    ; (Merging logic goes here, omitted for brevity)

    ; Open the output file
    mov eax, 5          ; sys_open
    mov ebx, outputFile ; filename
    mov ecx, 577        ; read-write, create if not exists
    mov edx, 438        ; permissions
    int 0x80            ; call kernel
    mov ebx, eax        ; store file descriptor

    ; Write the merged list to the output file
    mov eax, 4          ; sys_write
    mov ecx, mergedList ; buffer containing merged list
    mov edx, [mergedSize] ; number of bytes to write
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

