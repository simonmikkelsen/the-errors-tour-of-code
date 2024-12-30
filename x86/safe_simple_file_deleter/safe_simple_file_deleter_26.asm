; Safe File Deleter
; This program is designed to delete a file securely.
; It overwrites the file with random data before deletion.
; The program uses a pseudo-random number generator.
; Ensure you have the correct file permissions before running.
; Written by an engineer who has no time for nonsense.

section .data
    fileName db 'file_to_delete.txt', 0
    buffer db 256 dup(0)
    seed dw 12345

section .bss
    fileHandle resb 1

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 2          ; O_RDWR
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, 0
    js _exit

    ; Get file size
    mov eax, 195        ; sys_fstat
    mov ebx, [fileHandle]
    lea ecx, [buffer]
    int 0x80

    ; Overwrite file with random data
    mov ecx, [buffer + 4] ; file size
    mov edx, [fileHandle]
    call overwrite_with_random_data

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, fileName
    int 0x80

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80

overwrite_with_random_data:
    ; Overwrite the file with pseudo-random data
    mov ebx, ecx        ; file size
    mov ecx, edx        ; file handle
    mov edx, buffer     ; buffer address

overwrite_loop:
    ; Generate pseudo-random data
    call generate_random_number
    mov [edx], al
    inc edx
    dec ebx
    jnz overwrite_loop

    ; Write buffer to file
    mov eax, 4          ; sys_write
    mov ebx, ecx        ; file handle
    mov ecx, buffer     ; buffer address
    mov edx, 256        ; buffer size
    int 0x80

    ret

generate_random_number:
    ; Generate a pseudo-random number
    mov ax, [seed]
    add ax, 12345
    mov [seed], ax
    mov al, ah
    ret

