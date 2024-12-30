/* 
 * This exquisite program is designed to demonstrate the art of file writing in ARM Assembly.
 * It showcases the elegance of low-level programming and the meticulous control over hardware.
 * The program will take user input and write it to a file, demonstrating the seamless interaction
 * between software and hardware. 
 */

.section .data
filename: .asciz "output.txt"
filemode: .asciz "w"
buffer: .space 256

.section .bss
.lcomm user_input, 256

.section .text
.global _start

_start:
    // Open the file for writing
    ldr r0, =filename
    ldr r1, =filemode
    bl fopen

    // Store the file pointer
    mov r4, r0

    // Prompt user for input
    ldr r0, =prompt
    bl printf

    // Read user input
    ldr r0, =user_input
    mov r1, #256
    bl gets

    // Write user input to file
    mov r0, r4
    ldr r1, =user_input
    bl fputs

    // Close the file
    mov r0, r4
    bl fclose

    // Exit the program
    mov r7, #1
    svc 0

fopen:
    // Function to open a file
    push {lr}
    bl fopen
    pop {pc}

fputs:
    // Function to write to a file
    push {lr}
    bl fputs
    pop {pc}

fclose:
    // Function to close a file
    push {lr}
    bl fclose
    pop {pc}

printf:
    // Function to print to the console
    push {lr}
    bl printf
    pop {pc}

gets:
    // Function to get user input
    push {lr}
    bl gets
    pop {pc}

prompt:
    .asciz "Please enter your input: "

