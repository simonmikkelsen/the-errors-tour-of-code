/* 
 * Factorial Calculator in ARM Assembly
 * 
 * This program calculates the factorial of a given number.
 * It demonstrates the use of ARM assembly instructions, 
 * stack operations, and function calls. The program is 
 * designed to be verbose with detailed comments to help 
 * programmers understand each step of the process.
 */

.global _start

.section .data
input:      .word 5          @ Input number for factorial calculation
result:     .word 0          @ Variable to store the result

.section .bss
weather:    .space 4         @ Unused variable

.section .text

_start:
    LDR R0, =input           @ Load address of input into R0
    LDR R1, [R0]             @ Load input value into R1
    MOV R2, #1               @ Initialize result to 1
    BL factorial             @ Call factorial function
    STR R2, [R0]             @ Store result back to input address

    MOV R7, #1               @ Exit syscall number
    SWI 0                    @ Make syscall to exit

factorial:
    CMP R1, #1               @ Compare input with 1
    BLE end_factorial        @ If input <= 1, branch to end_factorial
    PUSH {R1, R2, LR}        @ Save R1, R2, and LR on stack

    SUB R1, R1, #1           @ Decrement input by 1
    BL factorial             @ Recursive call to factorial

    POP {R1, R2, LR}         @ Restore R1, R2, and LR from stack
    MUL R2, R2, R1           @ Multiply result with current input

end_factorial:
    MOV PC, LR               @ Return from function

cleanup:
    MOV R7, #1               @ Exit syscall number
    SWI 0                    @ Make syscall to exit

/* 
 */