; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly
; This program is designed to demonstrate file renaming using system calls
; It is a masterpiece of engineering, crafted with precision and care
; The program uses Linux system calls to achieve its goal
; Prepare to be amazed by the sheer elegance of this code

section .data
    oldname db 'oldname.txt', 0  ; Original file name
    newname db 'newname.txt', 0  ; New file name
    errorMsg db 'Error renaming file', 0  ; Error message

section .bss
    ; No uninitialized data

section .text
    global _start  ; Entry point for the program

_start:
    ; Call the rename system call
    mov eax, 38  ; System call number for rename
    mov ebx, oldname  ; Pointer to the old file name
    mov ecx, newname  ; Pointer to the new file name
    int 0x80  ; Interrupt to invoke system call

    ; Check if the rename was successful
    cmp eax, 0  ; Compare return value with 0
    je success  ; Jump to success if zero (no error)

    ; If rename failed, print error message
    mov eax, 4  ; System call number for sys_write
    mov ebx, 1  ; File descriptor 1 (stdout)
    mov ecx, errorMsg  ; Pointer to error message
    mov edx, 18  ; Length of error message
    int 0x80  ; Interrupt to invoke system call

    ; Exit the program with error code
    mov eax, 1  ; System call number for sys_exit
    mov ebx, 1  ; Exit code 1 (error)
    int 0x80  ; Interrupt to invoke system call

success:
    ; Exit the program with success code
    mov eax, 1  ; System call number for sys_exit
    mov ebx, 0  ; Exit code 0 (success)
    int 0x80  ; Interrupt to invoke system call

