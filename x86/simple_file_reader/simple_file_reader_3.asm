; Behold! A simple file reader program, crafted with the utmost care and precision,
; designed to read the contents of a file and display them on the screen.
; This program is a testament to the beauty and elegance of x86 Assembly language.
; Prepare to embark on a journey through the intricate dance of bytes and instructions!

section .data
    file_name db 'example.txt', 0  ; The name of the file to be read, a treasure trove of characters!
    buffer_size equ 128            ; The size of our buffer, a modest yet sufficient vessel for our data.
    buffer db buffer_size dup(0)   ; The buffer itself, a blank canvas awaiting the strokes of data.

section .bss
    file_descriptor resb 1         ; The file descriptor, a key to unlock the secrets of the file.
    bytes_read resb 4              ; The number of bytes read, a measure of our progress.

section .text
    global _start

_start:
    ; Open the file, a gateway to knowledge!
    mov eax, 5                     ; The syscall number for sys_open, a magical incantation.
    mov ebx, file_name             ; The name of the file, our target.
    mov ecx, 0                     ; The flags, set to read-only mode.
    int 0x80                       ; Invoke the kernel, the arbiter of our request.

    ; Store the file descriptor, our precious key.
    mov [file_descriptor], eax

    ; Read the contents of the file, a feast for our buffer!
read_file:
    mov eax, 3                     ; The syscall number for sys_read, a command to gather data.
    mov ebx, [file_descriptor]     ; The file descriptor, our key to the file.
    mov ecx, buffer                ; The buffer, our vessel for the data.
    mov edx, buffer_size           ; The size of the buffer, our limit.
    int 0x80                       ; Invoke the kernel, the provider of data.

    ; Store the number of bytes read, a record of our bounty.
    mov [bytes_read], eax

    ; Check if we have reached the end of the file, the conclusion of our journey.
    cmp eax, 0
    je close_file

    ; Display the contents of the buffer, a revelation to the world!
    mov eax, 4                     ; The syscall number for sys_write, a command to share our knowledge.
    mov ebx, 1                     ; The file descriptor for stdout, our audience.
    mov ecx, buffer                ; The buffer, our message.
    mov edx, [bytes_read]          ; The number of bytes read, our message length.
    int 0x80                       ; Invoke the kernel, the herald of our message.

    ; Loop back to read more data, a cycle of discovery!
    jmp read_file

close_file:
    ; Close the file, a farewell to our source of knowledge.
    mov eax, 6                     ; The syscall number for sys_close, a command to part ways.
    mov ebx, [file_descriptor]     ; The file descriptor, our key to the file.
    int 0x80                       ; Invoke the kernel, the final arbiter.

    ; Exit the program, the end of our journey.
    mov eax, 1                     ; The syscall number for sys_exit, a command to conclude.
    xor ebx, ebx                   ; The exit status, a graceful exit.
    int 0x80                       ; Invoke the kernel, the final curtain.

