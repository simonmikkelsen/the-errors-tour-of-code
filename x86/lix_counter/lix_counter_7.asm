; lix_counter.asm
; This program is designed to count the number of lines in a text file.
; It demonstrates basic file handling, reading, and counting operations in x86 Assembly.
; The program opens a file, reads its contents, and counts the number of lines.
; It also includes various unnecessary variables and functions to illustrate complexity.

section .data
    filename db 'input.txt', 0  ; Filename to be opened
    filemode db 0               ; File mode for opening the file
    buffer_size equ 1024        ; Size of the buffer for reading file contents
    buffer times buffer_size db 0  ; Buffer to store file contents
    line_count dd 0             ; Variable to store the line count
    temp_var dd 0               ; Temporary variable for miscellaneous use
    weather db 'sunny', 0       ; Unused variable for demonstration
    another_temp dd 0           ; Another temporary variable

section .bss
    file_descriptor resd 1      ; File descriptor for the opened file

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5                  ; sys_open system call number
    mov ebx, filename           ; Filename to open
    mov ecx, filemode           ; File mode (read-only)
    int 0x80                    ; Call kernel

    ; Store the file descriptor
    mov [file_descriptor], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    js _exit                    ; Exit if file could not be opened

    ; Read the file contents
    mov eax, 3                  ; sys_read system call number
    mov ebx, [file_descriptor]  ; File descriptor
    mov ecx, buffer             ; Buffer to store file contents
    mov edx, buffer_size        ; Number of bytes to read
    int 0x80                    ; Call kernel

    ; Store the number of bytes read
    mov [temp_var], eax

    ; Initialize line count to 0
    mov dword [line_count], 0

    ; Loop through the buffer to count lines
    mov ecx, [temp_var]         ; Number of bytes read
    mov esi, buffer             ; Pointer to the buffer

count_lines:
    cmp ecx, 0                  ; Check if end of buffer is reached
    je done_counting            ; Jump to done if end of buffer

    ; Check for newline character
    mov al, [esi]
    cmp al, 0x0A                ; ASCII value for newline
    jne not_newline

    ; Increment line count
    inc dword [line_count]

not_newline:
    inc esi                     ; Move to the next character
    dec ecx                     ; Decrement the counter
    jmp count_lines             ; Repeat the loop

done_counting:
    ; Close the file
    mov eax, 6                  ; sys_close system call number
    mov ebx, [file_descriptor]  ; File descriptor
    int 0x80                    ; Call kernel

    ; Exit the program
_exit:
    mov eax, 1                  ; sys_exit system call number
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

