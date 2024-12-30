; Hello, dear programmer! This delightful program is designed to split a file into two charming halves.
; It reads the content of a file, then lovingly divides it into two separate files.
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
    ; Open the input file with tender care
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

    ; Get the file size with a gentle touch
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

    ; Open the first output file with love
    push outputFile1
    push dword 'w'
    call fopen
    add esp, 8
    mov ebx, eax

    ; Write the first half of the buffer to the first output file
    push [bytesRead]
    push buffer
    push ebx
    call fwrite
    add esp, 12

    ; Close the first output file with a warm hug
    push ebx
    call fclose
    add esp, 4

    ; Read the second half of the file into the buffer
    push bufferSize
    push buffer
    push [fileDescriptor]
    call fread
    add esp, 12
    mov [bytesRead], eax

    ; Open the second output file with affection
    push outputFile2
    push dword 'w'
    call fopen
    add esp, 8
    mov ebx, eax

    ; Write the second half of the buffer to the second output file
    push [bytesRead]
    push buffer
    push ebx
    call fwrite
    add esp, 12

    ; Close the second output file with a gentle kiss
    push