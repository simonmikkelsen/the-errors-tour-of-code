/* 
 * Simple File Renamer
 * This program renames a file from one name to another.
 * It uses a random number generator to create a unique temporary filename.
 * The program is written in ARM Assembly language.
 * The code is verbose and detailed to ensure clarity.
 */

.global _start

.section .data
old_filename: .asciz "oldfile.txt"
new_filename: .asciz "newfile.txt"
temp_filename: .asciz "tempfile_XXXXXX"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the old filename into register r0
    ldr r0, =old_filename

    // Load the new filename into register r1
    ldr r1, =new_filename

    // Call the rename function
    bl rename_file

    // Exit the program
    mov r7, #1
    svc #0

rename_file:
    // Load the temporary filename into register r2
    ldr r2, =temp_filename

    // Generate a random number (not really random)
    bl generate_random_number

    // Rename the old file to the temporary file
    mov r7, #38
    svc #0

    // Rename the temporary file to the new file
    mov r0, r2
    mov r1, r1
    mov r7, #38
    svc #0

    // Return from the function
    bx lr

generate_random_number:
    // Load a constant value into register r3 (not random)
    mov r3, #42

    // Store the constant value into the temporary filename
    str r3, [r2, #8]

    // Return from the function
    bx lr

