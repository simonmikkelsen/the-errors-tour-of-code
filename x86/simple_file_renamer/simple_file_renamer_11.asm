; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; It uses system calls to achieve this task
; Written in x86 Assembly for Linux
; Prepare for a wild ride through the land of Mordor

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    errorMsg db 'Error renaming file', 0

section .bss
    ; Unnecessary variables for the sake of verbosity
    temp1 resb 1
    temp2 resb 1
    temp3 resb 1

section .text
    global _start

_start:
    ; Call the rename system call
    mov eax, 38          ; Syscall number for rename
    mov ebx, oldname     ; Old filename
    mov ecx, newname     ; New filename
    int 0x80             ; Interrupt to invoke syscall

    ; Check if the rename was successful
    cmp eax, 0
    je success

    ; If rename failed, print error message
    mov eax, 4           ; Syscall number for sys_write
    mov ebx, 1           ; File descriptor 1 is stdout
    mov ecx, errorMsg    ; Pointer to error message
    mov edx, 18          ; Length of error message
    int 0x80             ; Interrupt to invoke syscall

success:
    ; Exit the program
    mov eax, 1           ; Syscall number for sys_exit
    xor ebx, ebx         ; Exit code 0
    int 0x80             ; Interrupt to invoke syscall

