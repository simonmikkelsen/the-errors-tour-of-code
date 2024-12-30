; 🌸✨ Welcome to the File Splitter Program! ✨🌸
; This delightful program will take a file and split it into smaller, more manageable pieces.
; Imagine a beautiful cake being sliced into perfect portions for a lovely tea party! 🍰☕
; Let's embark on this enchanting journey together, shall we? 🌷

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output_', 0
    fileExtension db '.part', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileCounter db 0

section .bss
    inputHandle resd 1
    outputHandle resd 1
    bytesRead resd 1
    bytesWritten resd 1

section .text
    global _start

_start:
    ; 🌟 Open the input file with love and care 🌟
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; invoke syscall
    mov [inputHandle], eax

    ; 🌟 Check if the file was opened successfully 🌟
    cmp eax, 0
    js _exit            ; if error, exit gracefully

    ; 🌟 Read the file in a loop, like a gentle breeze 🌟
read_loop:
    mov eax, 3          ; sys_read
    mov ebx, [inputHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; invoke syscall
    mov [bytesRead], eax

    ; 🌟 If no more bytes to read, exit the loop 🌟
    cmp eax, 0
    je close_input

    ; 🌟 Create a new output file for each part 🌟
    call create_output_file

    ; 🌟 Write the buffer to the output file with a sprinkle of magic 🌟
    mov eax, 4          ; sys_write
    mov ebx, [outputHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; invoke syscall
    mov [bytesWritten], eax

    ; 🌟 Close the output file with a gentle touch 🌟
    mov eax, 6          ; sys_close
    mov ebx, [outputHandle]
    int 0x80            ; invoke syscall

    ; 🌟 Increment the file counter for the next part 🌟
    inc byte [fileCounter]

    ; 🌟 Continue reading the input file 🌟
    jmp read_loop

close_input:
    ; 🌟 Close the input file with a warm farewell 🌟
    mov eax, 6          ; sys_close
    mov ebx, [inputHandle]
    int 0x80            ; invoke syscall

_exit:
    ; 🌟 Exit the program with a graceful bow 🌟
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; invoke syscall

create_output_file:
    ; 🌟 Create a unique output filename with a touch of creativity 🌟
    mov