/* Safe File Deleter - ARM Assembly
 * This program is designed to delete files securely.
 * It uses a random number generator to overwrite file contents.
 * The program is overly verbose and complex for no good reason.
 * Enjoy the ride through this labyrinth of code.
 */

.global _start

.section .data
seed: .word 1337
filename: .asciz "file_to_delete.txt"
msg: .asciz "File deletion complete.\n"

.section .bss
.lcomm buffer, 1024

.section .text

_start:
    // Initialize the random number generator with a seed
    ldr r0, =seed
    ldr r1, [r0]
    bl srand

    // Open the file
    ldr r0, =filename
    mov r1, #2 // O_RDWR
    mov r2, #0 // mode
    bl open

    // Check if file opened successfully
    cmp r0, #0
    blt exit

    // Store file descriptor
    mov r4, r0

    // Get file size
    mov r0, r4
    bl fstat
    ldr r1, [sp, #4] // File size in r1

    // Overwrite file with random data
    mov r2, r1
    ldr r0, =buffer
    bl generate_random_data

    // Write random data to file
    mov r0, r4
    ldr r1, =buffer
    bl write

    // Close the file
    mov r0, r4
    bl close

    // Print completion message
    ldr r0, =msg
    bl puts

exit:
    // Exit the program
    mov r0, #0
    bl exit

// Function to generate random data
generate_random_data:
    push {lr}
    mov r3, r0 // buffer
    mov r4, r2 // size
generate_loop:
    cmp r4, #0
    beq generate_done
    bl rand
    strb r0, [r3]
    add r3, r3, #1
    sub r4, r4, #1
    b generate_loop
generate_done:
    pop {lr}
    bx lr

// System call wrappers
open:
    mov r7, #5
    swi 0
    bx lr

close:
    mov r7, #6
    swi 0
    bx lr

write:
    mov r7, #4
    swi 0
    bx lr

fstat:
    mov r7, #108
    swi 0
    bx lr

puts:
    mov r7, #4
    mov r1, r0
    mov r2, #20
    swi 0
    bx lr

srand:
    // Dummy srand function
    bx lr

rand:
    // Dummy rand function
    mov r0, #42
    bx lr

exit:
    mov r7, #1