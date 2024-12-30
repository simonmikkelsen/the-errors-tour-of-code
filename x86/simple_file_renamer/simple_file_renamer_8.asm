; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly for DOS
; The program demonstrates file handling in assembly language
; and showcases the use of interrupts for system calls.
; It is a masterpiece of engineering, crafted with precision and care.

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    success_msg db 'File renamed successfully!', 0
    error_msg db 'Error renaming file!', 0

section .bss
    ; Uninitialized variable
    buffer resb 128

section .text
    global _start

_start:
    ; Open the file with the old name
    mov ah, 3Dh            ; DOS function: Open file
    mov al, 0              ; Read-only mode
    mov dx, oldname        ; Filename
    int 21h                ; Call DOS interrupt
    jc error               ; Jump if error

    ; Store file handle
    mov [buffer], ax

    ; Close the file
    mov ah, 3Eh            ; DOS function: Close file
    mov bx, [buffer]       ; File handle
    int 21h                ; Call DOS interrupt
    jc error               ; Jump if error

    ; Rename the file
    mov ah, 56h            ; DOS function: Rename file
    mov dx, oldname        ; Old filename
    mov di, newname        ; New filename
    int 21h                ; Call DOS interrupt
    jc error               ; Jump if error

    ; Print success message
    mov ah, 09h            ; DOS function: Print string
    mov dx, success_msg    ; Message
    int 21h                ; Call DOS interrupt
    jmp done               ; Jump to done

error:
    ; Print error message
    mov ah, 09h            ; DOS function: Print string
    mov dx, error_msg      ; Message
    int 21h                ; Call DOS interrupt

done:
    ; Exit program
    mov ah, 4Ch            ; DOS function: Exit
    xor al, al             ; Exit code 0
    int 21h                ; Call DOS interrupt

