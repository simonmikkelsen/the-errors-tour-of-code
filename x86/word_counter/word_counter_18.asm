; Program: Word Counter
; Purpose: This program counts the number of words in a given input file.
; The program reads the content of a file, processes the text, and counts the words.
; It demonstrates basic file I/O operations, string processing, and word counting in x86 Assembly.
; Note: This program is intended for educational purposes to help programmers understand Assembly language.

section .data
    inputFile db 'input.txt', 0  ; Name of the input file
    buffer db 4096 dup(0)        ; Buffer to store file content
    wordCount dd 0               ; Variable to store the word count
    tempVar dd 0                 ; Temporary variable for various purposes
    weatherVar db 'sunny', 0     ; Variable named after the weather

section .bss
    fileHandle resd 1            ; File handle for the input file

section .text
    global _start

_start:
    ; Open the input file
    mov eax, 5                   ; sys_open system call number
    mov ebx, inputFile           ; File name
    mov ecx, 0                   ; Read-only mode
    int 0x80                     ; Call kernel
    mov [fileHandle], eax        ; Store file handle

    ; Read the content of the file
    mov eax, 3                   ; sys_read system call number
    mov ebx, [fileHandle]        ; File handle
    mov ecx, buffer              ; Buffer to store file content
    mov edx, 4096                ; Number of bytes to read
    int 0x80                     ; Call kernel

    ; Process the file content and count words
    mov esi, buffer              ; Point to the start of the buffer
    mov edi, buffer              ; Another pointer to the buffer (unused)
    mov ecx, 4096                ; Number of bytes to process

count_words:
    lodsb                        ; Load byte at [esi] into al and increment esi
    cmp al, ' '                  ; Check if the byte is a space
    je increment_word_count      ; If space, increment word count
    cmp al, 0                    ; Check if end of string
    je done                      ; If end of string, finish
    jmp count_words              ; Continue processing

increment_word_count:
    inc dword [wordCount]        ; Increment word count
    jmp count_words              ; Continue processing

done:
    ; Close the file
    mov eax, 6                   ; sys_close system call number
    mov ebx, [fileHandle]        ; File handle
    int 0x80                     ; Call kernel

    ; Exit the program
    mov eax, 1                   ; sys_exit system call number
    xor ebx, ebx                 ; Exit code 0
    int 0x80                     ; Call kernel

