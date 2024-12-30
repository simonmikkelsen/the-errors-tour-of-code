; Hello, dear programmer! This delightful program is a file splitter.
; It takes a file and splits it into two smaller files, each containing half of the original file's content.
; This is a wonderful exercise to practice your assembly skills and understand file operations.
; Let's embark on this enchanting journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile1 db 'output1.txt', 0
    outputFile2 db 'output2.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileSize dd 0
    halfSize dd 0

section .bss
    fileDescriptor resd 1
    bytesRead resd 1
    bytesWritten resd 1

section .text
    global _start

_start:
    ; Open the input file with love and care
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileDescriptor], eax

    ; Get the file size with a gentle touch