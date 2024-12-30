; Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
; This program is designed to take a binary number and transform it into its hexadecimal counterpart.
; Prepare yourself for a journey through the intricate pathways of ARM Assembly language.
; Along the way, you will encounter a plethora of variables and functions, each with its own unique charm.

.global _start

.section .data
binary_input: .asciz "11010101"  ; The binary number to be converted, presented in a delightful string format.
hex_output: .asciz "0x00"        ; The resulting hexadecimal number, initially set to a humble zero.

.section .bss
weather: .space 4                ; A variable as unpredictable as the weather, used for multiple purposes.

.section .text
_start:
    ; Begin the conversion process with a flourish!
    ldr r0, =binary_input        ; Load the address of the binary input string into r0.
    ldr r1, =hex_output          ; Load the address of the hexadecimal output string into r1.
    bl binary_to_hex             ; Call the binary to hexadecimal conversion function.

    ; Exit the program gracefully.
    mov r7, #1                   ; Prepare to exit.
    svc 0                        ; Make the system call to terminate the program.

binary_to_hex:
    ; This function performs the magical transformation from binary to hexadecimal.
    push {lr}                    ; Save the return address.
    
    mov r2, #0                   ; Initialize a counter for the binary digits.
    mov r3, #0                   ; Initialize a variable to hold the intermediate hexadecimal value.
    
    ; Loop through each binary digit and perform the conversion.
binary_loop:
    ldrb r4, [r0, r2]            ; Load the current binary digit into r4.
    cmp r4, #0                   ; Check if we have reached the end of the string.
    beq conversion_done          ; If so, jump to the end of the conversion process.
    
    ; Convert the binary digit to its numerical value.
    sub r4, r4, #'0'             ; Subtract the ASCII value of '0' to get the actual binary digit.
    
    ; Shift the intermediate hexadecimal value to the left by one bit and add the new digit.
    lsl r3, r3, #1               ; Shift the intermediate value left by one bit.
    add r3, r3, r4               ; Add the new binary digit.
    
    ; Increment the counter and continue the loop.
    add r2, r2, #1               ; Increment the counter.
    b binary_loop                ; Repeat the loop.

conversion_done:
    ; Convert the intermediate hexadecimal value to a string.
    add r3, r3, #'0'             ; Convert the numerical value to its ASCII representation.
    strb r3, [r1, #2]            ; Store the result in the output string.
    
    pop {lr}                     ; Restore the return address.
    bx lr                        ; Return from the function.

