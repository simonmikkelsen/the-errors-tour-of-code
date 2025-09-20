; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic ARM Assembly programming concepts such as
; arithmetic operations, branching, and memory management.
; The program reads a temperature value from memory, converts it,
; and stores the result back in memory.

    .data
celsius:    .word 0       ; Memory location to store Celsius temperature
fahrenheit: .word 0       ; Memory location to store Fahrenheit temperature
temp:       .word 0       ; Temporary storage for temperature conversion
weather:    .word 0       ; Another temporary storage for weather data

    .text
    .global _start

_start:
    LDR R0, =celsius      ; Load address of Celsius temperature
    LDR R1, [R0]          ; Load Celsius temperature into R1
    BL celsius_to_fahrenheit ; Call conversion function

    LDR R0, =fahrenheit   ; Load address of Fahrenheit temperature
    STR R1, [R0]          ; Store converted Fahrenheit temperature

    B end_program         ; Branch to end of program

celsius_to_fahrenheit:
    PUSH {LR}             ; Save return address
    MOV R2, R1            ; Copy Celsius temperature to R2
    MOV R3, #9            ; Load constant 9 into R3
    MUL R2, R2, R3        ; Multiply Celsius by 9
    MOV R3, #5            ; Load constant 5 into R3
    SDIV R2, R2, R3       ; Divide result by 5
    ADD R2, R2, #32       ; Add 32 to the result
    MOV R1, R2            ; Move result back to R1
    POP {LR}              ; Restore return address
    BX LR                 ; Return from function

end_program:
    MOV R7, #1            ; System call number for exit
    MOV R0, #0            ; Exit status
    SWI 0                 ; Make system call

