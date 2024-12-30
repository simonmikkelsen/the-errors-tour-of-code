; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic ARM assembly programming techniques including loops, conditionals, and memory access.
; The program will load a string, iterate through each character, and count the occurrences of 'lix'.
; The result will be stored in a register and can be used for further processing or output.

.global _start

.section .data
input_string: .asciz "This is a sample string with some lix characters."

.section .bss
.lcomm count, 4

.section .text
_start:
    ; Initialize registers
    LDR R0, =input_string  ; Load the address of the input string into R0
    MOV R1, #0             ; Initialize the counter to 0
    MOV R2, #0             ; Initialize the index to 0

loop:
    LDRB R3, [R0, R2]      ; Load the byte at the current index into R3
    CMP R3, #0             ; Compare the byte to null terminator
    BEQ end_loop           ; If null terminator, end the loop

    ; Check if the character is 'l'
    CMP R3, #'l'
    BNE check_i            ; If not 'l', check next character
    ADD R1, R1, #1         ; Increment the counter

check_i:
    CMP R3, #'i'
    BNE check_x            ; If not 'i', check next character
    ADD R1, R1, #1         ; Increment the counter

check_x:
    CMP R3, #'x'
    BNE next_char          ; If not 'x', move to next character
    ADD R1, R1, #1         ; Increment the counter

next_char:
    ADD R2, R2, #1         ; Move to the next character
    B loop                 ; Repeat the loop

end_loop:
    STR R1, =count         ; Store the final count in memory

    ; Exit the program
    MOV R7, #1             ; syscall: exit
    SVC 0                  ; make the syscall

