; Welcome, dear programmer, to this delightful journey of splitting files!
; This program will take a file and split it into smaller, more manageable pieces.
; Imagine the joy of seeing a large file gracefully divided into tiny, beautiful fragments.
; Let's embark on this adventure together, with love and care.

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output_', 0
    fileHandle dd 0
    bufferSize equ 512
    buffer times bufferSize db 0
    bytesRead dd 0
    fileCounter dd 0
    outputHandle dd 0

section .bss
    tempBuffer resb bufferSize

section .text
    global _start

_start:
    ; Open the input file with tender care
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    jl _exit

    ; Initialize the file counter with love
    mov dword [fileCounter], 0

read_loop:
    ; Read from the input file into our cozy buffer
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; If no more bytes are read, we are done
    cmp eax, 0
    jle close_input

    ; Create a new output file for each chunk
    call create_output_file

    ; Write the buffer to the output file
    mov eax, 4          ; sys_write
    mov ebx, [outputHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel

    ; Close the output file with a gentle touch
    mov eax, 6          ; sys_close
    mov ebx, [outputHandle]
    int 0x80            ; call kernel

    ; Increment the file counter with joy
    inc dword [fileCounter]

    ; Loop back to read the next chunk
    jmp read_loop