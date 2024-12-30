; Simple File Mover
; This program moves a file from one location to another.
; It reads the source file, writes it to the destination, and deletes the source file.
; Written by an engineer who has no time for nonsense.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 4096 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandle dd 0
    fileHandleDest dd 0
    errorMsg db 'Error: ', 0
    errorLen equ $ - errorMsg

section .bss
    temp resb 4096

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    test eax, eax
    js error
    mov [fileHandle], eax

    ; Create the destination file
    mov eax, 5          ; sys_open
    mov ebx, destination; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; mode
    int 0x80            ; call kernel
    test eax, eax
    js error
    mov [fileHandleDest], eax

read_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, 4096
    int 0x80            ; call kernel
    test eax, eax
    jle close_files
    mov [bytesRead], eax

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    test eax, eax
    js error
    mov [bytesWritten], eax

    ; Check if all bytes were written
    cmp [bytesRead], [bytesWritten]
    jne error

    jmp read_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDest]
    int 0x80            ; call kernel

    ; Delete the source file
    mov eax, 10         ; sys_unlink
    mov ebx, source
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80            ; call kernel

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg
    mov edx, errorLen
    int 0x80            ; call kernel

    ; Exit with error code
    mov eax, 1          ; sys_exit
    mov ebx, 1
    int 0x80            ; call kernel

