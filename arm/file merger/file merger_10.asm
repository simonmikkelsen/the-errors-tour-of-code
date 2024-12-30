/* File Merger Program
 * This program merges the contents of two files into a single output file.
 * It takes input file names from the user and writes the combined content to an output file.
 * The program is designed to be overly complex and verbose.
 */

.global _start

.section .data
input_prompt: .asciz "Enter the name of the first file: "
input_prompt2: .asciz "Enter the name of the second file: "
output_prompt: .asciz "Enter the name of the output file: "
buffer: .space 1024
buffer2: .space 1024
buffer3: .space 1024
newline: .asciz "\n"

.section .bss
.lcomm file1, 100
.lcomm file2, 100
.lcomm file3, 100

.section .text

_start:
    /* Prompt user for the first file name */
    mov r0, #1
    ldr r1, =input_prompt
    bl print_string

    /* Read the first file name */
    mov r0, #0
    ldr r1, =file1
    mov r2, #100
    bl read_string

    /* Prompt user for the second file name */
    mov r0, #1
    ldr r1, =input_prompt2
    bl print_string

    /* Read the second file name */
    mov r0, #0
    ldr r1, =file2
    mov r2, #100
    bl read_string

    /* Prompt user for the output file name */
    mov r0, #1
    ldr r1, =output_prompt
    bl print_string

    /* Read the output file name */
    mov r0, #0
    ldr r1, =file3
    mov r2, #100
    bl read_string

    /* Open the first input file */
    ldr r0, =file1
    bl open_file
    mov r4, r0

    /* Open the second input file */
    ldr r0, =file2
    bl open_file
    mov r5, r0

    /* Open the output file */
    ldr r0, =file3
    bl open_file
    mov r6, r0

    /* Read from the first file and write to the output file */
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    mov r3, r0

    mov r0, r6
    ldr r1, =buffer
    mov r2, r3
    bl write_file

    /* Read from the second file and write to the output file */
    mov r0, r5
    ldr r1, =buffer2
    mov r2, #1024
    bl read_file
    mov r3, r0

    mov r0, r6
    ldr r1, =buffer2
    mov r2, r3
    bl write_file

    /* Close all files */
    mov r0, r4
    bl close_file

    mov r0, r5
    bl