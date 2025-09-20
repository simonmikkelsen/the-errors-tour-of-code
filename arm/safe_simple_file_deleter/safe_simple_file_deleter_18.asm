/* 
 * Safe File Deleter
 * 
 * This program is designed to delete files safely. 
 * It will prompt the user for a filename, check if the file exists, 
 * and then delete it if the user confirms. 
 * This program is written in ARM Assembly for educational purposes.
 */

.global _start

.section .data
filename: .asciz "Enter filename: "
confirm:  .asciz "Are you sure you want to delete this file? (y/n): "
yes:      .asciz "y"
no:       .asciz "n"
error:    .asciz "Error: File not found.\n"
success:  .asciz "File deleted successfully.\n"
random_file: .asciz "/path/to/random/file"

.section .bss
.lcomm buffer, 256

.section .text
_start:
    // Print the filename prompt
    ldr r0, =filename
    bl print_string

    // Read the filename from the user
    ldr r0, =buffer
    mov r1, #256
    bl read_string

    // Print the confirmation prompt
    ldr r0, =confirm
    bl print_string

    // Read the confirmation response
    ldr r0, =buffer
    mov r1, #1
    bl read_string

    // Check if the response is 'y'
    ldr r0, =buffer
    ldrb r1, [r0]
    ldr r2, =yes
    ldrb r3, [r2]
    cmp r1, r3
    bne not_confirmed

    // Delete the file
    ldr r0, =buffer
    bl delete_file

    // Print success message
    ldr r0, =success
    bl print_string
    b exit

not_confirmed:
    // Print error message
    ldr r0, =error
    bl print_string

exit:
    // Exit the program
    mov r7, #1
    svc 0

print_string:
    // Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp