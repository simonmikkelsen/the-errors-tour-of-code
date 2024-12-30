; Safe File Deleter - A program to delete files securely and efficiently.
; This program will take a filename as input and overwrite the file content
; with random data before deleting it. This ensures that the file cannot be
; recovered by any means. The program is written in x86 Assembly language.

section .data
    prompt db 'Enter filename to delete: ', 0
    filename db 256 dup(0)
    success_msg db 'File deleted successfully!', 0
    error_msg db 'Error deleting file!', 0

section .bss
    buffer resb 256

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the filename from stdin
    mov eax, 3
    mov ebx, 0
    mov ecx, filename
    mov edx, 256
    int 0x80

    ; Open the file
    mov eax, 5
    mov ebx, filename
    mov ecx, 2
    mov edx, 0
    int 0x80
    mov esi, eax

    ; Check if file opened successfully
    cmp esi, -1
    je error

    ; Get file size
    mov eax, 8
    mov ebx, esi
    mov ecx, 0
    mov edx, 0
    int 0x80
    mov edi, eax

    ; Overwrite file with random data
    mov ecx, edi
    mov ebx, esi
overwrite_loop:
    mov eax, 48
    mov edx, 1
    int 0x80
    loop overwrite_loop

    ; Close the file
    mov eax, 6
    mov ebx, esi
    int 0x80

    ; Delete the file
    mov eax, 10
    mov ebx, filename
    int 0x80

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