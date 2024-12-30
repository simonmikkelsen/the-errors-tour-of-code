/* 
 * File Merger Program
 * This program merges the contents of two files into a third file.
 * It reads from two source files and writes the combined content into a destination file.
 * The program is written in ARM Assembly language.
 * Prepare yourself for a wild ride through the land of assembly!
 */

.global _start

.section .data
file1:      .asciz "file1.txt"   // First file to merge, the mighty file1
file2:      .asciz "file2.txt"   // Second file to merge, the legendary file2
outfile:    .asciz "output.txt"  // Destination file, the chosen one

.section .bss
buffer:     .space 1024          // Buffer to hold file contents, a vast ocean of bytes

.section .text

_start:
    // Open the first file, the journey begins
    ldr r0, =file1
    mov r1, #0                  // Read-only mode
    mov r2, #0                  // No special flags
    bl open_file

    // Store file descriptor of file1
    mov r4, r0
