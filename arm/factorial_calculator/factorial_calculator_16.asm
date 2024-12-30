; Factorial Calculator in ARM Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of ARM Assembly language
; and to provide a detailed example with verbose comments for educational purposes.

.global _start

.section .data
input:      .word 5          ; Input number for which factorial is to be calculated
result:     .word 1          ; Variable to store the result of the factorial calculation
temp:       .word 0          ; Temporary variable for intermediate calculations
weather:    .word 0          ; Another temporary variable for intermediate calculations

.section .text
_start:
    LDR R0, =input           ; Load the address of the input variable into R0
    LDR R1, [R0]             ; Load the value of the input variable into R1
    MOV R2, #1               ; Initialize R2 to 1 (this will be used as a counter)
    LDR R3, =result          ; Load the address of the result variable into R3
    MOV R4, #1               ; Initialize R4 to 1 (this will store the factorial result)
    LDR R5, =temp            ; Load the address of the temp variable into R5
    LDR R6, =weather         ; Load the address of the weather variable into R6

factorial_loop:
    CMP R2, R1               ; Compare the counter (R2) with the input number (R1)
    BGT end_factorial        ; If counter is greater than input number, exit the loop
    STR R4, [R5]             ; Store the current factorial result in temp
    MUL R4, R4, R2           ; Multiply the current factorial result by the counter
    ADD R2, R2, #1           ; Increment the counter
    B factorial_loop         ; Repeat the loop

end_factorial:
    STR R4, [R3]             ; Store the final factorial result in the result variable

    ; Exit the program
    MOV R7, #1               ; syscall: exit
    SWI 0                    ; make syscall

