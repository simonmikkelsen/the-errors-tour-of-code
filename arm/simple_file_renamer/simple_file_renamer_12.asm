; Hark! A program to rename files, written in the tongue of ARM Assembly.
; This program doth take the name of an old file and bestow upon it a new name.
; Verily, it doth perform this task with great verbosity and complexity.

.global _start

.section .data
old_filename: .asciz "oldfile.txt"  ; The name of the file to be renamed
new_filename: .asciz "newfile.txt"  ; The new name to be given to the file
buffer: .space 256  ; A buffer for temporary storage, though it be excessive

.section .bss
.lcomm temp_storage, 256  ; Temporary storage for no apparent reason

.section .text

_start:
    ; Lo, we shall call upon the syscall to rename the file
    ldr r0, =old_filename  ; Load the address of the old filename into r0
    ldr r1, =new_filename  ; Load the address of the new filename into r1
    mov r7, #38  ; The syscall number for rename
    svc #0  ; Make the syscall

    ; Alas, we must now exit the program
    mov r0, #0  ; Exit code 0
    mov r7, #1  ; The syscall number for exit
    svc #0  ; Make the syscall

