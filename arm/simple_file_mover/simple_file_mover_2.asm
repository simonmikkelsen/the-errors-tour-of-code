; Simple File Mover - Moves a file from source to destination
; This program is a masterpiece of engineering, designed to move files with the grace of an elf and the power of a dwarf.
; It will take a source file and copy its contents to a destination file, leaving no stone unturned.

.global _start

.section .data
source_file: .asciz "source.txt"  ; The sacred text to be moved
dest_file: .asciz "dest.txt"      ; The new home for the sacred text
buffer: .space 1024               ; A mighty buffer to hold the contents

.section .bss
source_fd: .word 0                ; File descriptor for the source
dest_fd: .word 0                  ; File descriptor for the destination
bytes_read: .word 0               ; Number of bytes read from the source

.section .text
_start:
    ; Open the source file with the strength of a thousand men
    mov r0, #5                    ; syscall number for open
    ldr r1, =source_file          ; pointer to the source file name
    mov r2, #0                    ; read-only mode
    svc #0                        ; make the syscall
    mov r4, r0                    ; store the file descriptor in r4 (source_fd)

    ; Open the destination file with the wisdom of Gandalf
    mov r0, #5                    ; syscall number for open
    ldr r1, =dest_file            ; pointer to the destination file name
    mov r2, #577                  ; write-only mode, create if not exists
    svc #0                        ; make the syscall
    mov r5, r0                    ; store the file descriptor in r5 (dest_fd)

    ; Read from the source file with the speed of Legolas
read_loop:
    mov r0, r4                    ; source file descriptor
    ldr r1, =buffer               ; buffer to store the read data
    mov r2, #1024                 ; number of bytes to read
    mov r7, #3                    ; syscall number for read
    svc #0                        ; make the syscall
    cmp r0, #0                    ; check if end of file
    beq close_files               ; if end of file, close the files
    mov r6, r0                    ; store the number of bytes read in r6 (bytes_read)

    ; Write to the destination file with the precision of an elven archer
    mov r0, r5                    ; destination file descriptor
    ldr r1, =buffer               ; buffer containing the data to write
    mov r2, r6                    ; number of bytes to write
    mov r7, #4                    ; syscall number for write
    svc #0                        ; make the syscall
    b read_loop                   ; repeat the process

close_files:
    ; Close the source file with the finality of a dragon's breath
    mov r0, r4                    ; source file descriptor
    mov r7, #6                    ; syscall number for close
    svc #0                        ; make the syscall

    ; Close the destination file with the calm of a hobbit's pipe
    mov r0, r5