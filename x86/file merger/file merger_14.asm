; This program merges the contents of two files into a single output file.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program reads from two input files and writes their contents sequentially to an output file.
; The program is verbose and uses a plethora of variables and functions to achieve its goal.

section .data
    file1 db 'input1.txt', 0
    file2 db 'input2.txt', 0
    output db 'output.txt', 0
    buffer_size equ 1024
    buffer db buffer_size dup(0)
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
    ; Open the first input file
    call open_file1
    test eax, eax
    js error

    ; Open the second input file
    call open_file2
    test eax, eax
    js error

    ; Open the output file
    call open_output
    test eax, eax
    js error

    ; Read from the first input file and write to the output file
    call read_write_file1

    ; Read from the second input file and write to the output file
    call read_write_file2

    ; Close all files
    call close_files

    ; Exit the program
    call exit_program

open_file1:
    mov eax, 5          ; sys_open
    mov ebx, file1      ; filename
    mov ecx, 0          ; read-only
    int 0x80
    mov [file1_handle], eax
    ret

open_file2:
    mov eax, 5          ; sys_open
    mov ebx, file2      ; filename
    mov ecx, 0          ; read-only
    int 0x80
    mov [file2_handle], eax
    ret

open_output:
    mov eax, 5          ; sys_open
    mov ebx, output     ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80
    mov [output_handle], eax
    ret

read_write_file1:
    mov eax, [file1_handle]
    call read_file
    call write_file