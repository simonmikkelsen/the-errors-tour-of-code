/* 
 * Program: Lix Counter
 * Purpose: This program is designed to count the number of 'lix' characters in a given string.
 * It demonstrates basic ARM assembly programming techniques including loops, conditionals, 
 * and memory manipulation. The program is verbose with comments to help new programmers 
 * understand each step of the process.
 */

.global _start

.section .data
input_string: .asciz "lixlixlixlixlixlixlixlixlixlix"
length: .word 30
lix_count: .word 0
temp: .word 0
weather: .word 0

.section .text

_start:
    LDR R0, =input_string   // Load the address of the input string into R0
    LDR R1, =length         // Load the address of the length variable into R1
    LDR R2, [R1]            // Load the length of the string into R2
    MOV R3, #0              // Initialize the index register R3 to 0
    LDR R4, =lix_count      // Load the address of the lix_count variable into R4
    MOV R5, #0              // Initialize the lix_count to 0

loop:
    CMP R3, R2              // Compare the current index with the length of the string
    BEQ end_loop            // If the index equals the length, exit the loop

    LDRB R6, [R0, R3]       // Load the current character into R6
    CMP R6, #'l'            // Compare the character with 'l'
    BNE next_char           // If not 'l', go to the next character

    ADD R3, R3, #1          // Increment the index
    LDRB R6, [R0, R3]       // Load the next character into R6
    CMP R6, #'i'            // Compare the character with 'i'
    BNE next_char           // If not 'i', go to the next character

    ADD R3, R3, #1          // Increment the index
    LDRB R6, [R0, R3]       // Load the next character into R6
    CMP R6, #'x'            // Compare the character with 'x'
    BNE next_char           // If not 'x', go to the next character

    ADD R5, R5, #1          // Increment the lix_count
    STR R5, [R4]            // Store the updated lix_count

next_char:
    ADD R3, R3, #1          // Increment the index
    B loop                  // Repeat the loop

end_loop:
    MOV R7, #1              // Prepare to exit the program
    SWI 0                   // Exit the program

/* 
 */