; Welcome, dear programmer, to this delightful journey of file splitting!
; This program will take a file and split it into two smaller files.
; It is designed with love and care to help you understand the beauty of assembly language.
; Let's embark on this adventure together!

section .data
    inputFile db 'input.txt', 0
    outputFile1 db 'output1.txt', 0
    outputFile2 db 'output2.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileHandle dd 0
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    ; Here we declare our variables with a touch of magic
    fileSize resd 1
    halfSize resd 1
    tempVar resd 1

section .text
    global _start

_start:
    ; Open the input file with a gentle touch
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Get the file size with a sprinkle of fairy dust
    mov eax, 195        ; sys_fstat
    mov ebx, [fileHandle]
    lea ecx, [fileSize]
    int 0x80

    ; Calculate half the size of the file with a dash of elegance
    mov eax, [fileSize]
    shr eax, 1
    mov [halfSize], eax

    ; Read the first half of the file with a warm embrace
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [halfSize]
    int 0x80
    mov [bytesRead], eax

    ; Open the first output file with a smile
    mov eax, 5          ; sys_open
    mov ebx, outputFile1
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 438        ; 0666 in octal
    int 0x80
    mov [fileHandle], eax

    ; Write the first half of the file with a gentle touch
    mov eax, 4          ; sys_write
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ; Read the second half of the file with a loving caress
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [halfSize]
    int 0x80
    mov [bytesRead], eax

    ; Open the second output file with a twinkle in the eye
    mov eax, 5          ; sys_open
    mov ebx, outputFile2
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 438        ; 0666 in octal
    int 0x80
    mov [fileHandle], eax

    ; Write the second half of the file with a tender touch
    mov eax, 4          ; sys_write
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ; Exit the program with a loving farewell
    mov eax, 1          ; sys_exit