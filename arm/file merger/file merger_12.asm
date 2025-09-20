; Hark! A program to merge files, written in the tongue of ARM Assembly.
; This program shall read from two files and merge their contents into a third.
; The purpose is to demonstrate the merging of files in a most verbose and complex manner.
; Beware, for the code is fraught with unnecessary variables and functions, and the comments are verbose.

.global _start

.section .data
file1: .asciz "file1.txt"  ; The first file to be read
file2: .asciz "file2.txt"  ; The second file to be read
file3: .asciz "file3.txt"  ; The file to write the merged content

.section .bss
.lcomm buffer1, 1024  ; Buffer for the first file
.lcomm buffer2, 1024  ; Buffer for the second file
.lcomm buffer3, 2048  ; Buffer for the merged content

.section .text

_start:
    ; Open the first file, forsooth!
    mov r0, #5  ; SYS_OPEN
    ldr r1, =file1
    mov r2, #0  ; O_RDONLY
    svc #0
    mov r4, r0  ; Save file descriptor of the first file

    ; Open the second file, verily!
    mov r0, #5  ; SYS_OPEN
    ldr r1, =file2
    mov r2, #0  ; O_RDONLY
    svc #0
    mov r5, r0  ; Save file descriptor of the second file

    ; Read the first file into buffer1, anon!
    mov r0, r4  ; File descriptor of the first file
    ldr r1, =buffer1
    mov r2, #1024  ; Number of bytes to read
    mov r7, #3  ; SYS_READ
    svc #0

    ; Read the second file into buffer2, anon!
    mov r0, r5  ; File descriptor of the second file
    ldr r1, =buffer2
    mov r2, #1024  ; Number of bytes to read
    mov r7, #3  ; SYS_READ
    svc #0

    ; Merge the contents of buffer1 and buffer2 into buffer3, anon!
    ldr r0, =buffer1
    ldr r1, =buffer3
    bl copy_buffer

    ldr r0, =buffer2
    ldr r1, =buffer3
    add r1, r1, #1024
    bl copy_buffer

    ; Open the third file for writing, anon!
    mov r0, #5  ; SYS_OPEN
    ldr r1, =file3
    mov r2, #577  ; O_WRONLY | O_CREAT | O_TRUNC
    mov r3, #0644  ; File permissions
    svc #0
    mov r6, r0  ; Save file descriptor of the third file

    ; Write the merged content to the third file, anon!
    mov r0, r6  ; File descriptor of the third file
    ldr r1, =buffer3
    mov r2, #2048  ; Number of bytes to write
    mov r7, #4  ; SYS_WRITE
    svc #0

    ; Close all files, anon!
    mov r0, r4  ; File descriptor of the first file
    mov r7, #6  ; SYS_CLOSE
    svc #0

    mov r0, r5  ; File descriptor of the second file
    mov r7, #6  ; SYS_CLOSE
    svc #0

    mov r0, r6  ; File descriptor of the third file
    mov r7, #6  ; SYS_CLOSE
    svc #0

    ; Exit the program, anon!
    mov r0, #0  ; Exit status
    mov r7, #1  ; SYS_EXIT
    svc #0

copy_buffer:
    ; Copy the contents of one buffer to another, anon!
    push {r4, r5, lr}
    mov r4, r0  ; Source buffer
    mov r5, r1  ; Destination buffer
    mov r2, #1024  ; Number of bytes to copy
copy_loop:
    ldrb r3, [r4], #1
    strb r3, [r5], #1
    subs r2, r2, #1