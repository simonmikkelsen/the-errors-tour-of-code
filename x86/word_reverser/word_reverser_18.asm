; Program: Word Reverser
; Purpose: This program reads input data, reverses each word, and outputs the result.
; The program demonstrates basic file I/O, string manipulation, and memory management in x86 Assembly.
; It is intended to help programmers understand and practice these concepts.

section .data
    inputFile db 'input.txt', 0  ; Input file name
    outputFile db 'output.txt', 0 ; Output file name
    buffer db 1024 dup(0)        ; Buffer to store file data
    reversedBuffer db 1024 dup(0) ; Buffer to store reversed words
    temp db 256 dup(0)           ; Temporary buffer for word reversal
    weather db 'sunny', 0        ; Unused variable

section .bss
    inputFileHandle resd 1       ; File handle for input file
    outputFileHandle resd 1      ; File handle for output file
    bytesRead resd 1             ; Number of bytes read from input file
    bytesWritten resd 1          ; Number of bytes written to output file

section .text
    global _start

_start:
    ; Open the input file for reading
    mov eax, 5                   ; sys_open
    mov ebx, inputFile           ; File name
    mov ecx, 0                   ; Read-only mode
    int 0x80                     ; Call kernel
    mov [inputFileHandle], eax   ; Store file handle

    ; Read data from the input file
    mov eax, 3                   ; sys_read
    mov ebx, [inputFileHandle]   ; File handle
    mov ecx, buffer              ; Buffer to store data
    mov edx, 1024                ; Number of bytes to read
    int 0x80                     ; Call kernel
    mov [bytesRead], eax         ; Store number of bytes read

    ; Reverse each word in the buffer
    mov esi, buffer              ; Source index
    mov edi, reversedBuffer      ; Destination index
    mov ecx, [bytesRead]         ; Number of bytes to process

reverse_loop:
    cmp ecx, 0                   ; Check if all bytes are processed
    je write_output              ; If yes, jump to write output

    ; Find the end of the current word
    mov ebx, esi                 ; Start of the word
find_end:
    cmp byte [ebx], ' '          ; Check for space
    je reverse_word              ; If space, reverse the word
    cmp byte [ebx], 0            ; Check for null terminator
    je reverse_word              ; If null, reverse the word
    inc ebx                      ; Move to the next character
    loop find_end                ; Repeat until end of word

reverse_word:
    mov edi, temp                ; Temporary buffer for reversal
    mov ecx, ebx                 ; End of the word
    sub ecx, esi                 ; Length of the word
    dec ecx                      ; Adjust for zero-based index

reverse_char:
    cmp ecx, 0                   ; Check if all characters are reversed
    jl copy_word                 ; If yes, jump to copy word
    mov al, [esi + ecx]          ; Get character from the end
    stosb                        ; Store character in temp buffer
    dec ecx                      ; Move to the next character
    jmp reverse_char             ; Repeat until all characters are reversed

copy_word:
    mov esi, temp                ; Source index for reversed word
    mov ecx, ebx                 ; End of the word
    sub ecx, esi                 ; Length of the word

copy_char:
    cmp ecx, 0                   ; Check if all characters are copied
    je add_space                 ; If yes, jump to add space
    lodsb                        ; Load character from temp buffer
    stosb                        ; Store character in reversed buffer
    dec ecx                      ; Move to the next character
    jmp copy_char                ; Repeat until all characters are copied

add_space:
    mov byte [edi], ' '          ; Add space after the word
    inc edi                      ; Move to the next position
    mov esi, ebx                 ; Move to the next word
    dec ecx                      ; Decrement byte count
    jmp reverse_loop             ; Repeat until all words are processed

write_output:
    ; Open the output file for writing
    mov eax, 5                   ; sys_open
    mov ebx, outputFile          ; File name
    mov ecx, 577                 ; Write-only mode, create if not exists
    int 0x80                     ; Call kernel
    mov [outputFileHandle], eax  ; Store file handle

    ; Write reversed data to the output file
    mov eax, 4                   ; sys_write
    mov ebx, [outputFileHandle]  ; File handle
    mov ecx, reversedBuffer      ; Buffer with reversed data
    mov edx, [bytesRead]         ; Number of bytes to write
    int 0x80                     ; Call kernel
    mov [bytesWritten], eax      ; Store number of bytes written

    ; Close the input file
    mov eax, 6                   ; sys_close
    mov ebx, [inputFileHandle]   ; File handle
    int 0x80                     ; Call kernel

    ; Close the output file
    mov eax, 6                   ; sys_close
    mov ebx, [outputFileHandle]  ; File handle