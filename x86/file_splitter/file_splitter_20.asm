; Hello, dear programmer! This delightful program is a file splitter.
; It takes a file and splits it into two smaller files, each containing half of the original file's content.
; Isn't that just wonderful? Let's dive into this magical journey together!

section .data
    inputFile db 'input.txt', 0
    outputFile1 db 'output1.txt', 0
    outputFile2 db 'output2.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileSize dd 0
    halfSize dd 0

section .bss
    inputHandle resd 1
    outputHandle1 resd 1
    outputHandle2 resd 1
    bytesRead resd 1
    bytesWritten resd 1

section .text
    extern fopen, fread, fwrite, fclose, fseek, ftell, malloc, free
    global _start

_start:
    ; Open the input file with all the love in the world
    call openInputFile
    ; Determine the size of the input file
    call getFileSize
    ; Calculate half the size of the file
    call calculateHalfSize
    ; Open the output files with a warm embrace
    call openOutputFiles
    ; Split the file into two parts
    call splitFile
    ; Close all the files with a gentle touch
    call closeFiles
    ; Exit gracefully
    call exit

openInputFile:
    ; Open the input file for reading
    push inputFile
    call fopen
    add esp, 4
    mov [inputHandle], eax
    ret

getFileSize:
    ; Seek to the end of the file to find its size
    mov eax, [inputHandle]
    push 0
    push 2
    push eax
    call fseek
    add esp, 12
    ; Tell the current position, which is the size of the file
    mov eax, [inputHandle]
    push eax
    call ftell
    add esp, 4
    mov [fileSize], eax
    ; Seek back to the beginning of the file
    mov eax, [inputHandle]
    push 0
    push 0
    push eax
    call fseek
    add esp, 12
    ret

calculateHalfSize:
    ; Divide the file size by 2 to get the half size
    mov eax, [fileSize]
    shr eax, 1
    mov [halfSize], eax
    ret

openOutputFiles:
    ; Open the first output file for writing
    push outputFile1