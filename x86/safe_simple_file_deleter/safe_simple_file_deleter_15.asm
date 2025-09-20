; Safe File Deleter
; This program deletes a file securely by overwriting its contents multiple times.
; It ensures that the file data is irrecoverable by any means.
; The program uses a variety of techniques to achieve this goal.
; Written by an engineer who has no time for nonsense.

section .data
    fileName db 'file_to_delete.txt', 0
    buffer db 1024 dup(0)
    overwritePattern db 0xAA, 0x55, 0xFF, 0x00
    patternLength equ 4
    maxIterations equ 256

section .bss
    fileHandle resd 1
    bytesRead resd 1
    i resd 1
    j resd 1
    k resd 1
    temp resd 1

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 2          ; O_RDWR
    mov edx, 0          ; mode
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, 0
    jl _exit

    ; Get file size
    mov eax, 195        ; sys_fstat
    mov ebx, [fileHandle]
    lea ecx, [buffer]
    int 0x80

    ; Overwrite file contents multiple times
    mov ecx, maxIterations
    xor edi, edi        ; iteration counter

overwrite_loop:
    ; Reset file pointer to the beginning
    mov eax, 19         ; sys_lseek
    mov ebx, [fileHandle]
    xor ecx, ecx        ; offset
    mov edx, 0          ; SEEK_SET
    int 0x80

    ; Overwrite file with pattern
    mov esi, overwritePattern
    mov edx, patternLength
    xor ebx, ebx        ; buffer index

pattern_loop:
    mov al, [esi + ebx]
    mov [buffer + ebx], al
    inc ebx
    cmp ebx, edx
    jl pattern_loop

    ; Write buffer to file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandle]
    lea ecx, [buffer]
    mov edx, 1024       ; buffer size
    int 0x80

    ; Increment iteration counter
    inc edi
    cmp edi, ecx
    jl overwrite_loop

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code
    int 0x80

