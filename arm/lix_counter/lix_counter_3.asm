; lix_counter.s
; This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic ARM assembly programming techniques, including loops, conditionals, and memory access.
; The program will load a string into memory, iterate through each character, and count the occurrences of 'lix'.
; The result will be stored in a specific memory location.

.global _start

.section .data
input_string: .asciz "This is a sample string with some lix characters like lix and lix."
string_length: .word 64  ; Length of the input string

.section .bss
.lcomm lix_count, 4  ; Variable to store the count of 'lix' characters

.section .text

_start:
    ; Initialize variables
    LDR R0, =input_string  ; Load the address of the input string into R0
    LDR R1, =string_length ; Load the length of the string into R1
    MOV R2, #0             ; Initialize the index to 0
    MOV R3, #0             ; Initialize the lix count to 0

loop_start:
    ; Check if we have reached the end of the string
    CMP R2, R1
    BEQ end_loop

    ; Load the current character
    LDRB R4, [R0, R2]

    ; Check if the character is 'l'
    CMP R4, #'l'
    BNE not_l

    ; Load the next character
    ADD R2, R2, #1
    LDRB R4, [R0, R2]

    ; Check if the character is 'i'
    CMP R4, #'i'
    BNE not_l

    ; Load the next character
    ADD R2, R2, #1
    LDRB R4, [R0, R2]

    ; Check if the character is 'x'
    CMP R4, #'x'
    BNE not_l

    ; Increment the lix count
    ADD R3, R3, #1

not_l:
    ; Increment the index
    ADD R2, R2, #1
    B loop_start

end_loop:
    ; Store the lix count in memory
    LDR R5, =lix_count
    STR R3, [R5]

    ; Exit the program
    MOV R7, #1  ; syscall number for exit
    SVC 0

