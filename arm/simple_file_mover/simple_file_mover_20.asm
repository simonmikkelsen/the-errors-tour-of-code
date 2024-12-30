; Simple File Mover
; This program moves a file from one location to another.
; It is designed to showcase the intricacies of ARM Assembly.
; The program will read a file from a source path and write it to a destination path.
; The source and destination paths are hardcoded for simplicity.
; The program uses a lot of registers and functions to demonstrate various ARM Assembly instructions.
; Pay close attention to the flow of the program and the use of registers.

.global _start

.section .data
source_path: .asciz "/path/to/source/file"
dest_path: .asciz "/path/to/dest/file"
buffer: .space 1024

.section .bss
source_fd: .word 0
dest_fd: .word 0
bytes_read: .word 0
bytes_written: .word 0

.section .text

_start:
    ; Open source file
    ldr r0, =source_path
    mov r1, #0          ; O_RDONLY
    bl open_file
    str r0, source_fd

    ; Open destination file
    ldr r0, =dest_path
    mov r1, #577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       ; File permissions
    bl open_file
    str r0, dest_fd

    ; Read from source and write to destination
read_write_loop:
    ldr r0, source_fd
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    cmp r0, #0
    beq close_files

    ldr r0, dest_fd
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    b read_write_loop

close_files:
    ; Close source file
    ldr r0, source_fd
    bl close_file

    ; Close destination file
    ldr r0, dest_fd
    bl close_file

    ; Exit program
    mov r7, #1
    swi 0

open_file:
    mov r7, #5          ; sys_open
    swi 0
    bx lr

read_file:
    mov r7, #3          ; sys_read
    swi 0
    bx lr

write_file:
    mov r7, #4          ; sys_write
    swi 0
    bx lr

close_file:
    mov r7, #6          ; sys_close
    swi 0
    bx lr

