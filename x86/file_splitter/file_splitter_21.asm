; Welcome, dear programmer, to the enchanting world of file splitting!
; This delightful program will take a file and split it into smaller, more manageable pieces.
; Imagine a beautiful cake being cut into perfect slices, each one ready to be savored.
; Let's embark on this magical journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileHandle dd 0
    bytesRead dd 0
    fileCounter dd 0
    tempVar dd 0

section .bss
    ; Uninitialized data section for our whimsical variables
    tempBuffer resb bufferSize

section .text
    global _start

_start:
    ; Open the input file with love and care
    mov eax, 5          ; sys_open
    mov ebx, inputFile  ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    js _exit

    ; Initialize our file counter to zero
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
    je close_file

    ; Create a new output file for each chunk
    call create_output_file

    ; Write the buffer to the output file
    mov eax, 4          ; sys_write
    mov ebx, [tempVar]  ; file descriptor
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel

    ; Close the output file
    mov eax, 6          ; sys_close
    mov ebx, [tempVar]
    int 0x80            ; call kernel

    ; Increment the file counter
    inc dword [fileCounter]

    ; Loop back to read more from the input file
    jmp read_loop

create_output_file:
    ; Create a unique filename for each chunk
    mov eax, 8          ; sys_creat
    mov ebx, outputFile
    mov ecx, 0666       ; permissions
    int 0x80            ; call kernel
    mov [tempVar], eax
    ret

close_file:
    ; Close the input file with a gentle touch
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

_exit:
    ; Exit the program gracefully
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel
