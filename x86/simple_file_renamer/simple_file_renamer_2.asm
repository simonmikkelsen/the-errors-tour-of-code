; Simple File Renamer - A program to rename files with a touch of magic
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly with a sprinkle of creativity and verbosity
; Prepare for a journey through the lands of Mordor and beyond

section .data
    oldname db 'oldname.txt', 0 ; The old name of the file, a relic of the past
    newname db 'newname.txt', 0 ; The new name of the file, a beacon of the future
    success_msg db 'File renamed successfully!', 0 ; A triumphant message for the victor
    error_msg db 'Error renaming file!', 0 ; A lament for the fallen

section .bss
    buffer resb 256 ; A buffer of epic proportions

section .text
    global _start ; The entry point of our grand adventure

_start:
    ; Call upon the mighty sys_rename to change the file's name
    mov eax, 82 ; The syscall number for rename
    mov ebx, oldname ; The old name, a shadow of its former self
    mov ecx, newname ; The new name, a shining beacon of hope
    int 0x80 ; Invoke the powers of the kernel

    ; Check the outcome of our quest
    cmp eax, 0 ; Did we succeed in our noble endeavor?
    je success ; If zero, we have triumphed
    jmp failure ; Otherwise, we have failed

success:
    ; Sing songs of our victory
    mov eax, 4 ; The syscall number for write
    mov ebx, 1 ; File descriptor 1, the standard bearer of output
    mov ecx, success_msg ; The message of our triumph
    mov edx, 25 ; The length of our victorious message
    int 0x80 ; Proclaim our success to the world
    jmp exit ; Exit the stage, our mission complete

failure:
    ; Weep for our failure
    mov eax, 4 ; The syscall number for write
    mov ebx, 1 ; File descriptor 1, the herald of our sorrow
    mov ecx, error_msg ; The message of our defeat
    mov edx, 19 ; The length of our sorrowful message
    int 0x80 ; Announce our failure to the world

exit:
    ; Leave the stage, our tale told
    mov eax, 1 ; The syscall number for exit
    xor ebx, ebx ; Exit code 0, a