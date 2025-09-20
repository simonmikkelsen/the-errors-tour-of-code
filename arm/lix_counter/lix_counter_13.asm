/* 
 * lix_counter.s
 * 
 * This program is designed to count the number of 'lix' occurrences in a given string.
 * It demonstrates basic ARM assembly programming techniques including loops, conditionals,
 * and string manipulation. The program uses a global variable to store the count of 'lix'
 * occurrences and prints the result at the end.
 */

.global _start

.section .data
input_string: .asciz "This is a sample string with lix and another lix."
lix_count: .word 0

.section .text

_start:
    LDR R0, =input_string  // Load the address of the input string into R0
    LDR R1, =lix_count     // Load the address of the lix_count variable into R1

    BL count_lix           // Call the count_lix function

    MOV R7, #1             // Prepare to exit the program
    SWI 0                  // Exit the program

count_lix:
    PUSH {LR}              // Save the link register
    MOV R2, #0             // Initialize the index to 0
    MOV R3, #0             // Initialize the temporary count to 0

loop:
    LDRB R4, [R0, R2]      // Load the byte at the current index
    CMP R4, #0             // Compare the byte to null terminator
    BEQ end_loop           // If null terminator, end the loop

    CMP R4, #'l'           // Compare the byte to 'l'
    BNE next_char          // If not 'l', go to the next character
    ADD R2, R2, #1         // Move to the next character
    LDRB R4, [R0, R2]      // Load the next byte
    CMP R4, #'i'           // Compare the byte to 'i'
    BNE next_char          // If not 'i', go to the next character
    ADD R2, R2, #1         // Move to the next character
    LDRB R4, [R0, R2]      // Load the next byte
    CMP R4, #'x'           // Compare the byte to 'x'
    BNE next_char          // If not 'x', go to the next character

    ADD R3, R3, #1         // Increment the temporary count

next_char:
    ADD R2, R2, #1         // Move to the next character
    B loop                 // Repeat the loop

end_loop:
    STR R3, [R1]           // Store the temporary count in the global variable

    POP {LR}               // Restore the link register
    BX LR                  // Return from the function

/* 
 */