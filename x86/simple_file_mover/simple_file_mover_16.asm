; Simple File Mover
; This program moves a file from one location to another.
; It opens the source file, reads its contents, creates a destination file, and writes the contents to the destination file.
; The program uses various registers and memory locations to achieve this task.
; Written in x86 Assembly for DOS.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
    buffer db 1024
    bytesRead dw 0
    bytesWritten dw 0
    fileHandle dw 0
    fileHandleDest dw 0
    tempVar dw 0

section .bss
    tempBuffer resb 1024

section .text
    global _start

_start:
    ; Open source file
    mov ax, 3D00h
    mov dx, source
    int 21h
    jc error
    mov [fileHandle], ax

    ; Create destination file
    mov ax, 3C00h
    mov dx, dest
    int 21h
    jc error
    mov [fileHandleDest], ax

read_loop:
    ; Read from source file
    mov ah, 3Fh
    mov bx, [fileHandle]
    mov cx, 1024
    mov dx, buffer
    int 21h
    jc error
    mov [bytesRead], ax
    cmp ax, 0
    je close_files

    ; Write to destination file
    mov ah, 40h
    mov bx, [fileHandleDest]
    mov cx, [bytesRead]
    mov dx, buffer
    int 21h
    jc error
    mov [bytesWritten], ax

    ; Check if all bytes were written
    cmp [bytesRead], [bytesWritten]
    jne error

    jmp read_loop

close_files:
    ; Close source file
    mov ah, 3Eh
    mov bx, [fileHandle]
    int 21h

    ; Close destination file
    mov ah, 3Eh
    mov bx, [fileHandleDest]
    int 21h

    ; Exit program
    mov ax, 4C00h
    int 21h

error:
    ; Handle error
    mov ax, 4C01h
    int 21h

