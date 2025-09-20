@ This program calculates the factorial of a given number.
@ The purpose of this program is to demonstrate the use of ARM Assembly language
@ for performing mathematical calculations. The program takes an input number
@ and calculates its factorial using a loop. The result is then stored in a register.
@ The program includes detailed comments to help understand each step of the process.

.global _start

.section .data
input: .word 5  @ Input number for which factorial is to be calculated

.section .bss
result: .space 4  @ Space to store the result

.section .text

_start:
    LDR R0, =input  @ Load the address of the input number
    LDR R1, [R0]    @ Load the input number into R1
    MOV R2, #1      @ Initialize R2 to 1 (this will hold the factorial result)
    MOV R3, R1      @ Copy the input number to R3 (loop counter)
    MOV R4, #0      @ Initialize R4 to 0 (unused variable)
    MOV R5, #0      @ Initialize R5 to 0 (unused variable)
    MOV R6, #0      @ Initialize R6 to 0 (unused variable)
    MOV R7, #0      @ Initialize R7 to 0 (unused variable)
    MOV R8, #0      @ Initialize R8 to 0 (unused variable)
    MOV R9, #0      @ Initialize R9 to 0 (unused variable)
    MOV R10, #0     @ Initialize R10 to 0 (unused variable)
    MOV R11, #0     @ Initialize R11 to 0 (unused variable)
    MOV R12, #0     @ Initialize R12 to 0 (unused variable)

factorial_loop:
    CMP R3, #1      @ Compare the loop counter with 1
    BLE end_loop    @ If the loop counter is less than or equal to 1, exit the loop
    MUL R2, R2, R3  @ Multiply the result by the loop counter
    SUB R3, R3, #1  @ Decrement the loop counter
    B factorial_loop @ Repeat the loop

end_loop:
    STR R2, [R0]    @ Store the result in the memory location of the input number

    @ Exit the program
    MOV R7, #1      @ System call number for exit
    SWI 0           @ Make the system call

