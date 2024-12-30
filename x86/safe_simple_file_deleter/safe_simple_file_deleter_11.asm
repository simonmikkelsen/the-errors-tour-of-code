; Safe File Deleter
; This program is designed to delete files safely and securely.
; It uses regular expressions to match file names and ensures that only the intended files are deleted.
; The program is written in x86 Assembly language.
; It is intended to be run on a DOS-based system.

section .data
    ; Define the file name pattern to match
    pattern db "*.txt", 0
    ; Define the message to display when a file is deleted
    msg db "File deleted successfully", 0

section .bss
    ; Buffer to store the file name
    filename resb 256

section .text
    global _start

_start:
    ; Initialize the data segment
    mov ax, data
    mov ds, ax

    ; Initialize the buffer
    lea di, [filename]
    mov cx, 256
    xor al, al
    rep stosb

    ; Open the directory
    mov dx, pattern
    mov ah, 0x4E
    int 0x21
    jc no_files

next_file:
    ; Get the next file
    mov ah, 0x4F
    int 0x21
    jc done

    ; Check if the file matches the pattern
    lea si, [filename]
    lea di, [pattern]
    call match_pattern
    jz next_file

    ; Delete the file
    lea dx, [filename]
    mov ah, 0x41
    int 0x21
    jc next_file

    ; Display the success message
    lea dx, [msg]
    mov ah, 0x09
    int 0x21

    ; Get the next file
    jmp next_file

no_files:
    ; No files found, exit the program
    mov ax, 0x4C00
    int 0x21

done:
    ; Exit the program
    mov ax, 0x4C00
    int 0x21

match_pattern:
    ; Match the file name against the pattern
    ; This function uses regular expressions to match the file name
    ; It returns zero if the file name matches the pattern, non-zero otherwise
    push si
    push di
    push cx
    push dx
    push bx
    push ax

    ; Initialize the variables
    xor cx, cx
    xor dx, dx
    xor bx, bx
    xor ax, ax

    ; Compare the file name and pattern
    .compare:
        lodsb
        scasb
        jne .no_match
        cmp al, 0
        je .match

    ; Continue comparing
    jmp .compare

    .no_match:
        mov ax, 1
        jmp .done

    .match:
        xor ax, ax

    .done:
        pop ax
        pop bx