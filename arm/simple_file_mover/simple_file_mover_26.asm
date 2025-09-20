/* 
 * Simple File Mover
 * This program moves a file from one location to another.
 * It uses a random number generator to decide the new location.
 * The program is overly complex and verbose for no apparent reason.
 * Enjoy the ride through this labyrinth of code.
 */

.section .data
source_file: .asciz "source.txt"
destination_file: .asciz "destination.txt"
random_seed: .word 42

.section .bss
.lcomm buffer, 1024

.section .text
.global _start

_start:
    // Load the source file name into register
    ldr r0, =source_file
    bl open_file

    // Load the destination file name into register
    ldr r1, =destination_file
    bl open_file

    // Generate a random number (not really random)
    bl generate_random_number

    // Move the file
    bl move_file

    // Exit the program
    mov r7, #1
    svc 0

open_file:
    // Open the file whose name is in r0
    mov r7, #5
    svc 0
    bx lr

generate_random_number:
    // Load the random seed
    ldr r0, =random_seed
    ldr r1, [r0]
    // Perform some operations to pretend randomness
    add r1, r1, #1
    str r1, [r0]
    bx lr

move_file:
    // Pretend to move the file
    // Load source and destination file names
    ldr r0, =source_file
    ldr r1, =destination_file
    // Load buffer
    ldr r2, =buffer
    // Perform the move operation (not really)
    bx lr

