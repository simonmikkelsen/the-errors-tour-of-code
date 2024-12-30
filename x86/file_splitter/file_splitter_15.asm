; Hello, dear programmer! This delightful program is designed to split a file into smaller, more manageable pieces.
; Imagine you have a large file, and you want to break it down into smaller chunks for easier handling.
; This program will take an input file and split it into multiple smaller files, each with a specified number of bytes.
; Let's embark on this enchanting journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output_', 0
    fileExtension db '.txt', 0
    bufferSize dw 256 ; Buffer size for reading the file
    buffer db 256 dup(0) ; Buffer to hold file data
    fileCounter db 0 ; Counter for output files
    bytesRead dw 0 ; Number of bytes read from the file
    bytesToRead dw 256 ; Number of bytes to read in each chunk

section .bss
    inputHandle resd 1
    outputHandle resd 1

section .text
    global _start

_start:
    ; Open the input file with love and care
    mov eax, 5 ; sys_open
    mov ebx, inputFile
    mov ecx, 0 ; Read-only mode
    int 0x80
    mov [inputHandle], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    js _exit

read_loop:
    ; Read from the input file into the buffer
    mov eax, 3 ; sys_read
    mov ebx, [inputHandle]
    mov ecx, buffer
    mov edx, [bytesToRead]
    int 0x80
    mov [bytesRead], ax

    ; Check if we have reached the end of the file
    cmp eax, 0
    je close_input

    ; Create a new output file for each chunk
    call create_output_file

    ; Write the buffer to the output file
    mov eax, 4 ; sys_write
    mov ebx, [outputHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80

    ; Close the output file
    mov eax, 6 ; sys_close
    mov ebx, [outputHandle]
    int 0x80

    ; Increment the file counter with a touch of magic
    inc byte [fileCounter]

    ; Loop back to read the next chunk
    jmp read_loop

close_input:
    ; Close the input file with a