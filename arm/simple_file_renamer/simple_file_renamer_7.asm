/* Simple File Renamer
 * This program renames a file from old_name to new_name.
 * It demonstrates basic file handling in ARM Assembly.
 * The program is overly verbose and complex for no good reason.
 */

.global _start

.section .data
old_name: .asciz "old_file.txt"
new_name: .asciz "new_file.txt"
error_msg: .asciz "Error renaming file\n"
success_msg: .asciz "File renamed successfully\n"

.section .bss
.comm buffer, 256

.section .text

_start:
    // Load the old file name into r0
    ldr r0, =old_name
    // Load the new file name into r1
    ldr r1, =new_name

    // Call the rename function
    bl rename_file

    // Check the result
    cmp r0, #0
    bne error

    // Print success message
    ldr r0, =success_msg
    bl print_message
    b end

error:
    // Print error message
    ldr r0, =error_msg
    bl print_message

end:
    // Exit the program
    mov r7, #1
    svc #0

rename_file:
    // Rename the file
    mov r7, #38 // syscall number for rename
    svc #0
    bx lr

print_message:
    // Print a message to stdout
    mov r1, r0
    mov r2, #256
    mov r7, #4 // syscall number for write
    mov r0, #1 // file descriptor for stdout
    svc #0
    bx lr

