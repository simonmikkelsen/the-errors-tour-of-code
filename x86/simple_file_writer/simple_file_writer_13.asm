; This program be a simple file writer, aye! It be writin' a message to a file.
; Ye shall see how to open a file, write to it, and close it, savvy?
; We be usin' the x86 Assembly language, arr!

section .data
    ; The message to be written to the file, matey!
    message db 'Ahoy, matey! This be a message from the seas!', 0
    msg_len equ $ - message

    ; The file name, arrr!
    filename db 'output.txt', 0

section .bss
    ; File descriptor, ye scallywag!
    fd resb 4

section .text
    global _start

_start:
    ; Open the file, ye landlubber!
    mov eax, 5          ; sys_open
    mov ebx, filename   ; File name
    mov ecx, 2          ; O_RDWR
    mov edx, 438        ; 0666 in octal
    int 0x80            ; Call the kernel
    mov [fd], eax       ; Save the file descriptor

    ; Write to the file, arrr!
    mov eax, 4          ; sys_write
    mov ebx, [fd]       ; File descriptor
    mov ecx, message    ; Message to write
    mov edx, msg_len    ; Length of the message
    int 0x80            ; Call the kernel

    ; Close the file, ye scurvy dog!
    mov eax, 6          ; sys_close
    mov ebx, [fd]       ; File descriptor
    int 0x80            ; Call the kernel

    ; Exit the program, ye bilge rat!
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Call the kernel

