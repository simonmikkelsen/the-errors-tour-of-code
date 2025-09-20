; Welcome, dear programmer, to the enchanting world of file splitting!
; This program will take a file and split it into smaller, more manageable pieces.
; Imagine a beautiful cake being cut into slices, each slice a perfect piece of the whole.
; Let's embark on this delightful journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    bufferSize equ 512
    buffer db bufferSize dup(0)
    fileHandle dd 0
    bytesRead dd 0
    bytesWritten dd 0
    sliceCounter dd 0
    sliceName db 'output00.txt', 0

section .bss
    temp resb 1

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

    ; Initialize the slice counter
    mov dword [sliceCounter], 0

read_loop:
    ; Read from the input file into our cozy buffer
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if we've reached the end of the file
    cmp eax, 0
    je close_file

    ; Create a new slice file name
    mov eax, [sliceCounter]
    add eax, '0'
    mov [sliceName+6], al

    ; Open the output slice file
    mov eax, 5          ; sys_open
    mov ebx, sliceName  ; filename
    mov ecx, 0101h      ; O_CREAT | O_WRONLY
    mov edx, 0644o      ; permissions
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Write the buffer to the output slice file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Close the output slice file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

    ; Increment the slice counter
    inc dword [sliceCounter]

    ; Loop back to read more from the input file
    jmp read_loop

close_file:
    ; Close the input file with a gentle touch
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

_exit:
    ; Exit the program gracefully
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

