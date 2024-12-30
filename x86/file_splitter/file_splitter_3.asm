; Hello, dear programmer! This delightful program is a file splitter.
; It takes a file and splits it into smaller, more manageable pieces.
; Imagine a beautiful cake being cut into slices for everyone to enjoy!
; Let's embark on this enchanting journey together.

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output_', 0
    fileExtension db '.part', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileCounter db '0', 0

section .bss
    inputHandle resd 1
    outputHandle resd 1
    bytesRead resd 1
    bytesWritten resd 1

section .text
    global _start

_start:
    ; Open the input file with love and care
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [inputHandle], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    js _exit

    ; Prepare to read the file in chunks
read_loop:
    mov eax, 3          ; sys_read
    mov ebx, [inputHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; If no more bytes are read, we are done
    cmp eax, 0
    je close_input

    ; Create a new output file for each chunk
    mov eax, 8          ; sys_creat
    mov ebx, outputFile
    mov ecx, 0644       ; permissions
    int 0x80            ; call kernel
    mov [outputHandle], eax

    ; Write the chunk to the output file
    mov eax, 4          ; sys_write
    mov ebx, [outputHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel

    ; Close the output file
    mov eax, 6          ; sys_close
    mov ebx, [outputHandle]
    int 0x80            ; call kernel

    ; Increment the file counter for the next chunk
    inc byte [fileCounter]

    ; Loop back to read the next chunk
    jmp read_loop

close_input:
    ; Close the input file with a gentle touch
    mov eax, 6          ; sys_close
    mov ebx, [inputHandle]
    int 0x80            ; call kernel

_exit:
    ; Exit the program gracefully
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

