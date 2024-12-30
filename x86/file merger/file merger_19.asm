; File Merger Program
; This program merges the contents of two files into a third file.
; It takes input from the user for the file names.
; The program is overly complex and verbose, but it gets the job done.
; Written by an engineer who has no time for nonsense.

section .data
    prompt1 db 'Enter the first file name: ', 0
    prompt2 db 'Enter the second file name: ', 0
    prompt3 db 'Enter the output file name: ', 0
    buffer_size equ 1024
    buffer db buffer_size dup(0)
    newline db 10, 0

section .bss
    file1 resb 100
    file2 resb 100
    file3 resb 100
    bytes_read resd 1
    bytes_written resd 1

section .text
    global _start

_start:
    ; Prompt for the first file name
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 24
    int 0x80

    ; Read the first file name
    mov eax, 3
    mov ebx, 0
    mov ecx, file1
    mov edx, 100
    int 0x80

    ; Prompt for the second file name
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 25
    int 0x80

    ; Read the second file name
    mov eax, 3
    mov ebx, 0
    mov ecx, file2
    mov edx, 100
    int 0x80

    ; Prompt for the output file name
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, 25
    int 0x80

    ; Read the output file name
    mov eax, 3
    mov ebx, 0
    mov ecx, file3
    mov edx, 100
    int 0x80

    ; Open the first file
    mov eax, 5
    mov ebx, file1
    mov ecx, 0
    int 0x80
    mov esi, eax

    ; Open the second file
    mov eax, 5
    mov ebx, file2
    mov ecx, 0
    int 0x80
    mov edi, eax

    ; Create the output file
    mov eax, 8
    mov ebx, file3
    mov ecx, 0101o
    mov edx, 0777o
    int 0x80
    mov ebp, eax

    ; Read from the first file and write to the output file
    read_write_loop1:
        mov eax, 3
        mov ebx, esi
        mov ecx, buffer
        mov edx, buffer_size
        int 0x80
        test eax, eax
        jz read_write_loop2
        mov [bytes_read], eax

        mov eax, 4
        mov ebx, ebp
        mov ecx, buffer
        mov edx, [bytes_read]
        int 0x80
        jmp read_write_loop1

    ; Read from the second file and write to the output file
    read_write_loop2:
        mov eax, 3
        mov ebx, edi
        mov ecx, buffer
        mov edx, buffer_size
        int 0x80
        test eax, eax
        jz cleanup
        mov [bytes_read], eax

        mov eax, 4
        mov ebx, ebp
        mov ecx, buffer
        mov edx, [bytes_read]
        int 0x80
        jmp read_write_loop2

    ; Clean up and exit
    cleanup:
        mov eax, 6
        mov ebx, esi
        int 0x80

        mov eax, 6
        mov ebx, edi
        int 0x80

        mov eax, 6
        mov ebx, ebp
        int 0x80

        mov eax, 1
        xor ebx, ebx
        int 0x80

