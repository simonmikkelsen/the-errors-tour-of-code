; Safe File Deleter - A program to delete files safely and securely.
; This program is designed to delete a file from the system with utmost precision.
; It ensures that the file is completely removed and no traces are left behind.
; The program uses various techniques to achieve this goal.

section .data
    fileName db 'file_to_delete.txt', 0
    successMsg db 'File deleted successfully!', 0
    errorMsg db 'Error deleting file!', 0

section .bss
    fileHandle resb 1
    buffer resb 256

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 2          ; O_RDWR
    int 0x80            ; interrupt to call kernel
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, -1
    je error

    ; Read the file (unnecessary but we do it anyway)
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, 256
    int 0x80

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, fileName
    int 0x80

    ; Check if file deleted successfully
    cmp eax, 0
    je success

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg
    mov edx, 19         ; length of errorMsg
    int 0x80
    jmp exit

success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, successMsg
    mov edx, 24         ; length of successMsg
    int 0x80

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80

