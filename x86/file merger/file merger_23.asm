; File Merger Program
; This program merges the contents of two files into a single output file.
; It demonstrates the use of file handling, buffer management, and string operations in x86 Assembly.
; The program is overly verbose and complex to showcase various assembly instructions and techniques.

section .data
    file1 db 'file1.txt', 0
    file2 db 'file2.txt', 0
    output db 'output.txt', 0
    buffer_size equ 1024
    buffer db buffer_size dup(0)
    msg_open_error db 'Error opening file', 0
    msg_read_error db 'Error reading file', 0
    msg_write_error db 'Error writing file', 0

section .bss
    file1_handle resd 1
    file2_handle resd 1
    output_handle resd 1
    bytes_read resd 1
    bytes_written resd 1

section .text
    global _start

_start:
    ; Open the first file
    mov eax, 5          ; sys_open
    mov ebx, file1      ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    test eax, eax
    js open_error
    mov [file1_handle], eax

    ; Open the second file
    mov eax, 5          ; sys_open
    mov ebx, file2      ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    test eax, eax
    js open_error
    mov [file2_handle], eax

    ; Create the output file
    mov eax, 8          ; sys_creat
    mov ebx, output     ; filename
    mov ecx, 0666o      ; permissions
    int 0x80            ; call kernel
    test eax, eax
    js open_error
    mov [output_handle], eax

    ; Read from the first file and write to the output file
    call read_and_write_file
    ; Read from the second file and write to the output file
    call read_and_write_file

    ; Close all files
    call close_files

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

read_and_write_file:
    ; Read from file
    mov eax, 3          ; sys_read
    mov ebx, [file1_handle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, buffer_size ; buffer size
    int 0x80            ; call kernel
    test eax, eax
    js read_error
    mov [bytes_read], eax

    ; Write to output file
    mov eax, 4          ; sys_write
    mov ebx, [output_handle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytes_read] ; number of bytes read
    int 0x80            ; call kernel
    test eax, eax
    js write_error
    mov [bytes_written], eax

    ret

close_files:
    ; Close the first file
    mov eax, 6          ; sys_close
    mov ebx, [file1_handle] ; file descriptor
    int 0x80            ; call kernel

    ; Close the second file
    mov eax, 6          ; sys_close
    mov ebx, [file2_handle] ; file descriptor
    int 0x80            ; call kernel

    ; Close the output file
    mov eax, 6          ; sys_close
    mov ebx, [output_handle] ; file descriptor
    int 0x80            ; call kernel

    ret

open_error:
    ; Print open error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg_open_error ; message
    mov edx, 18         ; message length
    int 0x80            ; call kernel
    jmp exit

read_error:
    ; Print read error message
    mov eax, 4          ; sys_write
    mov