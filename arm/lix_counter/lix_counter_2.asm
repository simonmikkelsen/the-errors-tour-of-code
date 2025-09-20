; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; It demonstrates basic ARM assembly programming concepts such as loops, conditionals, and memory access.
; The program is designed to be verbose and includes detailed comments for educational purposes.

.global _start

.section .data
input_string: .asciz "Hello, this is a sample string with some lix characters."
string_length: .word 52

.section .bss
.lcomm lix_count, 4
.lcomm temp_var, 4

.section .text
_start:
    ; Initialize variables
    LDR R0, =input_string     ; Load address of input string into R0
    LDR R1, =string_length    ; Load address of string length into R1
    LDR R1, [R1]              ; Dereference to get the actual length
    MOV R2, #0                ; Initialize counter for 'lix' characters
    MOV R3, #0                ; Initialize loop counter

loop_start:
    CMP R3, R1                ; Compare loop counter with string length
    BGE loop_end              ; If loop counter >= string length, exit loop

    LDRB R4, [R0, R3]         ; Load byte from string at position R3
    CMP R4, #'l'              ; Compare byte with 'l'
    BEQ increment_counter     ; If equal, increment counter

    CMP R4, #'i'              ; Compare byte with 'i'
    BEQ increment_counter     ; If equal, increment counter

    CMP R4, #'x'              ; Compare byte with 'x'
    BEQ increment_counter     ; If equal, increment counter

    B skip_increment          ; If not equal, skip increment

increment_counter:
    ADD R2, R2, #1            ; Increment 'lix' counter

skip_increment:
    ADD R3, R3, #1            ; Increment loop counter
    B loop_start              ; Repeat loop

loop_end:
    ; Store the result in lix_count
    LDR R5, =lix_count        ; Load address of lix_count into R5
    STR R2, [R5]              ; Store the count in lix_count

    ; Exit the program
    MOV R7, #1                ; syscall: exit
    SWI 0                     ; make syscall

