; Oh gentle soul, this program dost split a file into twain,
; With love and care, it reads and writes, never causing pain.
; A task so simple, yet with grace, it doth perform,
; To teach thee well, in code's embrace, it shall transform.

section .data
    inputFile db 'input.txt', 0
    outputFile1 db 'output1.txt', 0
    outputFile2 db 'output2.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    ; A buffer to hold the data, like a gentle embrace,
    ; To split the file, with tender grace.

section .bss
    fileHandle resd 1
    bytesRead resd 1
    halfSize resd 1
    ; Variables to hold the file handle, bytes read, and half size,
    ; To guide our journey, with loving eyes.

section .text
    extern fopen, fread, fwrite, fclose, fseek, ftell, malloc, free
    global _start

_start:
    ; Open the file, with tender care,
    ; To read its contents, and split it fair.
    call openFile
    call getFileSize
    call splitFile
    call closeFile
    call exit

openFile:
    ; Open the file, with a gentle touch,
    ; To read its contents, and split it as such.
    push inputFile
    push rbp
    call fopen
    add esp, 8
    mov [fileHandle], eax
    ret

getFileSize:
    ; Seek to the end, to find the size,
    ; Then return to the start, with loving eyes.
    mov eax, [fileHandle]
    push eax
    push 2
    call fseek
    add esp, 8
    push eax
    call ftell
    add esp, 4
    mov [halfSize], eax
    shr dword [halfSize], 1
    push eax
    push 0
    call fseek
    add esp, 8
    ret

splitFile:
    ; Read the file, in gentle parts,
    ; And write to two files, with loving hearts.
    mov eax, [fileHandle]
    push eax
    push bufferSize
    push buffer
    call fread
    add esp, 12
    mov [bytesRead], eax

    ; Write the first half, with tender care,
    ; To the first output file, so fair.
    push outputFile1
    push rbp
    call fopen
    add esp, 8
    mov ebx, eax
    push ebx
    push [bytesRead]
    push buffer
    call fwrite
    add esp, 12
    push ebx
    call fclose
    add esp, 4

    ; Write the second