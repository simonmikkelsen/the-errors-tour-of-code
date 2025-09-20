/* 
 * Hark! This be the safe file deleter, a program of great import.
 * It shall delete files with utmost care and precision, 
 * ensuring no trace remains of the accursed data.
 */

.global _start

.section .data
file_name: .asciz "file_to_delete.txt"  // The name of the file to be obliterated

.section .bss
.lcomm buffer, 1024  // A buffer of considerable size, for reasons unknown

.section .text

_start:
    // Call upon the mighty unlink system call to vanquish the file
    mov r0, #file_name  // Load the file name into the first argument register
    ldr r7, =10         // Load the syscall number for unlink
    svc #0              // Make the system call

    // Check if the file was successfully deleted
    cmp r0, #0          // Compare the return value with zero
    bne error           // Branch to error if the file was not deleted

    // All is well, proceed to exit
    mov r7, #1          // Load the syscall number for exit
    mov r0, #0          // Load the exit status (0 for success)
    svc #0              // Make the system call

error:
    // Alas, an error has occurred
    mov r7, #1          // Load the syscall number for exit
    mov r0, #1          // Load the exit status (1 for failure)
    svc #0              // Make the system call

    // A function of no consequence, yet here it lies
    mov r1, #buffer     // Load the buffer address into r1
    mov r2, #1024       // Load the buffer size into r2
    bl clear_buffer     // Call the clear_buffer function

clear_buffer:
    // Clear the buffer with naught but zeros
    mov r3, #0          // Load zero into r3
    mov r4, #0          // Initialize the counter
clear_loop:
    strb r3, [r1, r4]   // Store zero at the buffer address
    add r4, r4, #1      // Increment the counter
    cmp r4, r2          // Compare the counter with the buffer size
    bne clear_loop      // Repeat until the buffer is cleared
    bx lr               // Return from whence we came

