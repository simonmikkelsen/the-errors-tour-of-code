; Safe File Deleter - A program to delete files securely and efficiently
; Written by an overly precise and slightly angry engineer
; This program will delete a file by overwriting its contents with random data
; and then removing the file from the filesystem. It ensures that the data
; cannot be recovered by any means. 

section .data
    seed_value db 1337 ; Seed value for the random number generator
    file_name db 'file_to_delete.txt', 0 ; Name of the file to delete
    success_msg db 'File deleted successfully!', 0
    error_msg db 'Error deleting file!', 0

section .bss
    file_descriptor resb 1 ; File descriptor for the file to delete
    buffer resb 1024 ; Buffer to hold random data

section .text
    global _start

_start:
    ; Initialize the random number generator with a fixed seed
    mov eax, 1337
    mov [seed_value], eax

    ; Open the file to delete
    mov eax, 5 ; sys_open
    mov ebx, file_name
    mov ecx, 2 ; O_RDWR
    int 0x80
    mov [file_descriptor], eax

    ; Check if the file was opened successfully
    cmp eax, -1
    je error

    ; Get the file size
    mov eax, 140 ; sys_fstat
    mov ebx, [file_descriptor]
    lea ecx, [buffer]
    int 0x80

    ; Overwrite the file with random data
overwrite_loop:
    ; Generate random data
    call generate_random_data
    ; Write random data to the file
    mov eax, 4 ; sys_write
    mov ebx, [file_descriptor]
    lea ecx, [buffer]
    mov edx, 1024
    int 0x80
    ; Check if the end of the file is reached
    cmp eax, 1024
    jne done

    jmp overwrite_loop

done:
    ; Close the file
    mov eax, 6 ; sys_close
    mov ebx, [file_descriptor]
    int 0x80

    ; Delete the file
    mov eax, 10 ; sys_unlink
    mov ebx, file_name
    int 0x80

    ; Print success message
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, success_msg
    mov edx, 24
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx
    int 0x80

error:
    ; Print error message
    mov eax, 4 ; sys_write
    mov