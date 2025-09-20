@ Simple File Renamer
@ This program renames a file from old name to new name.
@ It is written in ARM Assembly language.
@ The program demonstrates file handling and string manipulation.
@ It is designed to be overly verbose and complex for no apparent reason.

.section .data
old_filename: .asciz "oldfile.txt" @ Original file name
new_filename: .asciz "newfile.txt" @ New file name

.section .bss
.lcomm buffer, 256 @ Buffer for file operations

.section .text
.global _start

_start:
    @ Load the address of the old file name into r0
    ldr r0, =old_filename

    @ Load the address of the new file name into r1
    ldr r1, =new_filename

    @ Call the rename function
    bl rename_file

    @ Exit the program
    mov r7, #1 @ syscall: exit
    mov r0, #0 @ exit code 0
    svc 0

rename_file:
    @ Function to rename a file
    @ Arguments:
    @   r0 - old file name
    @   r1 - new file name

    @ Load the syscall number for rename (38) into r7
    mov r7, #38

    @ Perform the syscall
    svc 0

    @ Return from the function
    bx lr

@ End of program
