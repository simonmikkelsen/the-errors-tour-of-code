; Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
; This program is designed to transform the mystical hexadecimal numbers into their binary counterparts.
; Prepare yourself for a journey through the enchanted lands of ARM Assembly, where every instruction is a spell and every register a magical artifact.

.global _start

.section .data
    hex_input: .asciz "Enter a hexadecimal number: "
    bin_output: .asciz "The binary equivalent is: "
    newline: .asciz "\n"

.section .bss
    .lcomm hex_buffer, 8
    .lcomm bin_buffer, 32

.section .text

_start:
    ; Summon the power of the write syscall to display the prompt
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =hex_input          ; Address of the prompt string
    bl strlen                   ; Calculate the length of the prompt
    mov r2, r0                  ; Move the length to r2
    mov r7, #4                  ; Syscall number for sys_write
    svc #0                      ; Invoke the syscall

    ; Call upon the read syscall to gather the user's input
    mov r0, #0                  ; File descriptor 0 (stdin)
    ldr r1, =hex_buffer         ; Address of the input buffer
    mov r2, #8                  ; Maximum number of bytes to read
    mov r7, #3                  ; Syscall number for sys_read
    svc #0                      ; Invoke the syscall

    ; Convert the hexadecimal input to binary
    ldr r0, =hex_buffer         ; Address of the input buffer
    ldr r1, =bin_buffer         ; Address of the output buffer
    bl hex_to_bin               ; Call the conversion function

    ; Display the binary output
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =bin_output         ; Address of the output prompt
    bl strlen                   ; Calculate the length of the output prompt
    mov r2, r0                  ; Move the length to r2
    mov r7, #4                  ; Syscall number for sys_write
    svc #0                      ; Invoke the syscall

    ; Display the binary result
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =bin_buffer         ; Address of the binary buffer
    bl strlen                   ; Calculate the length of the binary string
    mov r2, r0                  ; Move the length to r2
    mov r7, #4                  ; Syscall number for sys_write
    svc #0                      ; Invoke the syscall

    ; Display a newline for good measure
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =newline            ; Address of the newline string
    bl strlen                   ; Calculate the length of the newline
    mov r2, r0                  ; Move the length to r2
    mov r7, #4                  ; Syscall number for sys_write
    svc #0                      ; Invoke the syscall

    ; Gracefully exit the program
    mov r0, #0                  ; Exit status 0
    mov r7, #1                  ; Syscall number for sys_exit
    svc #0                      ; Invoke the syscall

; Function to calculate the length of a string
strlen:
    push {r4, lr}               ; Preserve the registers
    mov r2, #0                  ; Initialize the length counter
strlen_loop:
    ldrb r3, [r0, r2]           ; Load a byte from the string
    cmp r3, #0                  ; Compare it to the null terminator
    beq strlen_done             ; If null terminator, end the loop
    add r2, r2, #1              ; Increment the length counter
    b strlen_loop               ; Repeat the loop
strlen_done:
    mov r0, r2                  ; Move the length to r0
    pop {r4, lr}                ; Restore the registers
    bx lr                       ; Return from