; Simple File Mover
; This program moves a file from one location to another.
; It opens the source file, reads its contents, creates a destination file, writes the contents to the destination file, and then closes both files.
; The program is written in x86 Assembly language.
; The program assumes that the source and destination file paths are provided as command-line arguments.
; The program uses DOS interrupts for file operations.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer_size equ 512
    buffer times buffer_size db 0

section .bss
    source_handle resb 1
    destination_handle resb 1
    bytes_read resb 2
    bytes_written resb 2

section .text
    global _start

_start:
    ; Open source file
    mov ah, 0x3D
    mov al, 0x00
    mov dx, source
    int 0x21
    jc error
    mov [source_handle], ax

    ; Create destination file
    mov ah, 0x3C
    mov cx, 0x00
    mov dx, destination
    int 0x21
    jc error
    mov [destination_handle], ax

read_loop:
    ; Read from source file
    mov ah, 0x3F
    mov bx, [source_handle]
    mov cx, buffer_size
    mov dx, buffer
    int 0x21
    jc error
    mov [bytes_read], ax

    ; Check for end of file
    cmp ax, 0
    je close_files

    ; Write to destination file
    mov ah, 0x40
    mov bx, [destination_handle]
    mov cx, [bytes_read]
    mov dx, buffer
    int 0x21
    jc error
    mov [bytes_written], ax

    ; Loop to read next chunk
    jmp read_loop

close_files:
    ; Close source file
    mov ah, 0x3E
    mov bx, [source_handle]
    int 0x21

    ; Close destination file
    mov ah, 0x3E
    mov bx, [destination_handle]
    int 0x21

    ; Exit program
    mov ax, 0x4C00
    int 0x21

error:
    ; Handle error (just exit for simplicity)
    mov ax, 0x4C01
    int 0x21

