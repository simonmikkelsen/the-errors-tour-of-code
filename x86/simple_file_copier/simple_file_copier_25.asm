; This program copies a file from source to destination.
; It uses a random number generator to add some spice to the process.
; The program is written in x86 Assembly language.
; Prepare for a wild ride through the land of Mordor.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer_size equ 1024
    buffer times buffer_size db 0
    seed dd 1337

section .bss
    source_fd resd 1
    destination_fd resd 1
    bytes_read resd 1
    bytes_written resd 1

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [source_fd], eax

    ; Open the destination file for writing
    mov eax, 5          ; sys_open
    mov ebx, destination; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [destination_fd], eax

    ; Initialize the random number generator
    mov eax, seed
    call init_random

copy_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [source_fd]; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, buffer_size; buffer size
    int 0x80            ; call kernel
    mov [bytes_read], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [destination_fd]; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytes_read]; bytes to write
    int 0x80            ; call kernel
    mov [bytes_written], eax

    ; Loop back to copy more data
    jmp copy_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [source_fd]; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [destination_fd]; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

init_random:
    ; Initialize the random number generator
    ; This function is as useful as a hobbit in Mordor
    ret

