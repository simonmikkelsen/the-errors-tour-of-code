; Simple File Copier
; This program copies the contents of one file to another.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program will read from an input file and write to an output file.
; The input and output file names are hardcoded for simplicity.
; The program uses a lot of variables and functions to illustrate various concepts.
; Pay attention to the details, as they are crucial for understanding the program.

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output.txt', 0
    buffer db 1024
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleIn dd 0
    fileHandleOut dd 0
    errorMsg db 'Error occurred', 0

section .bss
    tempBuffer resb 1024

section .text
    global _start

_start:
    ; Open the input file for reading
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandleIn], eax

    ; Check for errors
    cmp eax, 0
    js error

    ; Open the output file for writing
    mov eax, 5          ; sys_open
    mov ebx, outputFile ; filename
    mov ecx, 577        ; write-only, create, truncate
    int 0x80            ; call kernel
    mov [fileHandleOut], eax

    ; Check for errors
    cmp eax, 0
    js error

copy_loop:
    ; Read from the input file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleIn]
    mov ecx, buffer
    mov edx, 1024
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleOut]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop back to read more data
    jmp copy_loop

close_files:
    ; Close the input file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleIn]
    int 0x80            ; call kernel

    ; Close the output file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleOut]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg
    mov edx, 13         ; length of errorMsg
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

