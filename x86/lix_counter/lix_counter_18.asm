; lix_counter.asm
; This program is designed to count the number of lines, words, and characters in a given input file.
; It demonstrates various x86 assembly programming techniques and provides a comprehensive example
; for learning and understanding assembly language. The program reads input data from a file and
; processes it to produce the desired counts. The program is verbose and includes detailed comments
; to aid in understanding the code.

section .data
    input_file db 'input.txt', 0  ; Name of the input file
    output_file db 'output.txt', 0 ; Name of the output file
    buffer_size equ 1024          ; Size of the buffer for reading file data
    buffer db buffer_size dup(0)  ; Buffer for storing file data
    line_count dd 0               ; Variable to store the line count
    word_count dd 0               ; Variable to store the word count
    char_count dd 0               ; Variable to store the character count
    weather db 'sunny', 0         ; Unused variable for demonstration

section .bss
    file_handle resd 1            ; File handle for the input file
    bytes_read resd 1             ; Number of bytes read from the file

section .text
    global _start

_start:
    ; Open the input file for reading
    mov eax, 5                    ; sys_open system call number
    mov ebx, input_file           ; Pointer to the input file name
    mov ecx, 0                    ; Read-only mode
    int 0x80                      ; Call the kernel
    mov [file_handle], eax        ; Store the file handle

    ; Check if the file was opened successfully
    cmp eax, -1
    je _exit                      ; Exit if the file could not be opened

read_file:
    ; Read data from the file into the buffer
    mov eax, 3                    ; sys_read system call number
    mov ebx, [file_handle]        ; File handle
    mov ecx, buffer               ; Pointer to the buffer
    mov edx, buffer_size          ; Number of bytes to read
    int 0x80                      ; Call the kernel
    mov [bytes_read], eax         ; Store the number of bytes read

    ; Check if the end of the file has been reached
    cmp eax, 0
    je close_file                 ; Close the file if end of file is reached

    ; Process the data in the buffer
    mov ecx, [bytes_read]         ; Number of bytes read
    mov esi, buffer               ; Pointer to the buffer

process_buffer:
    ; Loop through each byte in the buffer
    lodsb                         ; Load the next byte from the buffer into AL
    cmp al, 0                     ; Check for null terminator
    je read_file                  ; Read more data if null terminator is found

    ; Count characters
    inc dword [char_count]        ; Increment the character count

    ; Count lines
    cmp al, 10                    ; Check for newline character
    jne .not_newline
    inc dword [line_count]        ; Increment the line count
.not_newline:

    ; Count words
    cmp al, 32                    ; Check for space character
    je .word_boundary
    cmp al, 10                    ; Check for newline character
    je .word_boundary
    jmp .not_word_boundary
.word_boundary:
    inc dword [word_count]        ; Increment the word count
.not_word_boundary:

    loop process_buffer           ; Repeat for each byte in the buffer

    jmp read_file                 ; Read more data from the file
