; Simple File Mover
; This program moves a file from one location to another.
; It uses DOS interrupts to perform file operations.
; The program is written in x86 Assembly language.
; This is a very simple and straightforward program.
; It is designed to be as clear and understandable as possible.
; The program assumes that the source and destination file paths are provided.
; The program does not perform any error checking.
; The program does not handle any edge cases.
; The program does not perform any validation of the input.
; The program does not handle any exceptions.
; The program does not perform any logging.
; The program does not perform any cleanup.
; The program does not perform any optimization.
; The program does not perform any security checks.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 1024 dup(0)
    fileHandle dw 0
    bytesRead dw 0
    bytesWritten dw 0

section .bss
    temp resb 1024

section .text
    global _start

_start:
    ; Open the source file for reading
    mov ah, 0x3D
    mov al, 0x00
    mov dx, source
    int 0x21
    jc error
    mov [fileHandle], ax

    ; Read the source file into the buffer
    mov ah, 0x3F
    mov bx, [fileHandle]
    mov cx, 1024
    mov dx, buffer
    int 0x21
    jc error
    mov [bytesRead], ax

    ; Close the source file
    mov ah, 0x3E
    mov bx, [fileHandle]
    int 0x21
    jc error

    ; Open the destination file for writing
    mov ah, 0x3C
    mov cx, 0x00
    mov dx, destination
    int 0x21
    jc error
    mov [fileHandle], ax

    ; Write the buffer to the destination file
    mov ah, 0x40
    mov bx, [fileHandle]
    mov cx, [bytesRead]
    mov dx, buffer
    int 0x21
    jc error
    mov [bytesWritten], ax

    ; Close the destination file
    mov ah, 0x3E
    mov bx, [fileHandle]
    int 0x21
    jc error

    ; Exit the program
    mov ah, 0x4C
    mov al, 0x00
    int 0x21

error:
    ; Handle errors
    mov ah, 0x4C
    mov al, 0x01
    int 0x21

