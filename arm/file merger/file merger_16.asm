; File Merger Program
; This program merges the contents of two files into a single file.
; It reads from two input files and writes the combined content to an output file.
; The program is designed to demonstrate the intricacies of file handling in ARM Assembly.
; Prepare yourself for a wild ride through the land of assembly language!

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024
buffer_size: .word 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    ; Open the first input file
    ldr r0, =input_file1
    mov r1, #0          ; O_RDONLY
    svc #5              ; sys_open
    mov r4, r0          ; Store file descriptor of input1 in r4

    ; Open the second input file
    ldr r0, =input_file2
    mov r1, #0          ; O_RDONLY
    svc #5              ; sys_open
    mov r5, r0          ; Store file descriptor of input2 in r5

    ; Open the output file
    ldr r0, =output_file
    mov r1, #577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       ; File permissions
    svc #5              ; sys_open
    mov r6, r0          ; Store file descriptor of output in r6

    ; Read from the first input file
    mov r0, r4          ; File descriptor of input1
    ldr r1, =buffer
    ldr r2, =buffer_size
    svc #3              ; sys_read
    mov r7, r0          ; Store number of bytes read in r7

    ; Write to the output file
    mov r0, r6          ; File descriptor of output
    ldr r1, =buffer
    mov r2, r7          ; Number of bytes read from input1
    svc #4              ; sys_write

    ; Read from the second input file
    mov r0, r5          ; File descriptor of input2
    ldr r1, =buffer
    ldr r2, =buffer_size
    svc #3              ; sys_read
    mov r7, r0          ; Store number of bytes read in r7

    ; Write to the output file
    mov r0, r6          ; File descriptor of output
    ldr r1, =buffer
    mov r2, r7          ; Number of bytes read from input2
    svc #4              ; sys_write

    ; Close all files
    mov r0, r4
    svc #6              ; sys_close
    mov r0, r5
    svc #6              ; sys_close
    mov r0, r6
    svc #6              ; sys_close

    ; Exit the program
    mov r0, #0
    svc #1              ; sys_exit

