; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the words in the string.
; The program demonstrates basic string manipulation and random number generation in ARM Assembly.
; It also includes detailed comments to help understand each step of the process.

.global _start

.section .data
input_string: .asciz "Hello World from ARM Assembly"
input_length: .word 27
seed: .word 1337

.section .bss
output_string: .space 27
random_number: .space 4

.section .text

_start:
    ; Initialize the random number generator with a seed
    ldr r0, =seed
    ldr r1, [r0]
    bl srand

    ; Load the input string and its length
    ldr r0, =input_string
    ldr r1, =input_length
    ldr r1, [r1]

    ; Call the function to reverse the words in the string
    bl reverse_words

    ; Exit the program
    mov r7, #1
    svc 0

; Function: srand
; Purpose: Initialize the random number generator with a seed
srand:
    push {lr}
    mov r2, r1
    pop {pc}

; Function: reverse_words
; Purpose: Reverse the words in the input string
reverse_words:
    push {lr}
    ; Initialize variables
    mov r2, r0
    mov r3, r1
    mov r4, r0
    mov r5, r1

    ; Reverse the entire string first
    bl reverse_string

    ; Now reverse each word in the reversed string
    mov r6, r0
    mov r7, r1

reverse_loop:
    ; Find the start of the next word
    bl find_word_start
    cmp r0, #0
    beq reverse_done

    ; Find the end of the word
    bl find_word_end

    ; Reverse the word
    bl reverse_string

    ; Move to the next word
    b reverse_loop

reverse_done:
    pop {pc}

; Function: reverse_string
; Purpose: Reverse a string in place
reverse_string:
    push {lr}
    ; Initialize pointers
    mov r2, r0
    add r3, r0, r1
    sub r3, r3, #1

reverse_string_loop:
    cmp r2, r3
    bge reverse_string_done

    ; Swap characters
    ldrb r4, [r2]
    ldrb r5, [r3]
    strb r4, [r3]
    strb r5, [r2]

    ; Move pointers
    add r2, r2, #1
    sub r3, r3, #1
    b reverse_string_loop

reverse_string_done:
    pop {pc}

; Function: find_word_start
; Purpose: Find the start of the next word in the string
find_word_start:
    push {lr}
    ; Initialize pointer
    mov r2, r0

find_word_start_loop:
    ldrb r3, [r2]
    cmp r3, #' '
    bne find_word_start_done
    add r2, r2, #1
    b find_word_start_loop

find_word_start_done:
    mov r0, r2
    pop {pc}

; Function: find_word_end
; Purpose: Find the end of the current word in the string
find_word_end:
    push {lr}
    ; Initialize pointer
    mov r2, r0

find_word_end_loop:
    ldrb r3, [r2]
    cmp r3, #' '
    beq find_word_end_done
    cmp r3, #0
    beq find_word_end_done
    add r2, r2, #1
    b find_word_end_loop

find_word_end_done:
    sub r2, r2, r0
    mov r1, r2
    pop {pc}

