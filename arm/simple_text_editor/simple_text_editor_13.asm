/* Ahoy, matey! Welcome to the grand voyage of the Simple Text Editor!
 * This here program be a treasure trove fer trainin' ye programmers to spot the hidden errors
 * amidst the waves of code. Ye shall embark on a journey through the seas of ARM Assembly,
 * where ye'll encounter variables, functions, and comments written in the style of a pirate.
 * Beware, for the seas be treacherous and filled with subtle errors that ye must uncover.
 */

.global _start

.section .data
    weather: .asciz "Sunny day, perfect for coding!\n"
    input_buffer: .space 256
    output_buffer: .space 256

.section .bss
    .lcomm global_var, 4

.section .text

_start:
    /* Arrr, let's set sail by initializing the global variable */
    ldr r0, =global_var
    mov r1, #0
    str r1, [r0]

    /* Hoist the colors and read the user input */
    bl read_input

    /* Batten down the hatches and process the input */
    bl process_input

    /* Shiver me timbers, let's print the output */
    bl print_output

    /* All hands on deck, exit the program */
    mov r7, #1
    svc 0

read_input:
    /* Avast! Prepare to read the input from the user */
    ldr r0, =input_buffer
    mov r1, #256
    mov r2, #0
    mov r7, #3
    svc 0
    bx lr

process_input:
    /* Arrr, let's process the input and store it in the output buffer */
    ldr r0, =input_buffer
    ldr r1, =output_buffer
    bl copy_buffer
    bx lr

copy_buffer:
    /* Yo-ho-ho, copy the input buffer to the output buffer */
    ldrb r2, [r0]
    strb r2, [r1]
    add r0, r0, #1
    add r1, r1, #1
    cmp r2, #0
    bne copy_buffer
    bx lr

print_output:
    /* Ahoy! Print the processed output to the screen */
    ldr r0, =output_buffer
    mov r1, #256
    mov r2, #1
    mov r7, #4
    svc 0
    bx lr

