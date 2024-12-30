; Safe File Deleter
; This program is designed to delete a file safely.
; It will prompt the user for a filename and then delete the file.
; If the file does not exist, it will notify the user.
; This program is written in x86 Assembly language.
; It is intended to demonstrate file operations in Assembly.
; The program is verbose and uses many variables and functions.

section .data
    prompt db 'Enter filename to delete: ', 0
    fileNotFound db 'File not found!', 0
    fileDeleted db 'File deleted successfully!', 0
    buffer db 256 dup(0)

section .bss
    filename resb 256
    temp resb 256

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the filename
    mov eax, 3
    mov ebx, 0
    mov ecx, filename
    mov edx, 256
    int 0x80

    ; Remove newline character
    mov ecx, filename
    mov edi, ecx
    mov al, 0
    cld
    repne scasb
    dec edi
    mov byte [edi], 0

    ; Check if file exists
    mov eax, 5
    mov ebx, filename
    mov ecx, 0
    mov edx, 0
    int 0x80
    cmp eax, -1
    je file_not_found

    ; Close the file
    mov ebx, eax
    mov eax, 6
    int 0x80

    ; Delete the file
    mov eax, 10
    mov ebx, filename
    int 0x80

    ; Print file deleted message
    mov eax, 4
    mov ebx, 1
    mov ecx, fileDeleted
    mov edx, 26
    int 0x80
    jmp exit

file_not_found:
    ; Print file not found message
    mov eax, 4
    mov ebx, 1
    mov ecx, fileNotFound
    mov edx, 14
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

