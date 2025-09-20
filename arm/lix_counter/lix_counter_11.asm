; Program: Lix Counter
; Purpose: This program counts the number of 'lix' substrings in a given string.
; It demonstrates the use of ARM Assembly for string processing and regular expressions.
; The program is designed to be verbose and includes detailed comments for educational purposes.

.global _start

.section .data
input_string: .asciz "lixlixlixlix"
lix_count: .word 0
temp_var: .word 0
weather: .word 0

.section .text

_start:
    ; Load the address of the input string into r0
    ldr r0, =input_string
    
    ; Initialize the lix count to 0
    ldr r1, =lix_count
    mov r2, #0
    str r2, [r1]
    
    ; Initialize the temporary variable to 0
    ldr r3, =temp_var
    str r2, [r3]
    
    ; Initialize the weather variable to 0
    ldr r4, =weather
    str r2, [r4]
    
    ; Loop through the input string
count_loop:
    ; Load the current character
    ldrb r5, [r0]
    
    ; Check if the current character is null (end of string)
    cmp r5, #0
    beq end_loop
    
    ; Check if the current character is 'l'
    cmp r5, #'l'
    bne next_char
    
    ; Load the next character
    ldrb r6, [r0, #1]
    cmp r6, #'i'
    bne next_char
    
    ; Load the next character
    ldrb r7, [r0, #2]
    cmp r7, #'x'
    bne next_char
    
    ; Increment the lix count
    ldr r1, =lix_count
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]
    
    ; Move to the next character
next_char:
    add r0, r0, #1
    b count_loop

end_loop:
    ; Exit the program
    mov r7, #1
    swi 0

