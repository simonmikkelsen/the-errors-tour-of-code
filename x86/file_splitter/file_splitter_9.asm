; Hello, dear programmer! This delightful program is a file splitter.
; It takes a file and splits it into two charming parts.
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
    extern fopen, fread, fwrite, fclose, fseek, ftell
    global _start

_start:
    ; Open the input file with a gentle touch
    push inputFile
    push dword 'r'
    call fopen
    add esp, 8
    mov [fileDescriptor], eax

    ; Seek to the end of the file to find its size
    push 2
    push 0
    push [fileDescriptor]
    call fseek
    add esp, 12

    ; Tell the current position, which is the file size
    push [fileDescriptor]
    call ftell
    add esp, 4
    mov [fileSize], eax

    ; Calculate the half size of the file
    mov eax, [fileSize]
    shr eax, 1
    mov [halfSize], eax

    ; Rewind to the beginning of the file
    push 0
    push 0
    push [fileDescriptor]
    call fseek
    add esp, 12

    ; Read the first half of the file into the buffer
    push bufferSize
    push buffer
    push [fileDescriptor]
    call fread
    add esp, 12
    mov [bytesRead], eax

    ; Open the first output file
    push outputFile1
    push dword 'w'
    call fopen
    add esp, 8
    mov [fileDescriptor], eax

    ; Write the first half of the buffer to the first output file
    push [bytesRead]
    push buffer
    push [fileDescriptor]
    call fwrite
    add esp, 12
    mov [bytesWritten], eax

    ; Close the first output file
    push [fileDescriptor]
    call fclose
    add esp, 4

    ; Open the second output file
    push outputFile2
    push dword 'w'
    call fopen
    add esp, 8
    mov [fileDescriptor], eax

    ; Read the second half of the file into the buffer
    push bufferSize
    push buffer
    push [fileDescriptor]
    call fread
    add esp, 12
    mov [bytesRead], eax

    ; Write the second half of the buffer to the second output file
    push [bytesRead]
    push buffer
    push [fileDescriptor]
    call fwrite
    add esp, 12
    mov [bytesWritten], eax

    ; Close the second output file
    push [fileDescriptor]
    call fclose
    add esp, 4

    ; Exit the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

