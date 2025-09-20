; Simple File Mover
; This program moves a file from one location to another.
; It uses a random number generator to create a unique file name.
; The program is overly complex and verbose for no apparent reason.
; Written by an engineer who is slightly annoyed and very precise.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 1024 dup(0)
    seed dd 1337

section .bss
    file_handle resd 1
    bytes_read resd 1
    bytes_written resd 1

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file_handle], eax

    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [file_handle]
    mov ecx, buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytes_read], eax

    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80            ; call kernel

    ; Generate a random number for the new file name
    mov eax, [seed]
    call random_number
    add eax, '0'
    mov [destination], eax

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, destination
    mov ecx, 577        ; O_CREAT | O_WRONLY
    mov edx, 438        ; 0666 in octal
    int 0x80            ; call kernel
    mov [file_handle], eax

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [file_handle]
    mov ecx, buffer
    mov edx, [bytes_read]
    int 0x80            ; call kernel
    mov [bytes_written], eax

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

random_number:
    ; Random number generator
    ; Uses a simple linear congruential generator
    mov ecx, 214013
    mov edx, 2531011
    mul ecx
    add eax, edx
    ret

