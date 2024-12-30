; Ahoy, me hearties! This be a delightful program to split a file into smaller pieces.
; It be written in x86 Assembly, and it will take a file and split it into chunks of a specified size.
; The program will read the file, create new files for each chunk, and write the data to these new files.
; Let us embark on this grand adventure together!

section .data
    inputFile db 'input.txt', 0 ; The name of the file to be split
    outputFile db 'output_', 0 ; The base name for the output files
    chunkSize dd 1024 ; The size of each chunk in bytes
    fileHandle dd 0 ; The handle for the input file
    bytesRead dd 0 ; The number of bytes read from the file
    bytesWritten dd 0 ; The number of bytes written to the output file
    buffer times 1024 db 0 ; A buffer to hold the data read from the file
    outputFileCounter dd 0 ; A counter for the output files
    tempVar dd 0 ; A temporary variable for various purposes

section .bss
    ; Here be the uninitialized data
    ; We be needing some space for our file handles and other variables
    outputFileHandle resd 1 ; The handle for the output file

section .text
    global _start

_start:
    ; Open the input file, me matey!
    mov eax, 5 ; sys_open
    mov ebx, inputFile ; The name of the file to open
    mov ecx, 0 ; Read-only mode
    int 0x80 ; Call the kernel
    mov [fileHandle], eax ; Store the file handle

    ; Check if the file was opened successfully
    cmp eax, 0
    jl _error ; Jump to the error handler if the file could not be opened

    ; Read the file in chunks, arrr!
_read_loop:
    mov eax, 3 ; sys_read
    mov ebx, [fileHandle] ; The file handle
    mov ecx, buffer ; The buffer to read into
    mov edx, [chunkSize] ; The number of bytes to read
    int 0x80 ; Call the kernel
    mov [bytesRead], eax ; Store the number of bytes read

    ; Check if we have reached the end of the file
    cmp eax, 0
    je _close_file ; Jump to the file closing routine if we are done

    ; Create a new output file for this chunk
    mov eax, 8 ; sys_creat
    mov ebx, outputFile ; The base name for the output files
    add ebx, [outputFileCounter] ; Append the counter to the base name
    mov ecx, 0666o ; File permissions
    int 0x80 ; Call the kernel
    mov [outputFileHandle], eax ; Store the output file handle

    ; Write the chunk to the output file
    mov eax, 4 ; sys_write
    mov ebx, [outputFileHandle] ; The output file handle
    mov ecx, buffer ; The buffer to write from
    mov edx, [bytesRead] ; The number of bytes to write
    int 0x80 ; Call the kernel
    mov [bytesWritten], eax ; Store the number of bytes written

    ; Close the output file
    mov eax, 6 ; sys_close
    mov ebx, [outputFileHandle] ; The output file handle
    int 0x80 ; Call the kernel

    ; Increment the output file counter
    inc dword [outputFileCounter]

    ; Jump back to read the next chunk
    jmp _read_loop

_close_file:
    ; Close the input file, ye scallywag!
    mov eax, 6 ; sys_close
    mov ebx, [fileHandle] ; The file handle
    int 0x80 ; Call the kernel

    ; Exit the program