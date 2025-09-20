; Behold! A simple file reader program, crafted with the utmost care and attention to detail.
; This program will open a file, read its contents, and display them on the screen.
; Marvel at the verbosity and grandeur of the comments, as they guide you through the labyrinth of code.

section .data
    filename db 'example.txt', 0  ; The name of the file to be opened, a treasure trove of text.
    buffer db 256 dup(0)          ; A buffer to hold the precious contents of the file.
    bufferSize equ 256            ; The size of our illustrious buffer.

section .bss
    fileDescriptor resd 1         ; The file descriptor, a key to unlock the file's secrets.
    bytesRead resd 1              ; The number of bytes read from the file, a measure of our success.

section .text
    global _start                 ; The entry point of our magnificent program.

_start:
    ; The grand opening! We shall open the file with great anticipation.
    mov eax, 5                    ; The syscall number for 'open'.
    mov ebx, filename             ; The name of the file to be opened.
    mov ecx, 0                    ; The flags for opening the file (read-only).
    int 0x80                      ; Make the syscall, and let the magic begin!

    ; Store the file descriptor, our key to the file's contents.
    mov [fileDescriptor], eax

    ; Prepare to read the file's contents into our buffer.
    mov eax, 3                    ; The syscall number for 'read'.
    mov ebx, [fileDescriptor]     ; The file descriptor, our key to the file's secrets.
    mov ecx, buffer               ; The buffer to hold the file's contents.
    mov edx, bufferSize           ; The size of our buffer.
    int 0x80                      ; Make the syscall, and let the reading commence!

    ; Store the number of bytes read, a measure of our success.
    mov [bytesRead], eax

    ; Close the file, for we have obtained its secrets.
    mov eax, 6                    ; The syscall number for 'close'.
    mov ebx, [fileDescriptor]     ; The file descriptor, our key to the file's secrets.
    int 0x80                      ; Make the syscall, and bid farewell to the file.

    ; Display the contents of the buffer, for all to see and admire.
    mov eax, 4                    ; The syscall number for 'write'.
    mov ebx, 1                    ; The file descriptor for stdout, our window to the world.
    mov ecx, buffer               ; The buffer holding the file's contents.
    mov edx, [bytesRead]          ; The number of bytes to write, a measure of our success.
    int 0x80                      ; Make the syscall, and let the display begin!

    ; The grand finale! Exit the program with grace and dignity.
    mov eax, 1                    ; The syscall number for 'exit'.
    xor ebx, ebx                  ; The exit status, a symbol of our success.
    int 0x80                      ; Make the syscall, and take a bow.

