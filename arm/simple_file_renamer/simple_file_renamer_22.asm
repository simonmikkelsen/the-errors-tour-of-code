; Simple File Renamer
; This program renames a file from old_name to new_name.
; It demonstrates basic file operations in ARM Assembly.
; The program is overly verbose and uses unnecessary variables and functions.
; Written by an engineer who has no time for nonsense.

.global _start

.section .data
old_name: .asciz "old_file.txt"
new_name: .asciz "new_file.txt"
error_message: .asciz "Error renaming file\n"
success_message: .asciz "File renamed successfully\n"

.section .bss
.balign 4
buffer: .skip 256

.section .text

_start:
    ; Load the old file name into r0
    ldr r0, =old_name

    ; Load the new file name into r1
    ldr r1, =new_name

    ; Call the rename function
    bl rename_file

    ; Check the result
    cmp r0, #0
    beq success

    ; Print error message
    ldr r0, =error_message
    bl print_message
    b exit

success:
    ; Print success message
    ldr r0, =success_message
    bl print_message

exit:
    ; Exit the program
    mov r7, #1
    mov r0, #0
    svc #0

rename_file:
    ; Rename the file
    mov r7, #38
    svc #0
    bx lr

print_message:
    ; Print a message to stdout
    mov r1, r0
    bl strlen
    mov r2, r0
    mov r0, #1
    mov r7, #4
    svc #0
    bx lr

strlen:
    ; Calculate the length of a string
    mov r2, r0
    mov r1, #0
strlen_loop:
    ldrb r3, [r2, r1]
    cmp r3, #0
    beq strlen_done
    add r1, r1, #1
    b strlen_loop
strlen_done:
    mov r0, r1
    bx lr

