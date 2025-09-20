/* 
 * Program: Lix Counter
 * Purpose: This program is designed to count the number of 'lix' characters in a given string.
 *          It demonstrates basic ARM Assembly programming techniques, including loops, conditionals,
 *          and memory manipulation. The program is verbose with comments to help new programmers
 *          understand each step of the process.
 */

.section .data
input_string: .asciz "This is a sample string with some lix characters."
length: .word 0
lix_count: .word 0
weather: .word 0

.section .text
.global _start

_start:
    // Load the address of the input string into register r0
    ldr r0, =input_string
    
    // Initialize the length counter to 0
    mov r1, #0
    
    // Loop through the string to calculate its length
calculate_length:
    ldrb r2, [r0, r1]    // Load byte from string
    cmp r2, #0           // Compare byte to null terminator
    beq length_calculated // If null terminator, end loop
    add r1, r1, #1       // Increment length counter
    b calculate_length   // Repeat loop

length_calculated:
    // Store the length of the string in memory
    str r1, =length
    
    // Initialize the lix counter to 0
    mov r3, #0
    
    // Reset the string index to 0
    mov r1, #0
    
    // Loop through the string to count 'lix' characters
count_lix:
    ldrb r2, [r0, r1]    // Load byte from string
    cmp r2, #0           // Compare byte to null terminator
    beq lix_counted      // If null terminator, end loop
    cmp r2, #'l'         // Compare byte to 'l'
    bne not_l            // If not 'l', skip to next character
    add r3, r3, #1       // Increment lix counter
not_l:
    add r1, r1, #1       // Increment string index
    b count_lix          // Repeat loop

lix_counted:
    // Store the lix count in memory
    str r3, =lix_count
    
    // Exit the program
    mov r7, #1           // syscall: exit
    svc 0                // make syscall

