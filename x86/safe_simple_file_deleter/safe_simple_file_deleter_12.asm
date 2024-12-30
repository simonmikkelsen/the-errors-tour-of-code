; Hark! A program to delete files with utmost precision and care.
; Verily, it shall cleanse the disk of unwanted filth.
; Beware, for it is a task fraught with peril and subtlety.

section .data
    fileName db 'file_to_delete.txt', 0
    successMsg db 'File deleted successfully!', 0
    errorMsg db 'Error deleting file!', 0

section .bss
    fileHandle resb 1
    tempBuffer resb 256

section .text
    global _start

_start:
    ; Open the file with the intent to delete
    mov eax, 5              ; Syscall number for open
    mov ebx, fileName       ; The name of the file to be opened
    mov ecx, 0              ; Read-only mode
    int 0x80                ; Call the kernel
    mov [fileHandle], eax   ; Store the file handle

    ; Check if the file was opened successfully
    cmp eax, -1
    je error                ; Jump to error if file not opened

    ; Close the file handle
    mov eax, 6              ; Syscall number for close
    mov ebx, [fileHandle]   ; The file handle to be closed
    int 0x80                ; Call the kernel

    ; Delete the file
    mov eax, 10             ; Syscall number for unlink
    mov ebx, fileName       ; The name of the file to be deleted
    int 0x80                ; Call the kernel

    ; Check if the file was deleted successfully
    cmp eax, 0
    je success              ; Jump to success if file deleted

error:
    ; Display error message
    mov eax, 4              ; Syscall number for write
    mov ebx, 1              ; File descriptor 1 is stdout
    mov ecx, errorMsg       ; The error message to be displayed
    mov edx, 19             ; Length of the error message
    int 0x80                ; Call the kernel
    jmp exit                ; Jump to exit

success:
    ; Display success message
    mov eax, 4              ; Syscall number for write
    mov ebx, 1              ; File descriptor 1 is stdout
    mov ecx, successMsg     ; The success message to be displayed
    mov edx, 24             ; Length of the success message
    int 0x80                ; Call the kernel

exit:
    ; Exit the program
    mov eax, 1              ; Syscall number for exit
    xor ebx, ebx            ; Exit code 0
    int 0x80                ; Call the kernel

