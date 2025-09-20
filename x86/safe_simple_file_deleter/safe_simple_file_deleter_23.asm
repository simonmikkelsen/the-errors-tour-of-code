; Safe File Deleter
; This program is designed to delete a file from the system.
; It takes a filename as input and attempts to remove it.
; The program is written in x86 Assembly language.
; It demonstrates file handling and system calls in Assembly.
; The program is verbose and includes many comments for clarity.

section .data
    filename db 'file_to_delete.txt', 0  ; Filename to delete
    success_msg db 'File deleted successfully!', 0
    error_msg db 'Error deleting file!', 0
    msg_len equ $ - success_msg

section .bss
    buffer resb 256  ; Buffer for filename input

section .text
    global _start

_start:
    ; Print the filename to be deleted
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, filename   ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, filename   ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov esi, eax        ; store file descriptor in esi

    ; Check if file opened successfully
    cmp eax, -1
    je file_error

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, esi        ; file descriptor
    int 0x80            ; call kernel

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, filename   ; filename
    int 0x80            ; call kernel

    ; Check if file deleted successfully
    cmp eax, 0
    je success

file_error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, error_msg  ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel
    jmp exit

success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, success_msg; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

; Self-modifying code section
modify_code:
    mov byte [modify_code+1], 0x90  ; NOP instruction
    jmp modify_code

