; File Merger Program
; This program merges two files into one. It reads the contents of two files,
; combines them, and writes the result to a new file. The program is designed
; to demonstrate file handling in x86 Assembly. 

section .data
    file1 db 'file1.txt', 0
    file2 db 'file2.txt', 0
    output db 'output.txt', 0
    buffer_size equ 1024
    buffer times buffer_size db 0
    error_msg db 'Error: Could not open file', 0

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
    int 0x80
    test eax, eax
    js error
    mov [file1_handle], eax

    ; Open the second file
    mov eax, 5          ; sys_open
    mov ebx, file2      ; filename
    mov ecx, 0          ; read-only
    int 0x80
    test eax, eax
    js error
    mov [file2_handle], eax

    ; Create the output file
    mov eax, 8          ; sys_creat
    mov ebx, output     ; filename
    mov ecx, 0666       ; permissions
    int 0x80
    test eax, eax
    js error
    mov [output_handle], eax

    ; Read from the first file and write to the output file
    call read_and_write_file1

    ; Read from the second file and write to the output file
    call read_and_write_file2

    ; Close all files
    call close_files

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80

read_and_write_file1:
    mov eax, 3          ; sys_read
    mov ebx, [file1_handle]
    mov ecx, buffer
    mov edx, buffer_size
    int 0x80
    test eax, eax
    js error
    mov [bytes_read], eax

    mov eax, 4          ; sys_write
    mov ebx, [output_handle]
    mov ecx, buffer
    mov edx, [bytes_read]
    int 0x80
    test eax, eax
    js error
    mov [bytes_written], eax
    ret

read_and_write_file2:
    mov eax, 3          ; sys_read
    mov ebx, [file2_handle]
    mov ecx, buffer
    mov edx,