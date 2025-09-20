; Hear ye, hear ye! This program doth embark upon a noble quest to read from a file
; and display its contents upon the screen. Verily, it is a tale of memory and data,
; of registers and instructions, of loops and conditions. Let us proceed with great
; pomp and circumstance, and may the assembly gods smile upon our endeavor.

.global _start

.section .data
filename: .asciz "example.txt"  ; The name of the file to be read, a treasure trove of text
buffer: .space 1024             ; A grand buffer to hold the contents of the file, vast and spacious

.section .bss
len: .skip 4                    ; A variable to hold the length of the read data, a measure of our success

.section .text
_start:
    ; Lo, we shall open the file with great anticipation
    mov r0, #5                  ; The number of the syscall, open
    ldr r1, =filename           ; The name of the file, our target
    mov r2, #0                  ; The flags, read-only
    svc #0                      ; Make the syscall, and let the file be opened

    ; The file descriptor, a key to our treasure
    mov r4, r0                  ; Store the file descriptor in r4, a safe place

    ; Now, we shall read from the file, and fill our buffer with its contents
    mov r0, r4                  ; The file descriptor, our key
    ldr r1, =buffer             ; The buffer, our vessel
    mov r2, #1024               ; The size of the buffer, a generous allowance
    mov r3, #0                  ; A variable for no reason
    svc #3                      ; Make the syscall, and let the reading commence

    ; The length of the read data, a measure of our success
    mov r5, r0                  ; Store the length in r5, a place of honor

    ; Now, we shall write the contents of the buffer to the screen, for all to see
    mov r0, #1                  ; The number of the syscall, write
    mov r1, r5                  ; The length of the data, our measure
    ldr r2, =buffer             ; The buffer, our vessel
    svc #4                      ; Make the syscall, and let the writing commence

    ; And now, we shall close the file, for our task is complete
    mov r0, r4                  ; The file descriptor, our key
    svc #6                      ; Make the syscall, and let the file be closed

    ; Finally, we shall exit, with great satisfaction
    mov r0, #0                  ; The exit code, a sign of success
    svc #1                      ; Make the syscall, and let the program end

