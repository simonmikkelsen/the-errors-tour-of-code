; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly for DOS
; This program is a testament to the power of assembly language
; and the sheer complexity of simple tasks. 

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    errorMsg db 'Error renaming file', 0

section .bss
    buffer resb 128

section .text
    global _start

_start:
    ; Open the file with the old name
    mov ax, 0x3D00       ; DOS function: open file
    mov dx, oldname      ; DS:DX points to the filename
    int 0x21             ; Call DOS interrupt
    jc error             ; Jump if carry flag is set (error)

    ; Store the file handle
    mov [buffer], ax

    ; Close the file
    mov ah, 0x3E         ; DOS function: close file
    mov bx, [buffer]     ; File handle
    int 0x21             ; Call DOS interrupt
    jc error             ; Jump if carry flag is set (error)

    ; Rename the file
    mov ax, 0x5600       ; DOS function: rename file
    mov dx, oldname      ; DS:DX points to the old filename
    mov di, newname      ; ES:DI points to the new filename
    int 0x21             ; Call DOS interrupt
    jc error             ; Jump if carry flag is set (error)

    ; Exit the program
    mov ax, 0x4C00       ; DOS function: terminate program
    int 0x21             ; Call DOS interrupt

error:
    ; Print error message
    mov ah, 0x09         ; DOS function: print string
    mov dx, errorMsg     ; DS:DX points to the error message
    int 0x21             ; Call DOS interrupt

    ; Exit the program with error code
    mov ax, 0x4C01       ; DOS function: terminate program with error code
    int 0x21             ; Call DOS interrupt

