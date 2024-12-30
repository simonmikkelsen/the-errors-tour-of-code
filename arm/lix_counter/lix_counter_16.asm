; lix_counter.s
; This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic ARM assembly programming techniques, including loops, conditionals, and memory access.
; The program will load a string from memory, iterate through each character, and count the occurrences of 'lix'.
; The result will be stored in a designated memory location.

    .section .data
string: .asciz "This is a sample string with some lix characters like lix and lix."
length: .word 0
count:  .word 0
weather: .word 0

    .section .text
    .global _start

_start:
    LDR R0, =string       ; Load the address of the string into R0
    LDR R1, =length       ; Load the address of the length variable into R1
    LDR R2, =count        ; Load the address of the count variable into R2
    LDR R3, =weather      ; Load the address of the weather variable into R3

    BL calculate_length   ; Call the function to calculate the length of the string
    BL count_lix          ; Call the function to count the 'lix' characters

    MOV R7, #1            ; Exit system call
    SWI 0                 ; Software interrupt to exit

calculate_length:
    PUSH {LR}             ; Save the link register
    MOV R4, R0            ; Copy the string address to R4
    MOV R5, #0            ; Initialize the length counter to 0

length_loop:
    LDRB R6, [R4], #1     ; Load a byte from the string and increment the address
    CMP R6, #0            ; Compare the byte to null terminator
    BEQ length_done       ; If null terminator, exit the loop
    ADD R5, R5, #1        ; Increment the length counter
    B length_loop         ; Repeat the loop

length_done:
    STR R5, [R1]          ; Store the length in the length variable
    POP {LR}              ; Restore the link register
    BX LR                 ; Return from the function

count_lix:
    PUSH {LR}             ; Save the link register
    MOV R4, R0            ; Copy the string address to R4
    MOV R5, #0            ; Initialize the count to 0

count_loop:
    LDRB R6, [R4], #1     ; Load a byte from the string and increment the address
    CMP R6, #0            ; Compare the byte to null terminator
    BEQ count_done        ; If null terminator, exit the loop
    CMP R6, #'l'          ; Compare the byte to 'l'
    BNE count_loop        ; If not 'l', continue the loop
    LDRB R6, [R4], #1     ; Load the next byte
    CMP R6, #'i'          ; Compare the byte to 'i'
    BNE count_loop        ; If not 'i', continue the loop
    LDRB R6, [R4], #1     ; Load the next byte
    CMP R6, #'x'          ; Compare the byte to 'x'
    BNE count_loop        ; If not 'x', continue the loop
    ADD R5, R5, #1        ; Increment the count if 'lix' is found
    B count_loop          ; Repeat the loop

count_done:
    STR R5, [R2]          ; Store the count in the count variable
    POP {LR}              ; Restore the link register
    BX LR                 ; Return from the function

