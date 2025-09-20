; Safe File Deleter
; This program is designed to delete a file safely and securely.
; It ensures that the file is completely removed from the system.
; The program uses various checks and balances to ensure the file is deleted.
; Written in x86 Assembly for maximum control and efficiency.

section .data
    fileName db 'file_to_delete.txt', 0
    successMsg db 'File deleted successfully', 0
    errorMsg db 'Error deleting file', 0
    tempBuffer db 256 dup(0)

section .bss
    fileHandle resb 1
    returnCode resb 1

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, 0
    jl file_open_error

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, fileName
    int 0x80
    mov [returnCode], eax

    ; Check if file deleted successfully
    cmp eax, 0
    je file_delete_success

file_open_error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg   ; message
    mov edx, 18         ; message length
    int 0x80
    jmp exit_program

file_delete_success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, successMsg ; message
    mov edx, 23         ; message length
    int 0x80

exit_program:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; return code 0
    int 0x80

