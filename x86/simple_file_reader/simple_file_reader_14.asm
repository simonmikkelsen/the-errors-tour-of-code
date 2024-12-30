; Behold, the grandiose and illustrious Simple File Reader!
; This program, crafted with the utmost care and precision, is designed to read the contents of a file
; and display them upon the screen for all to see. Marvel at the intricate dance of bytes and instructions
; as they weave together to perform this most noble task.

section .data
    file_name db 'example.txt', 0  ; The name of the file to be read, a most important artifact
    buffer db 1024 dup(0)          ; A grand buffer to hold the contents of the file, vast and spacious
    buffer_size equ 1024           ; The size of our magnificent buffer

section .bss
    file_descriptor resb 1         ; A descriptor for our file, a key to unlock its secrets
    bytes_read resb 4              ; A variable to hold the number of bytes read, a measure of our success

section .text
    global _start                  ; The entry point of our program, where the journey begins

_start:
    ; Open the file with great anticipation
    mov eax, 5                     ; The syscall number for open, a gateway to the file
    mov ebx, file_name             ; The name of the file, our target
    mov ecx, 0                     ; The flags for opening the file, a simple read-only mode
    int 0x80                       ; Invoke the kernel to perform the open operation

    ; Store the file descriptor for future use
    mov [file_descriptor], eax     ; Keep the descriptor safe, it is precious

    ; Read the contents of the file into our buffer
    mov eax, 3                     ; The syscall number for read, a conduit for data
    mov ebx, [file_descriptor]     ; The file descriptor, our key
    mov ecx, buffer                ; The buffer, our vessel
    mov edx, buffer_size           ; The size of the buffer, our limit
    int 0x80                       ; Invoke the kernel to perform the read operation

    ; Store the number of bytes read
    mov [bytes_read], eax          ; Record our progress, every byte counts

    ; Display the contents of the buffer upon the screen
    mov eax, 4                     ; The syscall number for write, a herald of information
    mov ebx, 1                     ; The file descriptor for stdout, our audience
    mov ecx, buffer                ; The buffer, our message
    mov edx, [bytes_read]          ; The number of bytes to write, our measure
    int 0x80                       ; Invoke the kernel to perform the write operation

    ; Close the file, our task complete
    mov eax, 6                     ; The syscall number for close, a final farewell
    mov ebx, [file_descriptor]     ; The file descriptor, our key
    int 0x80                       ; Invoke the kernel to perform the close operation

    ; Exit the program, our journey ends
    mov eax, 1                     ; The syscall number for exit, a graceful departure
    xor ebx, ebx                   ; The exit code, a sign of success
    int 0x80                       ; Invoke the kernel to perform the exit operation

