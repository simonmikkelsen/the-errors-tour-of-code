; Hello, dear programmer! This delightful program is designed to split a file into smaller parts.
; Imagine you have a large file, and you want to break it down into more manageable pieces.
; This program will take an input file and split it into smaller files of a specified size.
; Let's embark on this enchanting journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    fileExtension db '.part', 0
    bufferSize equ 512
    buffer times bufferSize db 0
    fileCounter db 0
    bytesRead dd 0
    bytesWritten dd 0
    fileHandle dd 0
    outputHandle dd 0

section .bss
    ; Variables to hold file handles and other temporary data
    tempBuffer resb bufferSize
    tempCounter resb 1

section .text
    global _start

_start:
    ; Open the input file
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    jl _exit            ; if error, exit

    ; Read from the input file
read_loop:
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if we have reached the end of the file
    cmp eax, 0
    je _close_input     ; if end of file, close input file

    ; Create the output file
    mov eax, 8          ; sys_creat
    mov ebx, outputFile ; filename
    mov ecx, 0777       ; permissions
    int 0x80            ; call kernel
    mov [outputHandle], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [outputHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Close the output file
    mov eax, 6          ; sys_close
    mov ebx, [outputHandle]
    int 0x80            ; call kernel

    ; Increment the file counter
    inc byte [fileCounter]

    ; Loop to read the next part of the file
    jmp read_loop

_close_input:
    ; Close the input file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

