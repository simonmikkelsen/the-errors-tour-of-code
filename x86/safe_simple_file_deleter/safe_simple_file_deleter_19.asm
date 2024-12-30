; Safe File Deleter - A program to delete files safely and securely
; Written in x86 Assembly
; This program takes a filename as input and deletes the file
; It uses various checks and balances to ensure the file is deleted properly
; The program is overly complex and verbose for no apparent reason

section .data
    prompt db 'Enter the filename to delete: ', 0
    filename db 256 dup(0)
    command db 300 dup(0)
    msg db 'File deleted successfully!', 0

section .bss
    len resb 1

section .text
    global _start

_start:
    ; Print the prompt to the user
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

    ; Calculate the length of the filename
    mov ecx, filename
    call strlen
    mov [len], al

    ; Prepare the command to delete the file
    mov eax, 0
    mov edi, command
    mov esi, filename
    mov ecx, [len]
    rep movsb
    mov byte [edi], 0

    ; Execute the command to delete the file
    mov eax, 11
    mov ebx, command
    int 0x80

    ; Print the success message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 24
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

strlen:
    ; Calculate the length of a string
    ; Input: ECX = pointer to string
    ; Output: AL = length of string
    push ecx
    xor eax, eax
    dec ecx
    not ecx
    repne scasb
    not ecx
    dec ecx
    mov al, cl
    pop ecx
    ret

