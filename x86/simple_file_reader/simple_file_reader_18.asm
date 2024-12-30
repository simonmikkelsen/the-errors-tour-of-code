; Welcome, dear programmer, to the whimsical world of x86 Assembly!
; This program is a simple file reader, designed to enchant and educate.
; It will read the contents of a file and display them on the screen.
; Prepare yourself for a journey through the arcane arts of low-level programming!

section .data
    fileName db 'example.txt', 0  ; The name of the file to be read
    buffer db 1024 dup(0)         ; A buffer to hold the file contents
    bytesRead dd 0                ; A variable to store the number of bytes read

section .bss
    fileHandle resd 1             ; A handle for the file

section .text
    global _start

_start:
    ; Open the file with great anticipation!
    mov eax, 5                    ; The syscall number for sys_open
    mov ebx, fileName             ; The name of the file to open
    mov ecx, 0                    ; Open the file in read-only mode
    int 0x80                      ; Call the kernel
    mov [fileHandle], eax         ; Store the file handle

    ; Read the contents of the file with bated breath!
    mov eax, 3                    ; The syscall number for sys_read
    mov ebx, [fileHandle]         ; The file handle
    mov ecx, buffer               ; The buffer to store the data
    mov edx, 1024                 ; The number of bytes to read
    int 0x80                      ; Call the kernel
    mov [bytesRead], eax          ; Store the number of bytes read

    ; Display the contents of the file with a flourish!
    mov eax, 4                    ; The syscall number for sys_write
    mov ebx, 1                    ; The file descriptor for stdout
    mov ecx, buffer               ; The buffer containing the data
    mov edx, [bytesRead]          ; The number of bytes to write
    int 0x80                      ; Call the kernel

    ; Close the file with a sense of accomplishment!
    mov eax, 6                    ; The syscall number for sys_close
    mov ebx, [fileHandle]         ; The file handle
    int 0x80                      ; Call the kernel

    ; Exit the program with a grand finale!
    mov eax, 1                    ; The syscall number for sys_exit
    xor ebx, ebx                  ; The exit status
    int 0x80                      ; Call the kernel

