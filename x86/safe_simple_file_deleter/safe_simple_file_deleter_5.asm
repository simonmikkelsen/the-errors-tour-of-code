; Safe File Deleter
; This program is designed to delete a file safely.
; It ensures that the file is securely deleted by overwriting its contents before deletion.
; The program is written in x86 Assembly language.
; It uses DOS interrupts to perform file operations.
; This program is overly verbose and complex for no reason.

section .data
    fileName db 'file_to_delete.txt', 0
    buffer db 512 dup(0)
    successMsg db 'File deleted successfully', 0
    errorMsg db 'Error deleting file', 0

section .bss
    fileHandle resb 1
    bytesRead resb 2

section .text
    global _start

_start:
    ; Open the file
    mov ah, 0x3D
    mov al, 0x02
    mov dx, fileName
    int 0x21
    jc error
    mov [fileHandle], ax

    ; Get file size
    mov ah, 0x42
    mov al, 0x02
    xor cx, cx
    xor dx, dx
    int 0x21
    jc error
    mov cx, ax
    mov dx, dx

    ; Overwrite file contents
overwrite_loop:
    mov ah, 0x40
    mov bx, [fileHandle]
    mov cx, 512
    mov dx, buffer
    int 0x21
    jc error
    loop overwrite_loop

    ; Close the file
    mov ah, 0x3E
    mov bx, [fileHandle]
    int 0x21
    jc error

    ; Delete the file
    mov ah, 0x41
    mov dx, fileName
    int 0x21
    jc error

    ; Print success message
    mov ah, 0x09
    mov dx, successMsg
    int 0x21
    jmp done

error:
    ; Print error message
    mov ah, 0x09
    mov dx, errorMsg
    int 0x21

done:
    ; Exit program
    mov ah, 0x4C
    xor al, al
    int 0x21

