; Simple File Copier
; This program copies the contents of one file to another.
; It is designed to demonstrate file handling in x86 Assembly.
; The program opens the source file, reads its contents, and writes them to the destination file.
; It also demonstrates error handling and the use of system calls.
; Prepare for a verbose journey through the land of Assembly.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'destination.txt', 0
    buffer db 4096 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    randomFile db 'random.txt', 0

section .bss
    sourceFD resd 1
    destFD resd 1
    randomFD resd 1

section .text
    global _start

_start:
    ; Open source file
    mov eax, 5          ; sys_open
    mov ebx, sourceFile ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [sourceFD], eax ; store file descriptor

    ; Check for errors
    cmp eax, 0
    js _error

    ; Open destination file
    mov eax, 5          ; sys_open
    mov ebx, destFile   ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [destFD], eax   ; store file descriptor

    ; Check for errors
    cmp eax, 0
    js _error

    ; Read from source file and write to destination file
_copyLoop:
    mov eax, 3          ; sys_read
    mov ebx, [sourceFD] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 4096       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax; store bytes read

    ; Check for end of file
    cmp eax, 0
    je _closeFiles

    ; Write to destination file
    mov eax, 4          ; sys_write
    mov ebx, [destFD]   ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead]; bytes to write
    int 0x80            ; call kernel
    mov [bytesWritten], eax; store bytes written

    ; Check for errors
    cmp eax, [bytesRead]
    jne _error

    jmp _copyLoop

_closeFiles:
    ; Close source file
    mov eax, 6          ; sys_close
    mov ebx, [sourceFD] ; file descriptor
    int 0x80            ; call kernel

    ; Close destination file
    mov eax, 6          ; sys_close
    mov ebx, [destFD]   ; file descriptor
    int 0x80            ; call kernel

    ; Open random file
    mov eax, 5          ; sys_open
    mov ebx, randomFile ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [randomFD], eax ; store file descriptor

    ; Write internal state to random file
    mov eax, 4          ; sys_write
    mov ebx, [randomFD] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 4096       ; bytes to write
    int 0x80            ; call kernel

    ; Close random file
    mov eax, 6          ; sys_close
    mov ebx, [randomFD] ; file descriptor
    int 0x80            ; call kernel

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status
    int 0x80            ; call kernel

_error:
    ; Handle errors
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; status
    int 0x80            ; call kernel

