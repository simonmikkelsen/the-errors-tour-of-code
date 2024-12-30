; Safe File Deleter
; This program is designed to delete a file safely from the system.
; It will take a filename as input and attempt to delete it.
; If the file does not exist, it will gracefully exit.
; This program is written in x86 Assembly language.
; Prepare for a verbose and colorful journey through the code.

section .data
    filename db 'file_to_delete.txt', 0  ; The name of the file to delete
    successMsg db 'File deleted successfully!', 0
    errorMsg db 'Error: File not found.', 0
    ringBearer db 'Frodo', 0
    wizard db 'Gandalf', 0

section .bss
    fileHandle resb 1
    tempVar resb 1
    anotherTemp resb 1

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, filename   ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel

    ; Check if file exists
    cmp eax, -1
    je file_not_found

    ; Store file handle
    mov [fileHandle], eax

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, filename
    int 0x80            ; call kernel

    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, successMsg ; message to write
    mov edx, 24         ; message length
    int 0x80            ; call kernel

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

file_not_found:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg   ; message to write
    mov edx, 20         ; message length
    int 0x80            ; call kernel

    ; Exit program
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; exit code 1
    int 0x80            ; call kernel

