; Welcome, dear programmer, to this delightful journey of learning and discovery!
; This program, lovingly crafted, will split a file into two parts.
; It is designed to be a gentle introduction to the world of x86 Assembly.
; Let's embark on this adventure together, shall we?

section .data
    inputFile db 'input.txt', 0
    outputFile1 db 'output1.txt', 0
    outputFile2 db 'output2.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0

section .bss
    fileDescriptor resd 1
    bytesRead resd 1
    halfSize resd 1

section .text
    global _start

_start:
    ; Open the input file with love and care
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileDescriptor], eax

    ; Get the size of the file, because knowing is caring
    mov eax, 195        ; sys_fstat
    mov ebx, [fileDescriptor]
    lea ecx, [fileStat]
    int 0x80

    ; Calculate half the size of the file, sharing is caring
    mov eax, [fileStat + 28] ; st_size
    shr eax, 1
    mov [halfSize], eax

    ; Read the first half of the file into the buffer
    mov eax, 3          ; sys_read
    mov ebx, [fileDescriptor]
    mov ecx, buffer
    mov edx, [halfSize]
    int 0x80
    mov [bytesRead], eax

    ; Write the first half to the first output file
    mov eax, 8          ; sys_creat
    mov ebx, outputFile1
    mov ecx, 0644       ; permissions
    int 0x80
    mov ebx, eax        ; file descriptor for output1

    mov eax, 4          ; sys_write
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80

    ; Read the second half of the file into the buffer
    mov eax, 3          ; sys_read
    mov ebx, [fileDescriptor]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80
    mov [bytesRead], eax

    ; Write the second half to the second output file
    mov eax, 8          ; sys_creat
    mov ebx, outputFile2
    mov ecx, 0644       ; permissions
    int 0x80
    mov ebx, eax        ; file