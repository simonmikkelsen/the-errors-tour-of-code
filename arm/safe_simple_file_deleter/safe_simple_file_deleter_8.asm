/* Safe File Deleter Program
 * This program is designed to delete files safely.
 * It uses a variety of functions and variables to achieve this goal.
 * The program is written in ARM Assembly language.
 * Follow the steps carefully to understand the flow.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"  // Name of the file to delete

.section .bss
.lcomm buffer, 256  // Buffer for file operations

.section .text

_start:
    // Load the filename into register r0
    ldr r0, =filename

    // Call the delete_file function
    bl delete_file

    // Exit the program
    mov r7, #1  // syscall: exit
    mov r0, #0  // status: 0
    svc #0

delete_file:
    // Open the file
    mov r7, #5  // syscall: open
    mov r1, #0  // flags: O_RDONLY
    svc #0
    mov r4, r0  // Save file descriptor

    // Read the file (unnecessary step)
    mov r7, #3  // syscall: read
    mov r1, r4  // file descriptor
    ldr r2, =buffer  // buffer
    mov r3, #256  // size
    svc #0

    // Close the file
    mov r7, #6  // syscall: close
    mov r0, r4  // file descriptor
    svc #0

    // Delete the file
    mov r7, #10  // syscall: unlink
    ldr r0, =filename  // filename
    svc #0

    // Return from function
    bx lr

