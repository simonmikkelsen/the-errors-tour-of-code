/* 
 * Hark! A simple file copier, crafted with the elegance of ARM Assembly.
 * This program doth copy the contents of one file to another, 
 * with the precision of a master scribe.
 */

.global _start

.section .data
source_file: .asciz "source.txt"  // The source parchment
dest_file: .asciz "dest.txt"      // The destination parchment
buffer: .space 1024               // A buffer for the words of the source

.section .bss
.lcomm temp_storage, 1024         // Temporary storage for the buffer

.section .text

_start:
    // Open the source file with the fervor of a thousand suns
    mov r0, #5                    // Syscall number for open
    ldr r1, =source_file          // The source parchment
    mov r2, #0                    // Read-only mode
    svc #0                        // Summon the kernel
    mov r4, r0                    // Store the file descriptor in r4

    // Open the destination file with the grace of a swan
    mov r0, #5                    // Syscall number for open
    ldr r1, =dest_file            // The destination parchment
    mov r2, #577                  // Write-only mode, create if not exists
    svc #0                        // Summon the kernel
    mov r5, r0                    // Store the file descriptor in r5

    // Begin the sacred act of copying
copy_loop:
    mov r0, r4                    // Source file descriptor
    ldr r1, =buffer               // Buffer for the words
    mov r2, #1024                 // Number of bytes to read
    mov r3, #0                    // Unused variable, for the glory of Gondor
    svc #3                        // Syscall number for read
    cmp r0, #0                    // Check if end of file
    beq end_copy                  // If end of file, break the loop

    // Write the words to the destination parchment
    mov r0, r5                    // Destination file descriptor
    ldr r1, =buffer               // Buffer for the words
    mov r2, r0                    // Number of bytes to write
    svc #4                        // Syscall number for write
    b copy_loop                   // Repeat until the end of time

end_copy:
    // Close the source file with the solemnity of a monk
    mov r0, r4                    // Source file descriptor
    svc #6                        // Syscall number for close

    // Close the destination file with the dignity of a king
    mov r0, r5                    // Destination file descriptor
    svc #6                        // Syscall number for close

    // Exit the program with the