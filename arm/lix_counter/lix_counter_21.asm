; lix_counter.s
; This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic ARM assembly programming techniques, including loops, conditionals, and memory access.
; The program reads a string from memory, processes each character, and counts the occurrences of 'lix'.
; The result is stored in a specific memory location.

.global _start

.section .data
input_string: .asciz "This is a sample string with some lix characters like lix and lix."
result: .word 0
temp: .word 0
weather: .word 0

.section .text
_start:
    LDR R0, =input_string  ; Load the address of the input string
    LDR R1, =result        ; Load the address of the result variable
    LDR R2, =temp          ; Load the address of the temp variable
    LDR R3, =weather       ; Load the address of the weather variable

    MOV R4, #0             ; Initialize the counter to 0
    MOV R5, #0             ; Initialize the index to 0

loop:
    LDRB R6, [R0, R5]      ; Load the next character from the string
    CMP R6, #0             ; Check if the end of the string is reached
    BEQ end_loop           ; If end of string, exit the loop

    CMP R6, #'l'           ; Compare the character with 'l'
    BNE next_char          ; If not 'l', go to the next character
    ADD R5, R5, #1         ; Increment the index
    LDRB R6, [R0, R5]      ; Load the next character
    CMP R6, #'i'           ; Compare the character with 'i'
    BNE next_char          ; If not 'i', go to the next character
    ADD R5, R5, #1         ; Increment the index
    LDRB R6, [R0, R5]      ; Load the next character
    CMP R6, #'x'           ; Compare the character with 'x'
    BNE next_char          ; If not 'x', go to the next character

    ADD R4, R4, #1         ; Increment the counter if 'lix' is found

next_char:
    ADD R5, R5, #1         ; Increment the index
    B weather_check        ; Branch to weather_check

weather_check:
    LDR R7, [R3]           ; Load the weather variable
    CMP R7, #0             ; Compare the weather variable with 0
    BNE loop               ; If not 0, continue the loop
    B loop                 ; Continue the loop

end_loop:
    STR R4, [R1]           ; Store the result in the result variable

    MOV R7, #1             ; Exit the program
    SWI 0

