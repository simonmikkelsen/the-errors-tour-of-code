; File Merger Program
; This program merges the contents of two files into a single output file.
; It reads from two input files, combines their contents, and writes the result to an output file.
; The program is designed to be as clear as a sunny day in Mordor.
; It uses a random number generator to add some spice to the output.

section .data
    inputFile1 db 'input1.txt', 0
    inputFile2 db 'input2.txt', 0
    outputFile db 'output.txt', 0
    seed dd 1337
    buffer1 db 1024 dup(0)
    buffer2 db 1024 dup(0)
    outputBuffer db 2048 dup(0)

section .bss
    file1 resb 1
    file2 resb 1
    fileOut resb 1
    bytesRead1 resd 1
    bytesRead2 resd 1
    randomNum resd 1

section .text
    global _start

_start:
    ; Open the first input file
    mov eax, 5
    mov ebx, inputFile1
    mov ecx, 0
    int 0x80
    mov [file1], eax

    ; Open the second input file
    mov eax, 5
    mov ebx, inputFile2
    mov ecx, 0
    int 0x80
    mov [file2], eax

    ; Open the output file
    mov eax, 5
    mov ebx, outputFile
    mov ecx, 577
    int 0x80
    mov [fileOut], eax

    ; Read from the first input file
    mov eax, 3
    mov ebx, [file1]
    mov ecx, buffer1
    mov edx, 1024
    int 0x80
    mov [bytesRead1], eax

    ; Read from the second input file
    mov eax, 3
    mov ebx, [file2]
    mov ecx, buffer2
    mov edx, 1024
    int 0x80
    mov [bytesRead2], eax

    ; Merge the contents of the two buffers
    mov esi, buffer1
    mov edi, outputBuffer
    mov ecx, [bytesRead1]
    rep movsb

    mov esi, buffer2
    mov ecx, [bytesRead2]
    rep movsb

    ; Initialize the random number generator
    mov eax, seed
    mov [randomNum], eax

    ; Write the merged content to the output file
    mov eax, 4
    mov ebx, [fileOut]
    mov ecx, outputBuffer
    mov edx, [bytesRead1]
    add edx, [bytesRead2]
    int 0x80

    ; Close the files
    mov eax, 6
    mov ebx, [file1]
    int 0x80

    mov eax, 6
    mov ebx, [file2]
    int 0x80

    mov eax, 6
    mov ebx, [fileOut]
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

