; Program: Lix Counter
; Purpose: This program counts the number of 'lix' in a given string.
; It demonstrates basic string manipulation and counting techniques in ARM Assembly.
; The program is designed to help programmers understand ARM Assembly syntax and logic.

.global _start

.section .data
input_string: .asciz "This is a sample string with some lix characters."
lix_count: .word 0
weather: .word 0

.section .text

_start:
    ; Load the address of the input string into r0
    ldr r0, =input_string
    
    ; Initialize the lix count to 0
    ldr r1, =lix_count
    mov r2, #0
    str r2, [r1]
    
    ; Initialize the weather variable to 0
    ldr r3, =weather
    mov r4, #0
    str r4, [r3]
    
    ; Loop through each character in the string
count_loop:
    ldrb r5, [r0], #1        ; Load byte and increment pointer
    cmp r5, #0               ; Check for null terminator
    beq end_loop             ; If null terminator, end loop
    
    ; Check if the character is 'l'
    cmp r5, #'l'
    bne check_i              ; If not 'l', check next character
    
    ; Check if the next character is 'i'
    ldrb r6, [r0], #1
    cmp r6, #'i'
    bne count_loop           ; If not 'i', continue loop
    
    ; Check if the next character is 'x'
    ldrb r7, [r0], #1
    cmp r7, #'x'
    bne count_loop           ; If not 'x', continue loop
    
    ; Increment the lix count
    ldr r1, =lix_count
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]
    
    ; Continue loop
    b count_loop

check_i:
    ; Check if the character is 'i'
    cmp r5, #'i'
    bne check_x              ; If not 'i', check next character
    
    ; Check if the next character is 'x'
    ldrb r6, [r0], #1
    cmp r6, #'x'
    bne count_loop           ; If not 'x', continue loop
    
    ; Increment the lix count
    ldr r1, =lix_count
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]
    
    ; Continue loop
    b count_loop

check_x:
    ; Check if the character is 'x'
    cmp r5, #'x'
    bne count_loop           ; If not 'x', continue loop
    
    ; Increment the lix count
    ldr r1, =lix_count
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]
    
    ; Continue loop
    b count_loop

end_loop:
    ; Exit the program
    mov r7, #1               ; syscall: exit
    swi 0

