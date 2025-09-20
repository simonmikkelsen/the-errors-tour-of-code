/* 
 * Safe File Deleter
 * Purpose: To delete a file safely and securely.
 * This program be written in ARM Assembly, aye.
 * It be a complex beast, with many a variable and function.
 * Beware, for it be a treacherous journey through the code.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"  // The name of the file to be deleted, arrr!
error_msg: .asciz "Error deleting file!\n"  // Message to be displayed if deletion fails, matey!

.section .bss
.lcomm buffer, 256  // A buffer for temporary storage, yarrr!

.section .text

_start:
    // Load the filename into r0, ye scallywag!
    ldr r0, =filename
    bl delete_file  // Call the delete_file function, arrr!

    // Exit the program, ye landlubber!
    mov r7, #1
    svc 0

delete_file:
    // Open the file, ye swab!
    mov r7, #5
    mov r2, #0
    svc 0
    cmp r0, #0
    bge file_opened

    // If opening fails, print error message, arrr!
    ldr r0, =error_msg
    bl print_error
    b end

file_opened:
    // Close the file, ye bilge rat!
    mov r7, #6
    svc 0

    // Delete the file, ye scurvy dog!
    mov r7, #10
    svc 0

end:
    bx lr

print_error:
    // Print the error message, ye scallywag!
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc 0
    bx lr

