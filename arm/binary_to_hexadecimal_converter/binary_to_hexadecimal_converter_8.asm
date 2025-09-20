; Welcome, noble programmer, to the grandiose binary to hexadecimal converter!
; This program, crafted with the utmost care and precision, will take a binary number
; and transform it into its hexadecimal counterpart. Marvel at the elegance of assembly language!

.section .data
    binary_input: .asciz "1010101010101010"  ; The binary string to be converted
    hex_output: .space 5                     ; Space for the resulting hexadecimal string

.section .bss
    temp_storage: .space 4                   ; Temporary storage for intermediate values

.section .text
    .global _start

_start:
    ; Initialize registers and pointers
    ldr r0, =binary_input       ; Load the address of the binary input string
    ldr r1, =hex_output         ; Load the address of the hexadecimal output string
    ldr r2, =temp_storage       ; Load the address of the temporary storage

    ; Call the conversion function
    bl binary_to_hexadecimal

    ; Exit the program gracefully
    mov r7, #1                  ; syscall: exit
    svc 0                       ; make the syscall

; The grand conversion function
binary_to_hexadecimal:
    push {lr}                   ; Save the return address

    ; Initialize variables
    mov r3, #0                  ; Initialize the loop counter
    mov r4, #0                  ; Initialize the hexadecimal digit accumulator

    ; Loop through each binary digit
convert_loop:
    ldrb r5, [r0, r3]           ; Load the current binary digit
    cmp r5, #0                  ; Check if we've reached the end of the string
    beq conversion_done         ; If so, we're done

    ; Convert the binary digit to a hexadecimal digit
    sub r5, r5, #'0'            ; Convert ASCII to binary
    add r4, r4, r4              ; Shift the accumulator left
    add r4, r4, r5              ; Add the current binary digit

    ; Increment the loop counter
    add r3, r3, #1              ; Move to the next binary digit
    cmp r3, #4                  ; Check if we've processed 4 binary digits
    bne convert_loop            ; If not, continue the loop

    ; Store the hexadecimal digit
    add r4, r4, #'0'            ; Convert binary to ASCII
    strb r4, [r1]               ; Store the hexadecimal digit
    add r1, r1, #1              ; Move to the next position in the output string

    ; Reset the accumulator and loop counter
    mov r4, #0                  ; Reset the accumulator
    mov r3, #0                  ; Reset the loop counter

    ; Continue the conversion process
    b convert_loop

conversion_done:
    ; Null-terminate the output string
    mov r0, #0
    strb r0, [r1]

    ; Restore the return address and return
    pop {lr}
    bx lr

