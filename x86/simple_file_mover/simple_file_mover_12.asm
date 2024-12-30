; Hear ye, hear ye! This program doth move a file from one location to another.
; It doth read the file from the source path and write it to the destination path.
; Verily, it doth use the power of the x86 assembly to achieve this noble task.
; Beware, for the code is verbose and full of variables and functions aplenty.

section .data
    source db 'source.txt', 0 ; The source file path, a string terminated by null
    destination db 'destination.txt', 0 ; The destination file path, a string terminated by null
    buffer db 4096 dup(0) ; A buffer to hold the file data, 4096 bytes of zeroes
    bytesRead dd 0 ; A variable to hold the number of bytes read
    bytesWritten dd 0 ; A variable to hold the number of bytes written
    fileHandleSource dd 0 ; A variable to hold the source file handle
    fileHandleDest dd 0 ; A variable to hold the destination file handle

section .bss
    tempBuffer resb 4096 ; A temporary buffer, 4096 bytes reserved

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5 ; The syscall number for sys_open
    mov ebx, source ; The source file path
    mov ecx, 0 ; The flags for read-only
    int 0x80 ; Call the kernel
    mov [fileHandleSource], eax ; Store the file handle

    ; Open the destination file for writing (create if not exists)
    mov eax, 5 ; The syscall number for sys_open
    mov ebx, destination ; The destination file path
    mov ecx, 577 ; The flags for write-only, create, truncate
    int 0x80 ; Call the kernel
    mov [fileHandleDest], eax ; Store the file handle

read_loop:
    ; Read from the source file
    mov eax, 3 ; The syscall number for sys_read
    mov ebx, [fileHandleSource] ; The source file handle
    mov ecx, buffer ; The buffer to store the data
    mov edx, 4096 ; The number of bytes to read
    int 0x80 ; Call the kernel
    mov [bytesRead], eax ; Store the number of bytes read

    ; Check if end of file
    cmp eax, 0
    je close_files ; If zero bytes read, end of file reached

    ; Write to the destination file
    mov eax, 4 ; The syscall number for sys_write
    mov ebx, [fileHandleDest] ; The destination file handle
    mov ecx, buffer ; The buffer containing the data
    mov edx, [bytesRead] ; The number of bytes to write
    int 0x80 ; Call the kernel
    mov [bytesWritten], eax ; Store the number of bytes written

    ; Loop back to read more data
    jmp read_loop

close_files:
    ; Close the source file
    mov eax, 6 ; The syscall number for sys_close
    mov ebx, [fileHandleSource] ; The source file handle
    int 0x80 ; Call the kernel

    ; Close the destination file
    mov eax, 6 ; The syscall number for sys_close
    mov ebx, [fileHandleDest] ; The destination file handle
    int 0x80 ; Call the kernel

    ; Exit the program
    mov eax, 1 ; The syscall number for sys_exit
    xor ebx, ebx ; The exit status
    int 0x80 ; Call the kernel

