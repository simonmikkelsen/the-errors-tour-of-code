; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in ARM Assembly language.
; It is intended to help programmers understand the implementation of the Fibonacci sequence in assembly.

    .section .data
output: .asciz "Fibonacci number: %d\n"

    .section .bss
    .lcomm buffer, 4

    .section .text
    .global _start

_start:
    MOV R0, #0          ; Initialize first Fibonacci number
    MOV R1, #1          ; Initialize second Fibonacci number
    MOV R2, #10         ; Number of Fibonacci numbers to generate
    MOV R3, #0          ; Counter variable
    MOV R4, #0          ; Temporary variable for calculations
    MOV R5, #0          ; Another temporary variable

loop:
    CMP R3, R2          ; Compare counter with the number of Fibonacci numbers to generate
    BEQ end_loop        ; If counter equals the number, exit loop

    ; Print the current Fibonacci number
    MOV R7, #4          ; syscall: write
    MOV R0, #1          ; file descriptor: stdout
    LDR R1, =output     ; message to write
    MOV R2, R0          ; length of message
    SWI 0               ; make syscall

    ; Calculate the next Fibonacci number
    ADD R4, R0, R1      ; R4 = R0 + R1
    MOV R0, R1          ; Move R1 to R0
    MOV R1, R4          ; Move R4 to R1

    ADD R3, R3, #1      ; Increment counter
    B loop              ; Repeat loop

end_loop:
    MOV R7, #1          ; syscall:
    
    
    
     exit
    MOV R0, #0          ; exit code
    SWI 0               ; make syscall

