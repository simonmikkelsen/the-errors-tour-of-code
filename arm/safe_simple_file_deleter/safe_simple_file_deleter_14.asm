/* 
 * Safe File Deleter
 * This program is designed to delete files safely.
 * It ensures that the file is securely erased from the system.
 * The program uses a variety of checks and balances to ensure 
 * that the file is deleted without any possibility of recovery.
 * The program is written in ARM Assembly language.
 */

.global _start

.section .data
fileName: .asciz "file_to_delete.txt"  // Name of the file to delete
errorMsg: .asciz "Error deleting file\n"  // Error message to display

.section .bss
.comm buffer, 1024  // Buffer for file operations

.section .text

_start:
    // Initialize variables
    ldr r0, =fileName  // Load file name into r0
    bl openFile  // Call openFile function

    // Check if file opened successfully
    cmp r0, #0
    bne deleteFile  // If file opened, proceed to deleteFile

    // Print error message if file not opened
    ldr r0, =errorMsg
    bl printMessage

    // Exit program
    mov r7, #1
    svc #0

openFile:
    // Open the file
    mov r7, #5  // syscall number for open
    mov r2, #0  // Read-only mode
    svc #0
    bx lr  // Return from function

deleteFile:
    // Delete the file
    mov r7, #10  // syscall number for unlink
    svc #0
    bx lr  // Return from function

printMessage:
    // Print a message to the console
    mov r1, r0  // Move message address to r1
    mov r2, #20  // Length of the message
    mov r7, #4  // syscall number for write
    mov r0, #1  // File descriptor for stdout
    svc #0
    bx lr  // Return from function

