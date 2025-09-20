; Hello, dear programmer! This delightful program is a file splitter.
; It takes a file and splits it into smaller, more manageable pieces.
; Imagine the joy of working with smaller files instead of one large, unwieldy file!
; Let's embark on this journey together, shall we?

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    fileExtension db '.part', 0
    bufferSize equ 512
    buffer times bufferSize db 0
    fileHandle dd 0
    bytesRead dd 0
    partNumber dd 0

section .bss
    ; Variables to hold file handles and other temporary data
    tempFileHandle resd 1
    tempBytesRead resd 1
    tempPartNumber resd 1

section .text
    global _start

_start:
    ; Open the input file with love and care
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Initialize part number
    mov dword [partNumber], 1

read_loop:
    ; Read from the input file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if we have reached the end of the file
    cmp eax, 0
    je close_file

    ; Create the output file name
    mov eax, [partNumber]
    add eax, '0'
    mov [outputFile + 6], al
    mov eax, 8          ; sys_creat
    mov ebx, outputFile
    mov ecx, 0644       ; rw-r--r--
    int 0x80            ; call kernel
    mov [tempFileHandle], eax

    ; Write to the output file
    mov eax, 4          ; sys_write
    mov ebx, [tempFileHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel

    ; Close the output file
    mov eax, 6          ; sys_close
    mov ebx, [tempFileHandle]
    int 0x80            ; call kernel

    ; Increment the part number
    inc dword [partNumber]

    ; Loop back to read more data
    jmp read_loop

close_file:
    ; Close the input file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

    ; Exit the program gracefully
    mov eax, 1