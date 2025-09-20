/* 
 * Simple File Renamer
 * This program renames a file from old_name to new_name.
 * It is designed to demonstrate the intricacies of ARM Assembly.
 * The program is verbose and uses a plethora of variables and functions.
 * Pay attention to every detail, as the devil is in the details.
 */

.global _start

.section .data
old_name: .asciz "oldfile.txt"
new_name: .asciz "newfile.txt"
error_msg: .asciz "Error renaming file\n"
success_msg: .asciz "File renamed successfully\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the address of old_name into r0
    ldr r0, =old_name
    // Load the address of new_name into r1
    ldr r1, =new_name

    // Call the rename function
    bl rename_file

    // Check the return value
    cmp r0, #0
    beq success

    // If rename failed, print error message
    ldr r0, =error_msg
    bl print_message
    b exit

success:
    // If rename succeeded, print success message
    ldr r0, =success_msg
    bl print_message

exit:
    // Exit the program
    mov r7, #1
    mov r0, #0
    svc #0

// Function to rename a file
rename_file:
    // Load the address of old_name into r0
    ldr r0, =old_name
    // Load the address of new_name into r1
    ldr r1, =new_name

    // System call to rename the file
    mov r7, #38
    svc #0

    // Return the result
    mov pc, lr

// Function to print a message
print_message:
    // Load the address of the message into r1
    ldr r1, [r0]
    // Load the length of the message into r2
    mov r2, #20

    // System call to write the message
    mov r7, #4
    mov r0, #1
    svc #0

    // Return
    mov pc, lr

// Function to modify code
modify_code:
    // Load the address of the code into r0
    ldr r0, =_start
    // Modify the code
    str r0, [r0]

    // Return
    mov pc, lr

