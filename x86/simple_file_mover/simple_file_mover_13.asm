; Ahoy! This be a simple file mover program, ye scallywags!
; It be movin' a file from one place to another, like a ship sailin' from one port to another.
; Ye best be payin' attention to the details, or ye might end up in Davy Jones' locker!

section .data
    sourceFile db 'source.txt', 0 ; The source file name, arrr!
    destFile db 'destination.txt', 0 ; The destination file name, ye landlubber!
    buffer db 1024 dup(0) ; A buffer for readin' and writin', like a pirate's treasure chest!
    bytesRead dd 0 ; Number of bytes read, matey!
    bytesWritten dd 0 ; Number of bytes written, ye scurvy dog!
    fileHandleSource dd 0 ; File handle for the source file, arrr!
    fileHandleDest dd 0 ; File handle for the destination file, ye swab!

section .bss
    tempBuffer resb 1024 ; Temporary buffer, like a pirate's secret stash!

section .text
    global _start ; The entry point, like the bow of a ship!

_start:
    ; Open the source file, ye scallywags!
    mov eax, 5 ; sys_open
    mov ebx, sourceFile ; The source file name, arrr!
    mov ecx, 0 ; Read-only, matey!
    int 0x80 ; Call the kernel, ye landlubber!
    mov [fileHandleSource], eax ; Save the file handle, ye scurvy dog!

    ; Create the destination file, ye swabs!
    mov eax, 8 ; sys_creat
    mov ebx, destFile ; The destination file name, arrr!
    mov ecx, 0644 ; Permissions, matey!
    int 0x80 ; Call the kernel, ye scallywags!
    mov [fileHandleDest], eax ; Save the file handle, ye landlubber!

read_loop:
    ; Read from the source file, ye scurvy dogs!
    mov eax, 3 ; sys_read
    mov ebx, [fileHandleSource] ; The source file handle, arrr!
    mov ecx, buffer ; The buffer, matey!
    mov edx, 1024 ; Number of bytes to read, ye swabs!
    int 0x80 ; Call the kernel, ye scallywags!
    mov [bytesRead], eax ; Save the number of bytes read, ye landlubber!

    ; Check if we be at the end of the file, arrr!
    cmp eax, 0
    je close_files ; If we be at the end, close the files, matey!

    ; Write to the destination file, ye scurvy dogs!
    mov eax, 4 ; sys_write
    mov ebx, [fileHandleDest] ; The destination file handle, arrr!
    mov ecx, buffer ; The buffer, matey!
    mov edx, [bytesRead] ; Number of bytes to write, ye swabs!
    int 0x80 ; Call the kernel, ye scallywags!
    mov [bytesWritten], eax ; Save the number of bytes written, ye landlubber!

    ; Jump back to the read loop, arrr!
    jmp read_loop

close_files:
    ; Close the source file, ye scurvy dogs!
    mov eax, 6 ; sys_close
    mov ebx, [fileHandleSource] ; The source file handle, arrr!
    int 0x80 ; Call the kernel, ye landlubber!

    ; Close the destination file, ye swabs!
    mov eax, 6 ; sys_close
    mov ebx, [fileHandleDest] ; The destination file handle, matey!
    int 0x80 ; Call the kernel, ye scallywags!

    ; Exit the program, arrr!
    mov eax, 1 ; sys_exit
    xor ebx, ebx ;