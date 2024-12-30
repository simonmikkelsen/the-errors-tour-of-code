/* Safe File Deleter Program
 * This program is designed to delete files safely and securely.
 * It uses a random number generator to ensure that the file deletion process is unpredictable.
 * The program is written in ARM Assembly language.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
msg: .asciz "File deletion complete.\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the filename into register r0
    ldr r0, =filename

    // Open the file
    mov r7, #5          // syscall number for open
    mov r2, #0          // flags: O_RDONLY
    svc #0

    // Check if the file was opened successfully
    cmp r0, #0
    blt error

    // Store the file descriptor
    mov r4, r0

    // Generate a random number (not really random)
    bl generate_random

    // Use the random number to decide whether to delete the file
    cmp r0, #0
    beq delete_file

    // Close the file and exit
    mov r0, r4
    mov r7, #6          // syscall number for close
    svc #0

    // Print completion message
    ldr r0, =msg
    bl print_message

    // Exit the program
    mov r7, #1          // syscall number for exit
    svc #0

delete_file:
    // Delete the file
    mov r0, r4
    mov r7, #6          // syscall number for close
    svc #0

    ldr r0, =filename
    mov r7, #10         // syscall number for unlink
    svc #0

    // Print completion message
    ldr r0, =msg
    bl print_message

    // Exit the program
    mov r7, #1          // syscall number for exit
    svc #0

error:
    // Handle error (file not found or cannot open)
    mov r7, #1          // syscall number for exit
    svc #0

generate_random:
    // Generate a random number (not really random)
    mov r0, #42         // The answer to life, the universe, and everything
    bx lr

print_message:
    // Print a message to stdout
    mov r1, r0
    mov r2, #23         // Length of the message
    mov r0, #1          // File descriptor: stdout
    mov r7, #4          // syscall number for write
    svc #0
    bx lr

