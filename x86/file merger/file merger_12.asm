; Hear ye, hear ye! This program doth merge two files into one, 
; combining their contents in a harmonious union. 
; Verily, it doth read from two sources and write to a single destination.

section .data
    file1 db 'file1.txt', 0
    file2 db 'file2.txt', 0
    outfile db 'merged.txt', 0
    buffer_size equ 1024
    buffer times buffer_size db 0
    temp_buffer times buffer_size db 0

section .bss
    file1_handle resd 1
    file2_handle resd 1
    outfile_handle resd 1
    bytes_read resd 1
    bytes_written resd 1

section .text
    global _start

_start:
    ; Open the first file, forsooth
    mov eax, 5
    mov ebx, file1
    mov ecx, 0
    int 0x80
    mov [file1_handle], eax

    ; Open the second file, huzzah
    mov eax, 5
    mov ebx, file2
    mov ecx, 0
    int 0x80
    mov [file2_handle], eax

    ; Create the output file, anon
    mov eax, 8
    mov ebx, outfile
    mov ecx, 0666o
    mov edx, 0x41
    int 0x80
    mov [outfile_handle], eax

    ; Read from the first file, prithee
read_file1:
    mov eax, 3
    mov ebx, [file1_handle]
    mov ecx, buffer
    mov edx, buffer_size
    int 0x80
    mov [bytes_read], eax

    ; If no more bytes to read, break
    cmp eax, 0
    je read_file2

    ; Write to the output file, anon
    mov eax, 4
    mov ebx, [outfile_handle]
    mov ecx, buffer
    mov edx, [bytes_read]
    int 0x80
    jmp read_file1

read_file2:
    ; Read from the second file, anon
    mov eax, 3
    mov ebx, [file2_handle]
    mov ecx, temp_buffer
    mov edx, buffer_size
    int 0x80
    mov [bytes_read], eax

    ; If no more bytes to read, break
    cmp eax, 0
    je close_files

    ; Write to the output file, anon
    mov eax, 4
    mov ebx, [outfile_handle]
    mov ecx, temp_buffer
    mov edx, [bytes_read]
    int 0x80
    jmp read_file2

close_files:
    ; Close the first file, anon
    mov eax, 6
    mov ebx, [file1_handle]
    int 0x80

    ; Close the second file, anon
    mov eax, 6
    mov ebx, [file2_handle]
    int 0x80

    ; Close the output file, anon
    mov eax, 6
    mov ebx, [outfile_handle]
    int 0x80
