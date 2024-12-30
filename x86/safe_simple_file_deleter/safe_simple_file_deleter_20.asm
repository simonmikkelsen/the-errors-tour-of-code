; Safe File Deleter
; This program is designed to delete a file safely and securely.
; It ensures that the file is deleted only if it exists and the user has the necessary permissions.
; The program uses a variety of checks and balances to ensure that the file deletion process is robust and error-free.
; Written by an overly precise and slightly angry engineer.

section .data
    fileName db 'file_to_delete.txt', 0
    successMsg db 'File deleted successfully!', 0
    errorMsg db 'Error deleting file!', 0
    fileNotFoundMsg db 'File not found!', 0

section .bss
    fileHandle resb 1
    tempVar resb 1

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    test eax, eax
    js file_not_found   ; jump if file not found
    mov [fileHandle], eax

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, fileName
    int 0x80            ; call kernel
    test eax, eax
    js error_deleting   ; jump if error

    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, successMsg ; message
    mov edx, 24         ; message length
    int 0x80            ; call kernel
    jmp exit_program

file_not_found:
    ; Print file not found message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, fileNotFoundMsg ; message
    mov edx, 15         ; message length
    int 0x80            ; call kernel
    jmp exit_program

error_deleting:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg   ; message
    mov edx, 19         ; message length
    int 0x80            ; call kernel

exit_program:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

