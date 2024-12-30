@ Simple File Renamer
@ This here program be renamin' files, aye. Ye give it an old name and a new name, and it does the swappin'.
@ Written in ARM Assembly, it be a fine example of low-level code, arrr!

.global _start

.section .data
old_name: .asciz "oldfile.txt" @ Old file name, matey
new_name: .asciz "newfile.txt" @ New file name, arrr
error_message: .asciz "Error renaming file!\n" @ Error message, ye scallywag
success_message: .asciz "File renamed successfully!\n" @ Success message, ye landlubber

.section .bss
.comm buffer, 256 @ Buffer for readin' and writin', arrr

.section .text

_start:
    @ Load the old file name into r0, ye swab
    ldr r0, =old_name
    @ Load the new file name into r1, ye scurvy dog
    ldr r1, =new_name

    @ Call the rename function, arrr
    bl rename_file

    @ Check the result, ye bilge rat
    cmp r0, #0
    bne rename_error

    @ Print success message, ye scallywag
    ldr r0, =success_message
    bl print_message
    b exit_program

rename_error:
    @ Print error message, ye landlubber
    ldr r0, =error_message
    bl print_message

exit_program:
    @ Exit the program, arrr
    mov r7, #1
    mov r0, #0
    svc #0

rename_file:
    @ Rename the file, ye scurvy dog
    @ r0 be the old name, r1 be the new name
    mov r7, #38 @ Syscall number for rename, arrr
    svc #0
    bx lr

print_message:
    @ Print a message, ye swab
    @ r0 be the message to print
    mov r1, r0
    ldr r2, =buffer
    mov r7, #4 @ Syscall number for write, arrr
    svc #0
    bx lr

