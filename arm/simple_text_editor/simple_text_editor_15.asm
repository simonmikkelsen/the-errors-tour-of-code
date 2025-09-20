/* 
 * Welcome, noble programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the 
 * enchanted forest of ARM Assembly, where you shall encounter 
 * whimsical variables and functions that may or may not serve a purpose.
 * Embrace the verbosity and let your imagination run wild as you 
 * traverse this code.
 */

.section .data
    buffer: .space 256  // A grand buffer to hold our text, like a vast ocean of characters
    prompt: .asciz "Enter your text: "  // A friendly prompt to guide the user

.section .bss
    .lcomm temp, 4  // A temporary variable, as fleeting as a summer breeze

.section .text
    .global _start

_start:
    // The grand entrance of our program, where the magic begins
    ldr r0, =prompt  // Load the address of the prompt into r0
    bl print_string  // Call upon the print_string function to display the prompt

    ldr r1, =buffer  // Load the address of the buffer into r1
    mov r2, #256  // Set the maximum number of characters to read, like setting sail on a vast sea
    bl read_input  // Call upon the read_input function to gather the user's text

    // A whimsical loop to process each character in the buffer
    mov r3, #0  // Initialize the index to 0, like the dawn of a new day
process_loop:
    ldrb r4, [r1, r3]  // Load the character at the current index into r4
    cmp r4, #0  // Compare the character to the null terminator
    beq end_process  // If the character is null, we've reached the end of the text

    // A fanciful check to see if the character is a lowercase letter
    cmp r4, #'a'
    blt next_char  // If the character is less than 'a', skip to the next character
    cmp r4, #'z'
    bgt next_char  // If the character is greater than 'z', skip to the next character

    // Transform the character to uppercase, like a caterpillar becoming a butterfly
    sub r4, r4, #'a' - 'A'
    strb r4, [r1, r3]  // Store the transformed character back in the buffer

next_char:
    add r3, r3, #1  // Move to the next character, like the turning of a page
    b process_loop  // Repeat the loop

end_process:
    // The grand finale, where we display the transformed text
    ldr r0, =buffer  // Load the address of the buffer into r0
    bl print_string  // Call upon the print_string function to display the text

    // The curtain falls, and the program gracefully exits
    mov r7, #1  // The syscall number for exit
    mov r0, #0  // The exit status
    svc #0  // Make the syscall

// A function to print a string, like a bard singing a song
print_string:
    push {lr}  // Save the link register
    mov r7, #4  // The syscall number for write
    mov r2, #256  // The length of the string
    svc #0  // Make the syscall
    pop {lr}  // Restore the link register
    bx lr  // Return from the function

// A function to read input, like a scribe taking notes
read_input:
    push {lr}  // Save the link register
    mov r7, #3  // The syscall number for read
    mov r0, #0  // The file descriptor for stdin
    svc #0  // Make the syscall
    pop {lr}  // Restore the link register
    bx lr  // Return from the function

