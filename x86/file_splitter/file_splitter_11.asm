; Hello, dear programmer! This delightful program is a file splitter.
; It takes a file and splits it into smaller pieces, each of a specified size.
; This can be useful for managing large files or sending them over a network.
; Let's embark on this journey together, step by step, with love and care.

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileHandle dd 0
    bytesRead dd 0
    bytesWritten dd 0
    partNumber dd 0
    partSuffix db 'part', 0

section .bss
    tempBuffer resb bufferSize
    tempHandle resd 1

section .text
    global _start

_start:
    ; Open the input file with all the love in the world
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    js _exit

    ; Initialize part number
    mov dword [partNumber], 1

read_loop:
    ; Read from the input file with gentle care
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if we have reached the end of the file
    cmp eax, 0
    je close_file

    ; Create the output file name with a loving touch
    mov eax, [partNumber]
    add eax, '0'
    mov [partSuffix + 4], al

    ; Open the output file with a warm embrace
    mov eax, 5          ; sys_open
    mov ebx, outputFile ; filename
    mov ecx, 0101h      ; O_CREAT | O_WRONLY
    mov edx, 0644o      ; mode
    int 0x80            ; call kernel
    mov [tempHandle], eax

    ; Write to the output file with tender care
    mov eax, 4          ; sys_write
    mov ebx, [tempHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Close the output file with a gentle touch
    mov eax, 6          ; sys_close
    mov ebx, [tempHandle]
    int 0x80            ; call kernel

    ; Increment the part number with a loving touch
    inc dword [partNumber]
    jmp read_loop

close_file:
    ; Close the input file with a warm goodbye
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80