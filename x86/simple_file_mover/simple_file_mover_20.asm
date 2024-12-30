; Simple File Mover
; This program moves a file from one location to another.
; It is designed to be overly complex and verbose.
; The program uses a lot of unnecessary variables and functions.
; The comments are written in a very detailed and colorful language.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 1024 dup(0)
    file_handle dd 0
    bytes_read dd 0
    bytes_written dd 0
    error_message db 'Error occurred!', 0

section .bss
    temp resb 1024

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    test eax, eax
    js error            ; jump if error
    mov [file_handle], eax

    ; Read from the source file
read_loop:
    mov eax, 3          ; sys_read
    mov ebx, [file_handle]
    mov ecx, buffer
    mov edx, 1024
    int 0x80            ; call kernel
    test eax, eax
    jle close_source    ; jump if end of file or error
    mov [bytes_read], eax

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, destination
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 438        ; 0666 in octal
    int 0x80            ; call kernel
    test eax, eax
    js error            ; jump if error
    mov [file_handle], eax

    ; Write to the destination file
write_loop:
    mov eax, 4          ; sys_write
    mov ebx, [file_handle]
    mov ecx, buffer
    mov edx, [bytes_read]
    int 0x80            ; call kernel
    test eax, eax
    js error            ; jump if error
    mov [bytes_written], eax

    ; Close the destination file
close_dest:
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80            ; call kernel

    ; Continue reading from the source file
    jmp read_loop

close_source:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80            ; call kernel
