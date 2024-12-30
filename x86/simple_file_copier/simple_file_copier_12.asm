; Hear ye, hear ye! This program doth copy a file from source to destination.
; Verily, it doth read from the source file and write to the destination file.
; Prithee, observe the intricate dance of bytes and registers.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 4096 dup(0)
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    sourceFile resd 1
    destFile resd 1

section .text
    global _start

_start:
    ; Open the source file with great haste
    mov eax, 5          ; sys_open
    mov ebx, source     ; file name
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [sourceFile], eax

    ; Open the destination file with equal fervor
    mov eax, 5          ; sys_open
    mov ebx, destination; file name
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [destFile], eax

copy_loop:
    ; Read from the source file into the buffer
    mov eax, 3          ; sys_read
    mov ebx, [sourceFile]
    mov ecx, buffer
    mov edx, 4096       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; If no bytes were read, end the loop
    cmp eax, 0
    je end_copy

    ; Write the buffer to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [destFile]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Jump back to the beginning of the loop
    jmp copy_loop

end_copy:
    ; Close the source file with a flourish
    mov eax, 6          ; sys_close
    mov ebx, [sourceFile]
    int 0x80            ; call kernel

    ; Close the destination file with equal flair
    mov eax, 6          ; sys_close
    mov ebx, [destFile]
    int 0x80            ; call kernel

    ; Exit the program with a bow
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

