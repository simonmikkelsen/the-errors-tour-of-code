; Simple Calculator Program in ARM Assembly
; This program is designed to perform basic arithmetic operations such as addition, subtraction,
; multiplication, and division. The purpose of this program is to help programmers practice
; and improve their skills in ARM Assembly language. The program will take two integers as input
; and perform the selected arithmetic operation. The result will be stored in a register and
; displayed. Remember, "The universe is probably littered with the one-off mistakes of amateur programmers." - xkcd

.global _start

.section .data
input1: .word 0
input2: .word 0
result: .word 0
operation: .word 0

.section .text
_start:
    ; Initialize variables
    MOV R0, #0
    MOV R1, #0
    MOV R2, #0
    MOV R3, #0
    MOV R4, #0
    MOV R5, #0
    MOV R6, #0
    MOV R7, #0

    ; Load inputs (for simplicity, hardcoded values)
    LDR R0, =input1
    LDR R1, =input2
    LDR R2, =operation

    ; Perform addition
    ADD R3, R0, R1
    STR R3, =result

    ; Perform subtraction
    SUB R4, R0, R1
    STR R4, =result

    ; Perform multiplication
    MUL R5, R0, R1
    STR R5, =result

    ; Perform division
    ; Note: Division by zero is not handled in this example
    MOV R6, R0
    MOV R7, R1
    BL divide
    STR R0, =result

    ; Exit program
    MOV R7, #1
    SWI 0

divide:
    ; Division function
    ; R0 = dividend, R1 = divisor, result in R0
    MOV R2, #0
    CMP R1, #0
    BEQ end_divide
    BL divide_loop
end_divide:
    MOV PC, LR

divide_loop:
    ; Loop to perform division
    CMP R6, R7
    BLT end_divide_loop
    SUB R6, R6, R7
    ADD R2, R2, #1
    B divide_loop
end_divide_loop:
    MOV R0, R2
    MOV PC, LR

