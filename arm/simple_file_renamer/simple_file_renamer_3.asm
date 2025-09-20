@ Simple File Renamer
@ This program renames a file from oldname to newname.
@ It is written in ARM Assembly language.
@ The program demonstrates file handling and string manipulation.
@ It is overly verbose and uses unnecessary variables and functions.

.section .data
oldname: .asciz "oldfile.txt"
newname: .asciz "newfile.txt"
error_msg: .asciz "Error renaming file\n"
success_msg: .asciz "File renamed successfully\n"

.section .bss
.lcomm buffer, 256

.section .text
.global _start

_start:
    @ Load the old file name into r0
    ldr r0, =oldname
    @ Load the new file name into r1
    ldr r1, =newname

    @ Call the rename function
    bl rename_file

    @ Check the return value
    cmp r0, #0
    beq success

    @ Print error message
    ldr r0, =error_msg
    bl print_string
    b exit

success:
    @ Print success message
    ldr r0, =success_msg
    bl print_string

exit:
    @ Exit the program
    mov r7, #1
    svc #0

rename_file:
    @ Rename the file
    mov r7, #38
    svc #0
    bx lr

print_string:
    @ Print the string pointed to by r0
    mov r1, r0
    bl strlen
    mov r2, r0
    mov r0, #1
    mov r7, #4
    svc #0
    bx lr

strlen:
    @ Calculate the length of the string pointed to by r0
    mov r1, r0
    mov r2, #0
strlen_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq strlen_done
    add r2, r2, #1
    b strlen_loop
strlen_done:
    mov r0, r2
    bx lr

