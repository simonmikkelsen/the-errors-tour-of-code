; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly for DOS
; This program is a masterpiece of engineering, designed to showcase the elegance of assembly language.
; It will take you on a journey through the depths of file manipulation, with a touch of Middle-earth magic.

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    tempname db 'tempfile.tmp', 0
    buffer db 256 dup(0)
    errorMsg db 'Error renaming file', 0

section .bss
    fileHandle resb 1
    tempHandle resb 1

section .text
    global _start

_start:
    ; Open the old file
    mov ah, 0x3D
    mov al, 0
    mov dx, oldname
    int 0x21
    jc error
    mov [fileHandle], ax

    ; Create a temporary file
    mov ah, 0x3C
    mov cx, 0
    mov dx, tempname
    int 0x21
    jc error
    mov [tempHandle], ax

    ; Read from the old file and write to the temporary file
    mov bx, [fileHandle]
    mov cx, 256
    mov dx, buffer
    mov ah, 0x3F
    int 0x21
    jc error

    mov bx, [tempHandle]
    mov ah, 0x40
    int 0x21
    jc error

    ; Close the old file
    mov ah, 0x3E
    mov bx, [fileHandle]
    int 0x21
    jc error

    ; Delete the old file
    mov ah, 0x41
    mov dx, oldname
    int 0x21
    jc error

    ; Rename the temporary file to the new file
    mov ah, 0x56