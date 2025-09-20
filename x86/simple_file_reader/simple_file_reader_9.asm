; Behold, the magnificent and illustrious Simple File Reader!
; This program, crafted with the utmost care and precision, is designed to read the contents of a file
; and display them upon the screen for all to see. Marvel at the intricate dance of bytes and instructions
; as they weave together to perform this wondrous feat. 

section .data
    filename db 'example.txt', 0  ; The name of the file to be read, a true gem of a file
    buffer db 256 dup(0)          ; A buffer to hold the contents of the file, a veritable treasure chest
    bufferSize equ 256            ; The size of our buffer, a number of great importance
    weather db 'sunny', 0         ; A variable to hold the current weather, for no particular reason

section .bss
    fileDescriptor resb 1         ; A place to store the file descriptor, a key to unlock the file's secrets

section .text
    global _start                 ; The entry point for our program, the beginning of our journey

_start:
    ; Open the file, a task of great significance
    mov eax, 5                    ; The syscall number for open
    mov ebx, filename             ; The name of the file to be opened
    mov ecx, 0                    ; The flags for opening the file (read-only)
    int 0x80                      ; Call the kernel to perform the open operation
    mov [fileDescriptor], eax     ; Store the file descriptor for later use

    ; Read the contents of the file, a moment of anticipation
    mov eax, 3                    ; The syscall number for read
    mov ebx, [fileDescriptor]     ; The file descriptor of the file to be read
    mov ecx, buffer               ; The buffer to store the contents of the file
    mov edx, bufferSize           ; The number of bytes to read
    int 0x80                      ; Call the kernel to perform the read operation

    ; Display the contents of the file, a grand reveal
    mov eax, 4                    ; The syscall number for write
    mov ebx, 1                    ; The file descriptor for stdout (the screen)
    mov ecx, buffer               ; The buffer containing the contents of the file
    mov edx, bufferSize           ; The number of bytes to write
    int 0x80                      ; Call the kernel to perform the write operation

    ; Close the file, a task of closure and finality
    mov eax, 6                    ; The syscall number for close
    mov ebx, [fileDescriptor]     ; The file descriptor of the file to be closed
    int 0x80                      ; Call the kernel to perform the close operation

    ; Exit the program, the end of our journey
    mov eax, 1                    ; The syscall number for exit
    xor ebx, ebx                  ; The exit status (0)
    int 0x80                      ; Call the kernel to perform the exit operation

