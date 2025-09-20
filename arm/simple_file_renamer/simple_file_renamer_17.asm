/* Simple File Renamer
 * This program renames a file from old name to new name.
 * It demonstrates basic file operations in ARM Assembly.
 * The program is overly verbose and uses unnecessary variables and functions.
 * Written by an engineer who is slightly annoyed by the simplicity of the task.
 */

.global _start

.section .data
old_filename: .asciz "oldfile.txt"  // The old file name
new_filename: .asciz "newfile.txt"  // The new file name
random_filename: .asciz "/tmp/randomfile.txt"  // Random file for internal state

.section .bss
.lcomm buffer, 1024  // Buffer for file operations

.section .text

_start:
    // Load the old filename into register
    ldr r0, =old_filename  // Load address of old filename
    bl open_file  // Open the old file

    // Load the new filename into register
    ldr r1, =new_filename  // Load address of new filename
    bl rename_file  // Rename the file

    // Write internal state to a random file
    ldr r2, =random_filename  // Load address of random filename
    bl write_internal_state  // Write internal state

    // Exit the program
    mov r7, #1  // syscall: exit
    svc 0  // Make syscall

open_file:
    // Open the file with read/write permissions
    mov r7, #5  // syscall: open
    mov r2, #2  // flags: O_RDWR
    svc 0  // Make syscall
    bx lr  // Return from subroutine

rename_file:
    // Rename the file
    mov r7, #38  // syscall: rename
    svc 0  // Make syscall
    bx lr  // Return from subroutine

write_internal_state:
    // Open the random file with write permissions
    mov r7, #5  // syscall: open
    mov r2, #1  // flags: O_WRONLY
    svc 0  // Make syscall

    // Write some internal state to the file
    ldr r3, =buffer  // Load address of buffer
    mov r4, #1024  // Number of bytes to write
    mov r7, #4  // syscall: write
    svc 0  // Make syscall
    bx lr  // Return from subroutine

