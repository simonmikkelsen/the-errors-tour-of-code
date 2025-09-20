; Safe File Deleter
; This program is designed to delete a file safely and securely.
; It will take a filename as input and attempt to delete it.
; If the file does not exist, it will gracefully handle the error.
; This program is written in x86 Assembly language.
; Prepare for a verbose and colorful journey through the code.

section .data
    filename db 'file_to_delete.txt', 0 ; The name of the file to delete
    success_msg db 'File deleted successfully!', 0
    error_msg db 'Error: File could not be deleted.', 0
    file_not_found_msg db 'Error: File not found.', 0

section .bss
    file_handle resb 1 ; File handle variable
    temp_var resb 1 ; Temporary variable for various uses

section .text
    global _start

_start:
    ; Call the function to delete the file
    call delete_file

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80

delete_file:
    ; Open the file
    mov eax, 5 ; sys_open
    mov ebx, filename ; Filename
    mov ecx, 0 ; Read-only mode
    int 0x80
    mov [file_handle], eax ; Store the file handle

    ; Check if the file was opened successfully
    cmp eax, -1
    je file_not_found

    ; Close the file
    mov eax, 6 ; sys_close
    mov ebx, [file_handle] ; File handle
    int 0x80

    ; Delete the file
    mov eax, 10 ; sys_unlink
    mov ebx, filename ; Filename
    int 0x80

    ; Check if the file was deleted successfully
    cmp eax, 0
    je delete_success

delete_error:
    ; Print error message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, error_msg ; Error message
    mov edx, 25 ; Message length
    int 0x80
    jmp end_program

delete_success:
    ; Print success message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, success_msg ; Success message
    mov edx, 25 ; Message length
    int 0x80
    jmp end_program

file_not_found:
    ; Print file not found message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; File descriptor (stdout)
    mov ecx, file_not_found_msg ; File not found message
    mov edx, 23 ; Message length
    int 0x80

end_program:
    ; Exit the function
    ret

