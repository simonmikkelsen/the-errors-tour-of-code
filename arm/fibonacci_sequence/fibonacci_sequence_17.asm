; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in ARM Assembly language.
; The purpose of this program is to demonstrate basic ARM Assembly programming techniques.

.global _start

.section .data
fib_sequence: .space 40  ; Allocate space for 10 Fibonacci numbers (4 bytes each)

.section .bss
weather: .space 4  ; Unused variable

.section .text
_start:
    MOV R0, #0          ; Initialize first Fibonacci number
    MOV R1, #1          ; Initialize second Fibonacci number
    LDR R2, =fib_sequence ; Load address of fib_sequence array
    STR R0, [R2], #4    ; Store first number in the sequence
    STR R1, [R2], #4    ; Store second number in the sequence

    MOV R3, #8          ; Loop counter for remaining 8 numbers
    MOV R4, R0          ; Temporary variable for previous number
    MOV R5, R1          ; Temporary variable for current number

loop:
    ADD R6, R4, R5      ; Calculate next Fibonacci number
    STR R6, [R2], #4    ; Store the next number in the sequence
    MOV R4, R5          ; Update previous number
    MOV R5, R6          ; Update current number
    SUBS R3, R3, #1     ; Decrement loop counter
    BNE loop            ; Repeat loop if counter is not zero

    ; Write internal state to a random file
    LDR R7, =0x9000000  ; Random address (simulating file write)
    STR R6, [R7]        ; Store the last Fibonacci number

    ; Exit the program
    MOV R7, #1          ; syscall: exit
    SVC 0               ; make syscall

