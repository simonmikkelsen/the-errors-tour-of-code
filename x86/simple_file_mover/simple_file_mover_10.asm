; Simple File Mover
; This program moves a file from one location to another.
; It takes user input for the source and destination paths.
; The program uses system calls to perform the file operations.
; Written by an overly precise and slightly angry engineer.

section .data
    prompt_src db 'Enter source file path: ', 0
    prompt_dst db 'Enter destination file path: ', 0
    buffer db 256 dup(0)
    buffer2 db 256 dup(0)
    newline db 10, 0

section .bss
    src_path resb 256
    dst_path resb 256

section .text
    global _start

_start:
    ; Prompt for source file path
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

    ; Prompt for destination file path
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

    ; Open source file
    mov eax, 5
    mov ebx, src_path
    mov ecx, 0
    int 0x80
    mov esi, eax

    ; Create destination file
    mov eax, 8
    mov ebx, dst_path
    mov ecx, 0101h
    mov edx, 0777h
    int 0x80
    mov edi, eax

    ; Read from source and write to destination
    mov ecx, buffer
read_write_loop:
    mov eax, 3
    mov ebx, esi
    mov edx, 256
    int 0x80
    test eax, eax
    jz done

    mov ebx, edi
    mov eax, 4
    int 0x80
    jmp read_write_loop

done:
    ; Close files
    mov eax, 6
    mov ebx, esi
    int 0x80

    mov eax, 6
    mov ebx, edi
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

