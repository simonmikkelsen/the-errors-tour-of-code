; Hello, dear programmer! This delightful program is designed to split a file into smaller parts.
; It will read an input file and create multiple output files, each containing a portion of the original file.
; Let's embark on this enchanting journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    fileExtension db '.part', 0
    bufferSize equ 512
    buffer times bufferSize db 0
    fileCounter db 0
    fileHandle dd 0
    bytesRead dd 0
    bytesWritten dd 0
    totalBytesRead dd 0
    tempVar1 dd 0
    tempVar2 dd 0
    tempVar3 dd 0

section .bss
    fileName resb 20

section .text
    global _start

_start:
    ; Open the input file with love and care
    mov eax, 5
    mov ebx, inputFile
    mov ecx, 0
    int 0x80
    mov [fileHandle], eax

    ; Check if the file was opened successfully
    cmp eax, -1
    je _exit

    ; Read the file in a loop, splitting it into smaller parts
    read_loop:
        ; Read a portion of the file into the buffer
        mov eax, 3
        mov ebx, [fileHandle]
        mov ecx, buffer
        mov edx, bufferSize
        int 0x80
        mov [bytesRead], eax

        ; Check if we have reached the end of the file
        cmp eax, 0
        je close_file

        ; Create a new output file for this part
        mov eax, 8
        mov ebx, outputFile
        mov ecx, fileCounter
        call create_file_name
        mov ecx, 0x42
        mov edx, 0x1A4
        int 0x80
        mov [tempVar1], eax

        ; Write the buffer to the output file
        mov eax, 4
        mov ebx, [tempVar1]
        mov ecx, buffer
        mov edx, [bytesRead]
        int 0x80
        mov [bytesWritten], eax

        ; Close the output file
        mov eax, 6
        mov ebx, [tempVar1]
        int 0x80

        ; Increment the file counter
        inc byte [fileCounter]

        ; Update the total bytes read
        add [totalBytesRead], [bytesRead]

        ; Loop back to read the next portion of the file
        jmp read_loop

    close_file:
        ; Close the input file
        mov eax, 6
        mov