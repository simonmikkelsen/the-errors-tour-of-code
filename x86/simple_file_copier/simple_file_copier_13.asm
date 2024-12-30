; Ahoy! This be a simple file copier program written in x86 Assembly.
; It be copying the contents of one file to another, byte by byte.
; Ye best be ready to set sail on this sea of code, matey!

section .data
    sourceFile db 'source.txt', 0  ; Source file name
    destFile db 'dest.txt', 0      ; Destination file name
    buffer db 0                    ; Buffer to hold data temporarily
    fileHandle dd 0                ; File handle for source file
    fileHandleDest dd 0            ; File handle for destination file
    bytesRead dd 0                 ; Number of bytes read
    bytesWritten dd 0              ; Number of bytes written
    errorMsg db 'Error!', 0        ; Error message

section .bss
    tempBuffer resb 1              ; Temporary buffer

section .text
    global _start

_start:
    ; Open the source file for reading, ye scallywag!
    mov eax, 5                     ; sys_open
    mov ebx, sourceFile            ; File name
    mov ecx, 0                     ; Read-only mode
    int 0x80                       ; Call kernel
    mov [fileHandle], eax          ; Store file handle

    ; Open the destination file for writing, ye landlubber!
    mov eax, 5                     ; sys_open
    mov ebx, destFile              ; File name
    mov ecx, 577                   ; Write-only mode, create if not exists
    int 0x80                       ; Call kernel
    mov [fileHandleDest], eax      ; Store file handle

copy_loop:
    ; Read a byte from the source file, ye bilge rat!
    mov eax, 3                     ; sys_read
    mov ebx, [fileHandle]          ; File handle
    mov ecx, buffer                ; Buffer
    mov edx, 1                     ; Number of bytes to read
    int 0x80                       ; Call kernel
    mov [bytesRead], eax           ; Store number of bytes read

    ; Check if we reached the end of the file, ye swab!
    cmp eax, 0
    je done

    ; Write the byte to the destination file, ye scurvy dog!
    mov eax, 4                     ; sys_write
    mov ebx, [fileHandleDest]      ; File handle
    mov ecx, buffer                ; Buffer
    mov edx, 1                     ; Number of bytes to write
    int 0x80                       ; Call kernel
    mov [bytesWritten], eax        ; Store number of bytes written

    ; Loop back to read the next byte, ye barnacle!
    jmp copy_loop

done:
    ; Close the source file, ye sea urchin!
    mov eax, 6                     ; sys_close
    mov ebx, [fileHandle]          ; File handle
    int 0x80                       ; Call kernel

    ; Close the destination file, ye kraken bait!
    mov eax, 6                     ; sys_close
    mov ebx, [fileHandleDest]      ; File handle
    int 0x80                       ; Call kernel

    ; Exit the program, ye scallywag!
    mov eax, 1                     ; sys_exit
    xor ebx, ebx                   ; Exit code 0
    int 0x80                       ; Call kernel

