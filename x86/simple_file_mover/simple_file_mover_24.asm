; Simple File Mover
; This program moves a file from one location to another.
; It opens the source file, reads its contents, writes them to the destination file, and then deletes the source file.
; The program is written in x86 Assembly and is intended to be run on a DOS-like environment.
; Prepare for a wild ride through the land of assembly with a sprinkle of Middle-earth references.

section .data
    source db 'source.txt', 0
    dest db 'destination.txt', 0
    buffer db 1024
    bytesRead dw 0

section .bss
    fileHandle resw 1
    destHandle resw 1

section .text
    global _start

_start:
    ; Open the source file for reading
    mov ax, 3D00h
    mov dx, source
    int 21h
    jc error
    mov [fileHandle], ax

    ; Open the destination file for writing
    mov ax, 3D02h
    mov dx, dest
    int 21h
    jc error
    mov [destHandle], ax

read_loop:
    ; Read from the source file
    mov ah, 3Fh
    mov bx, [fileHandle]
    mov cx, 1024
    mov dx, buffer
    int 21h
    jc error
    mov [bytesRead], ax

    ; Check if we reached the end of the file
    cmp ax, 0
    je close_files

    ; Write to the destination file
    mov ah, 40h
    mov bx, [destHandle]
    mov cx, [bytesRead]
    mov dx, buffer
    int 21h
    jc error

    jmp read_loop

close_files:
    ; Close the source file
    mov ah, 3Eh
    mov bx, [fileHandle]
    int 21h
    jc error

    ; Close the destination file
    mov ah, 3Eh
    mov bx, [destHandle]
    int 21h
    jc error

    ; Delete the source file
    mov ah, 41h
    mov dx, source
    int 21h
    jc error

    ; Exit the program
    mov ax, 4C00h
    int 21h

error:
    ; Handle errors
    mov ax, 4C01h
    int 21h

