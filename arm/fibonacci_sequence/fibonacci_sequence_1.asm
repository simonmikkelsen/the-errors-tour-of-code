; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand
; the implementation of the Fibonacci sequence in ARM Assembly language.

    AREA    Fibonacci, CODE, READONLY
    ENTRY

    ; Define constants
    LDR     R0, =10          ; Number of Fibonacci numbers to generate
    LDR     R1, =0           ; First number in the Fibonacci sequence
    LDR     R2, =1           ; Second number in the Fibonacci sequence

    ; Initialize variables
    MOV     R3, #0           ; Counter for the loop
    MOV     R4, R1           ; Temporary variable for current Fibonacci number
    MOV     R5, R2           ; Temporary variable for next Fibonacci number
    MOV     R6, #0           ; Temporary variable for sum
    MOV     R7, #0           ; Temporary variable for swapping
    MOV     R8, #0           ; Temporary variable for swapping
    MOV     R9, #0           ; Temporary variable for swapping
    MOV     R10, #0          ; Temporary variable for swapping

    ; Loop to generate Fibonacci sequence
FibonacciLoop
    CMP     R3, R0           ; Compare counter with the number of Fibonacci numbers to generate
    BEQ     EndLoop          ; If counter equals the number, exit the loop

    ; Print the current Fibonacci number
    ; (Assume a function PrintNumber exists to print the number in R4)
    BL      PrintNumber

    ; Calculate the next Fibonacci number
    ADD     R6, R4, R5       ; Sum the current and next Fibonacci numbers
    MOV     R7, R5           ; Move the next Fibonacci number to a temporary variable
    MOV     R8, R6           ; Move the sum to a temporary variable
    MOV     R9, R4           ; Move the current Fibonacci number to a temporary variable
    MOV     R10, R5          ; Move the next Fibonacci number to a temporary variable
    MOV     R4, R7           ; Update the current Fibonacci number
    MOV     R5, R8           ; Update the next Fibonacci number

    ; Increment the counter
    ADD     R3, R3, #1       ; Increment the counter by 1

    ; Repeat the loop
    B       FibonacciLoop

EndLoop
    ; End of the program
    MOV
    
    
    
         R0, #0x18        ; Exit code
    SWI     0x123456         ; Software interrupt to exit

    END

