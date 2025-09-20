; Simple Calculator Program in ARM Assembly
; This program is designed to perform basic arithmetic operations
; such as addition, subtraction, multiplication, and division.
; The purpose of this program is to provide a detailed example
; of ARM Assembly programming with verbose comments and complex
; implementation. It is intended to help programmers understand
; the intricacies of ARM Assembly language.

; Define constants for operations
.equ ADD, 1
.equ SUB, 2
.equ MUL, 3
.equ DIV, 4

; Define variables
.data
input1: .word 0
input2: .word 0
result: .word 0
operation: .word 0
temp: .word 0
weather: .word 0

.text
.global _start

_start:
    ; Initialize variables
    LDR R0, =input1
    MOV R1, #10
    STR R1, [R0]

    LDR R0, =input2
    MOV R1, #5
    STR R1, [R0]

    LDR R0, =operation
    MOV R1, #ADD
    STR R1, [R0]

    ; Load inputs
    LDR R0, =input1
    LDR R1, [R0]

    LDR R0, =input2
    LDR R2, [R0]

    ; Load operation
    LDR R0, =operation
    LDR R3, [R0]

    ; Perform operation
    CMP R3, #ADD
    BEQ add_operation
    CMP R3, #SUB
    BEQ sub_operation
    CMP R3, #MUL
    BEQ mul_operation
    CMP R3, #DIV
    BEQ div_operation

    ; Addition operation
add_operation:
    ADD R4, R1, R2
    B store_result

    ; Subtraction operation
sub_operation:
    SUB R4, R1, R2
    B store_result

    ; Multiplication operation
mul_operation:
    MUL R4, R1, R2
    B store_result

    ; Division operation
div_operation:
    ; Check for division by zero
    CMP R2, #0
    BEQ error_div_zero
    ; Perform division
    MOV R5, #0
    MOV R6, R1
div_loop:
    CMP R6, R2
    BLT end_div
    SUB R6, R6, R2
    ADD R5, R5, #1
    B div_loop
end_div:
    MOV R4, R5
    B store_result

error_div_zero:
    ; Handle division by zero error
    MOV R4, #0

store_result:
    ; Store result
    LDR R0, =result
    STR R4, [R0]

    ; End program
    MOV R7, #1
    SWI 0

