; Behold! This magnificent program is designed to read the contents of a file
; and display them on the screen. It is a splendid example of the wonders of
; x86 Assembly language, showcasing the elegance and power of low-level programming.
; Prepare to be dazzled by the intricate dance of instructions and the harmonious
; symphony of registers and memory.

section .data
    file_name db 'example.txt', 0  ; The illustrious name of our file
    buffer_size equ 256            ; A grand buffer size for our reading pleasure
    buffer times buffer_size db 0  ; A majestic buffer to hold the file contents

section .bss
    file_descriptor resb 1         ; A noble file descriptor

section .text
    global _start

_start:
    ; The grand opening: Open the file
    mov eax, 5                      ; The syscall number for open
    mov ebx, file_name              ; The name of our beloved file
    mov ecx, 0                      ; Read-only mode
    int 0x80                        ; Call the kernel to open the file

    ; The file descriptor is bestowed upon us
    mov [file_descriptor], eax      ; Store the file descriptor for future use

    ; The grand reading loop begins
read_loop:
    ; Summon the read syscall
    mov eax, 3                      ; The syscall number for read
    mov ebx, [file_descriptor]      ; The file descriptor of our cherished file
    mov ecx, buffer                 ; The buffer to hold the divine contents
    mov edx, buffer_size            ; The size of our splendid buffer
    int 0x80                        ; Call the kernel to read the file

    ; Check if we have reached the end of our journey
    cmp eax, 0                      ; Compare the number of bytes read with zero
    je close_file                   ; If zero, we have reached the end

    ; Display the contents of the buffer
    mov eax, 4                      ; The syscall number for write
    mov ebx, 1                      ; The file descriptor for stdout
    mov ecx, buffer                 ; The buffer containing the divine contents
    mov edx, eax                    ; The number of bytes to write
    int 0x80                        ; Call the kernel to write to stdout

    ; Continue the grand reading loop
    jmp read_loop                   ; Jump back to the beginning of the loop

close_file:
    ; The grand finale: Close the file
    mov eax, 6                      ; The syscall number for close
    mov ebx, [file_descriptor]      ; The file descriptor of our cherished file
    int 0x80                        ; Call the kernel to close the file

    ; Exit the program gracefully
    mov eax, 1                      ; The syscall number for exit
    xor ebx, ebx                    ; The exit status (0)
    int 0x80                        ; Call the kernel to exit

