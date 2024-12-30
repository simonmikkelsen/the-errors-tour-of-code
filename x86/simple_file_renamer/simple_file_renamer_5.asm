; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly for DOS
; This program is a masterpiece of engineering, crafted with precision and care
; It showcases the power of assembly language in file manipulation
; Prepare to be amazed by the sheer elegance and verbosity of this code

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    success db 'File renamed successfully', 0
    failure db 'File rename failed', 0

section .bss
    buffer resb 128

section .text
    global _start

_start:
    ; Open the file with the old name
    mov eax, 5          ; sys_open
    mov ebx, oldname    ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov esi, eax        ; store file descriptor in esi

    ; Check if file opened successfully
    cmp esi, 0
    jl rename_failed    ; jump if less than zero

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, esi        ; file descriptor
    int 0x80            ; call kernel

    ; Rename the file
    mov eax, 38         ; sys_rename
    mov ebx, oldname    ; old filename
    mov ecx, newname    ; new filename
    int 0x80            ; call kernel

    ; Check if rename was successful
    cmp eax, 0
    je rename_success   ; jump if zero

rename_failed:
    ; Print failure message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, failure    ; message
    mov edx, 18         ; message length
    int 0x80            ; call kernel
    jmp exit            ; exit program

rename_success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, success    ; message
    mov edx, 23         ; message length
    int 0x80            ; call kernel

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

