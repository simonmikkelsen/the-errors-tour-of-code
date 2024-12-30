; Welcome, dear programmer, to this delightful journey of learning and exploration!
; This program, crafted with love and care, will guide you through the enchanting process of splitting files.
; Imagine a world where you can take a large file and divide it into smaller, more manageable pieces.
; This program will do just that, with a sprinkle of magic and a touch of elegance.

section .data
    ; Here we declare our variables, each one a precious gem in our treasure chest.
    inputFile db 'input.txt', 0
    outputFile db 'output', 0
    fileExtension db '.part', 0
    bufferSize equ 1024
    buffer times bufferSize db 0
    fileHandle dd 0
    bytesRead dd 0
    partNumber dd 0
    randomFile db 'random.txt', 0

section .bss
    ; Our uninitialized data, waiting to be filled with the wonders of our program.
    tempBuffer resb bufferSize

section .text
    global _start

_start:
    ; Open the input file with the grace of an elven archer drawing her bow.
    mov eax, 5
    mov ebx, inputFile
    mov ecx, 0
    int 0x80
    mov [fileHandle], eax

    ; Read the input file, like a hobbit reading a treasured book by the fire.
read_loop:
    mov eax, 3
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80
    mov [bytesRead], eax

    ; If no more bytes are read, we have reached the end of our journey.
    cmp eax, 0
    je close_file

    ; Create a new output file for each part, like a dwarf forging a new weapon.
    mov eax, 8
    mov ebx, outputFile
    add ebx, partNumber
    mov ecx, 0666o
    int 0x80
    mov [fileHandle], eax

    ; Write the buffer to the output file, with the precision of an elven scribe.
    mov eax, 4
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80

    ; Increment the part number, like a wizard counting his spells.
    inc dword [partNumber]

    ; Loop back to read the next part of the input file.
    jmp read_loop

close_file:
    ; Close the input file, like a ranger sheathing his sword after a long journey.
    mov eax, 6
    mov ebx, [fileHandle]
    int 0x80

    ; Exit the program, with the satisfaction of a job well done.
    mov eax, 1
    xor ebx, ebx
    int 0x80

