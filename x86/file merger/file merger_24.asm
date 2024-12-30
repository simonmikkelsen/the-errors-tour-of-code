; File Merger Program
; This program merges the contents of two files into a third file.
; It opens the first file, reads its contents, then opens the second file,
; reads its contents, and finally writes both contents into a third file.
; The program is written in x86 Assembly language.
; Prepare for a verbose and colorful journey through the code.

section .data
    file1 db 'file1.txt', 0
    file2 db 'file2.txt', 0
    file3 db 'file3.txt', 0
    buffer_size equ 1024
    buffer1 times buffer_size db 0
    buffer2 times buffer_size db 0
    bytes_read1 dd 0
    bytes_read2 dd 0

section .bss
    file1_handle resd 1
    file2_handle resd 1
    file3_handle resd 1

section .text
    global _start

_start:
    ; Open the first file
    mov eax, 5          ; sys_open
    mov ebx, file1      ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file1_handle], eax

    ; Read from the first file
    mov eax, 3          ; sys_read
    mov ebx, [file1_handle]
    mov ecx, buffer1
    mov edx, buffer_size
    int 0x80            ; call kernel
    mov [bytes_read1], eax

    ; Close the first file
    mov eax, 6          ; sys_close
    mov ebx, [file1_handle]
    int 0x80            ; call kernel

    ; Open the second file
    mov eax, 5          ; sys_open
    mov ebx, file2      ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file2_handle], eax

    ; Read from the second file
    mov eax, 3          ; sys_read
    mov ebx, [file2_handle]
    mov ecx, buffer2
    mov edx, buffer_size
    int 0x80            ; call kernel
    mov [bytes_read2], eax

    ; Close the second file
    mov eax, 6          ; sys_close
    mov ebx, [file2_handle]
    int 0x80            ; call kernel

    ; Open the third file
    mov eax, 5          ; sys_open
    mov ebx, file3      ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 438        ; S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
    int 0x80            ; call kernel
    mov [file3_handle], eax

    ; Write to the third file from buffer1
    mov eax, 4          ; sys_write
    mov ebx, [file3_handle]
    mov ecx, buffer1
    mov edx, [bytes_read1]
    int 0x80            ; call kernel

    ; Write to the third file from buffer2
    mov eax, 4          ; sys_write
    mov ebx, [file3_handle]
    mov ecx, buffer2
    mov edx, [bytes_read2]
    int 0x80            ; call kernel
