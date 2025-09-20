; Hello, dear programmer! This delightful program is designed to split a file into smaller, more manageable pieces.
; It is crafted with love and care to help you understand the beauty of x86 Assembly language.
; Let's embark on this enchanting journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output_', 0
    fileExtension db '.part', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileCounter db 0
    randomFileName db 'random_', 0

section .bss
    inputHandle resd 1
    outputHandle resd 1
    bytesRead resd 1
    bytesWritten resd 1

section .text
    extern _open, _read, _write, _close, _lseek, _random
    global _start

_start:
    ; Open the input file with a gentle touch
    push dword 0
    push dword 0
    push dword inputFile
    call _open
    add esp, 12
    mov [inputHandle], eax

    ; Check if the file was opened successfully
    cmp eax, -1
    je _exit

    ; Read the file in a loop, splitting it into smaller parts
read_loop:
    ; Read a portion of the file into the buffer
    push dword bufferSize
    push dword buffer
    push dword [inputHandle]
    call _read
    add esp, 12
    mov [bytesRead], eax

    ; If no more bytes are read, exit the loop
    cmp eax, 0
    je close_input

    ; Create a new output file for each part
    push dword 0
    push dword 577
    push dword outputFile
    call