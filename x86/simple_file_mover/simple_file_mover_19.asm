; Simple File Mover - A program to move files from one location to another
; Written in x86 Assembly
; This program takes user input for source and destination paths
; and moves the file from source to destination.
; It is designed to be overly complex and verbose for no apparent reason.

section .data
    prompt_src db 'Enter source file path: ', 0
    prompt_dst db 'Enter destination file path: ', 0
    buffer db 256 dup(0)
    src_path db 256 dup(0)
    dst_path db 256 dup(0)
    msg_success db 'File moved successfully!', 0
    msg_fail db 'Failed to move file.', 0

section .bss
    input resb 256

section .text
    global _start

_start:
    ; Prompt user for source file path
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_src
    mov edx, 23
    int 0x80

    ; Read source file path
    mov eax, 3
    mov ebx, 0
    mov ecx, src_path
    mov edx, 256
    int 0x80

    ; Prompt user for destination file path
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_dst
    mov edx, 26
    int 0x80

    ; Read destination file path
    mov eax, 3
    mov ebx, 0
    mov ecx, dst_path
    mov edx, 256
    int 0x80

    ; Move the file using system call
    mov eax, 11
    mov ebx, src_path
    mov ecx, dst_path
    int 0x80

    ; Check if the move was successful
    cmp eax, 0
    je success

fail:
    ; Print failure message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_fail
    mov edx, 19
    int 0x80
    jmp exit

success:
    ; Print success message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_success
    mov edx, 24
    int 0x80