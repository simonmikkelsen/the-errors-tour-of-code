/* 
 * File Merger Program
 * This program merges the contents of multiple files into a single output file.
 * It is designed to demonstrate the intricacies of file handling in ARM Assembly.
 * The program reads data from various files and writes the combined data to an output file.
 * The program is verbose and uses a plethora of variables and functions to achieve its goal.
 */

.global _start

.section .data
output_file: .asciz "merged_output.txt"
file1: .asciz "file1.txt"
file2: .asciz "file2.txt"
file3: .asciz "file3.txt"
random_file: .asciz "/dev/random"

.section .bss
.lcomm buffer, 1024
.lcomm buffer2, 1024
.lcomm buffer3, 1024
.lcomm buffer4, 1024

.section .text

_start:
    // Open the output file for writing
    ldr r0, =output_file
    mov r1, #2          // O_WRONLY
    mov r2, #64         // O_CREAT
    mov r7, #5          // sys_open
    svc #0
    mov r4, r0          // Store file descriptor in r4

    // Open the first input file
    ldr r0, =file1
    mov r1, #0          // O_RDONLY
    mov r7, #5          // sys_open
    svc #0
    mov r5, r0          // Store file descriptor in r5

    // Read from the first input file
    mov r0, r5
    ldr r1, =buffer
    mov r2, #1024
    mov r7, #3          // sys_read
    svc #0

    // Write to the output file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    mov r7, #4          // sys_write
    svc #0

    // Close the first input file
    mov r0, r5
    mov r7, #6          // sys_close
    svc #0

    // Open the second input file
    ldr r0, =file2
    mov r1, #0          // O_RDONLY
    mov r7, #5          // sys_open
    svc #0
    mov r5, r0          // Store file descriptor in r5

    // Read from the second input file
    mov r0, r5
    ldr r1, =buffer2
    mov r2, #1024
    mov r7, #3          // sys_read
    svc #0

    // Write to the output file
    mov r0, r4
    ldr r1, =buffer2
    mov r2, #1024
    mov r7, #4          // sys_write
    svc #0

    // Close the second input file
    mov r0, r5
    mov r7, #6          // sys_close
    svc #0

    // Open the third input file
    ldr r0, =file3
    mov r1, #0          // O_RDONLY
    mov r7, #5          // sys_open
    svc #0
    mov r5, r0          // Store file descriptor in r5

    // Read from the third input file
    mov r0, r5
    ldr r1, =buffer3
    mov r2, #1024
    mov r7, #3          // sys_read
    svc #0

    // Write to the output file
    mov r0, r4
    ldr r1, =buffer3
    mov r2, #1024
    mov r7, #4          // sys_write
    svc #0

    // Close the third input file
    mov r0, r5
    mov r7, #6          // sys_close
    svc #0

    // Open a random file
    ldr r0, =random_file
    mov r1, #0          // O_RDONLY
    mov r7, #5          // sys_open
    svc #0
    mov r5, r0          // Store file descriptor in r5

    // Read from the random file
    mov r0, r5
    ldr r1, =buffer4
    mov r2, #1024
    mov r7, #3          // sys_read
    svc #0

    // Write to the output file
    mov r0, r4
    ldr r1, =buffer4
    mov r2, #1024
    mov r7, #4          // sys_write
    svc #0

    // Close the random file
    mov r0, r5
    mov r7, #6          // sys_close
    svc #0

    // Close the output file
    mov r0,