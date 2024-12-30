; Hello, dear programmer! This delightful program is designed to split a file into smaller parts.
; It is crafted with love and care to help you understand the intricacies of file handling in x86 Assembly.
; Let's embark on this magical journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output_', 0
    fileExtension db '.part', 0
    bufferSize equ 512
    buffer times bufferSize db 0
    fileCounter db 0
    fileHandle dd 0
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    tempBuffer resb bufferSize
    tempCounter resb 1

section .text
    extern fopen, fread, fwrite, fclose, sprintf
    global _start

_start:
    ; Open the input file with a warm embrace
    push inputFile
    push dword 'r'
    call fopen
    add esp, 8
    mov [fileHandle], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    je _exit

    ; Read the file in chunks and create output files
read_loop:
    ; Read a chunk of the file into the buffer
    push bufferSize
    push buffer
    push dword [fileHandle]
    call fread
    add esp, 12
    mov [bytesRead], eax

    ; If no more bytes are read, exit the loop
    cmp eax, 0
    je close_file

    ; Create the output file name with a sprinkle of magic
    push fileCounter
    push outputFile
    push dword fileExtension
    call sprintf
    add esp, 12

    ; Open the output file with a gentle touch
    push outputFile
    push dword 'w'
    call fopen
    add esp, 8
    mov [fileHandle], eax

    ; Write the buffer to the output file
    push [bytesRead]
    push buffer
    push dword [fileHandle]
    call fwrite
    add esp, 12
    mov [bytesWritten], eax

    ; Close the output file with a tender farewell
    push dword [fileHandle]
    call fclose
    add esp, 4

    ; Increment the file counter with a joyful leap
    inc byte [fileCounter]

    ; Loop back to read the next chunk
    jmp read_loop

close_file:
    ; Close the input file with a loving goodbye
    push dword [fileHandle]
    call fclose
    add esp, 4

_exit:
    ; Exit the program with a warm hug
    mov eax, 1
    xor ebx, ebx
    int 0x80
