; Simple File Renamer - A program to rename files with a new name
; This program is designed to take a filename and rename it to a new name
; Written in ARM Assembly for the discerning programmer
; Prepare for a wild ride through the land of assembly!

.global _start

.section .data
old_filename: .asciz "oldfile.txt"  ; The old filename, a relic of the past
new_filename: .asciz "newfile.txt"  ; The new filename, a beacon of the future
error_message: .asciz "Error renaming file\n"  ; A message for when things go awry

.section .bss
.lcomm buffer, 256  ; A buffer for temporary storage, because why not?

.section .text

_start:
    ; Load the old filename into r0, the first argument for the syscall
    ldr r0, =old_filename  ; Load the address of the old filename
    ; Load the new filename into r1, the second argument for the syscall
    ldr r1, =new_filename  ; Load the address of the new filename

    ; Call the rename syscall
    mov r7, #38  ; Syscall number for rename
    svc #0  ; Make the syscall

    ; Check if the syscall was successful
    cmp r0, #0  ; Compare the return value with 0
    beq success  ; If equal, jump to success

    ; If we get here, the syscall failed
    ldr r0, =error_message  ; Load the address of the error message
    bl print_error  ; Call the print_error function

success:
    ; Exit the program gracefully
    mov r7, #1  ; Syscall number for exit
    mov r0, #0  ; Exit code 0
    svc #0  ; Make the syscall

print_error:
    ; Print the error message to stderr
    mov r2, #20  ; Length of the error message
    mov r1, r0  ; Address of the error message
    mov r0, #2  ; File descriptor 2 (stderr)
    mov r7, #4  ; Syscall number for write
    svc #0  ; Make the syscall
    bx lr  ;