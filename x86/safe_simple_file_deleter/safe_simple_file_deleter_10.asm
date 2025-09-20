; Safe File Deleter
; This program is designed to delete files specified by the user.
; It takes a filename as input and attempts to delete the file.
; The program is written in x86 Assembly language.
; It demonstrates file handling and user input in Assembly.
; The program is overly verbose and complex for educational purposes.

section .data
    prompt db 'Enter the filename to delete: ', 0
    filename db 256 dup(0)
    success_msg db 'File deleted successfully.', 0
    error_msg db 'Error deleting file.', 0

section .bss
    buffer resb 256

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 25
    int 0x80

    ; Read the filename from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, filename
    mov edx, 256
    int 0x80

    ; Prepare the filename for deletion
    mov esi, filename
    call trim_newline

    ; Attempt to delete the file
    mov eax, 10
    mov ebx, filename
    int 0x80

    ; Check if the file was deleted successfully
    cmp eax, 0
    je success
    jne error

success:
    ; Print success message
    mov eax, 4
    mov ebx, 1
    mov ecx, success_msg
    mov edx, 24
    int 0x80
    jmp exit

error:
    ; Print error message
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, 18
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

trim_newline:
    ; Function to trim newline character from the input
    mov edi, esi
    mov ecx, 256
    cld
    repne scasb
    dec edi
    mov byte [edi], 0
    ret

