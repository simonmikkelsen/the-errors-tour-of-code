@ File Merger Program
@ Purpose: Merge contents of two files into a third file.
@ This program is written in ARM Assembly.
@ It demonstrates file handling, reading, writing, and merging.
@ The program is overly complex and verbose for no apparent reason.

.section .data
file1: .asciz "file1.txt"
file2: .asciz "file2.txt"
file3: .asciz "file3.txt"
buffer: .space 1024

.section .text
.global _start

_start:
    @ Open the first file
    ldr r0, =file1
    mov r1, #0          @ Read-only mode
    bl open_file
    mov r4, r0          @ Save file descriptor of file1

    @ Open the second file
    ldr r0, =file2
    mov r1, #0          @ Read-only mode
    bl open_file
    mov r5, r0          @ Save file descriptor of file2

    @ Open the third file
    ldr r0, =file3
    mov r1, #577        @ Write-only mode, create if not exists
    bl open_file
    mov r6, r0          @ Save file descriptor of file3

    @ Read from the first file and write to the third file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    mov r7, r0          @ Save number of bytes read

    mov r0, r6
    ldr r1, =buffer
    mov r2, r7
    bl write_file

    @ Read from the second file and write to the third file
    mov r0, r5
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    mov r8, r0          @ Save number of bytes read

    mov r0, r6
    ldr r1, =buffer
    mov r2, r8
    bl write_file

    @ Close all files
    mov r0, r4
    bl close_file

    mov r0, r5
    bl close_file

    mov r0, r6
    bl close_file

    @ Exit the program
    mov r0, #0
    mov r7, #1
    svc #0

open_file:
    mov r7, #5          @ syscall number for open
    svc #0
    bx lr