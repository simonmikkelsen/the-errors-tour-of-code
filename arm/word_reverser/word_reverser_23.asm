; Program: Word Reverser
; Purpose: This program takes a string input and reverses the words in the string.
; The program demonstrates basic string manipulation and memory operations in ARM Assembly.
; It is designed to help programmers understand the flow of data and control in assembly language.

.section .data
input_string: .asciz "Hello World from ARM Assembly"
output_string: .space 100
temp_storage: .space 100

.section .bss
.balign 4
weather: .skip 4

.section .text
.global _start

_start:
    ; Load the address of the input string into r0
    ldr r0, =input_string
    ; Load the address of the output string into r1
    ldr r1, =output_string
    ; Load the address of the temporary storage into r2
    ldr r2, =temp_storage

    ; Call the function to reverse the words
    bl reverse_words

    ; Exit the program
    mov r7, #1
    swi 0

reverse_words:
    ; Save the input string address in r3
    mov r3, r0
    ; Save the output string address in r4
    mov r4, r1

    ; Loop through the input string
reverse_loop:
    ldrb r5, [r3], #1
    cmp r5, #0
    beq reverse_done

    ; Check for space character
    cmp r5, #' '
    beq reverse_space

    ; Store the character in temporary storage
    strb r5, [r2], #1
    b reverse_loop

reverse_space:
    ; Null-terminate the temporary storage
    mov r6, #0
    strb r6, [r2]

    ; Reverse the word in temporary storage
    bl reverse_word

    ; Copy the reversed word to the output string
    ldr r2, =temp_storage
copy_loop:
    ldrb r5, [r2], #1
    cmp r5, #0
    beq copy_done
    strb r5, [r4], #1
    b copy_loop

copy_done:
    ; Add a space to the output string
    mov r5, #' '
    strb r5, [r4], #1

    ; Reset the temporary storage pointer
    ldr r2, =temp_storage
    b reverse_loop

reverse_done:
    ; Null-terminate the output string
    mov r5, #0
    strb r5, [r4]

    bx lr

reverse_word:
    ; Reverse the characters in the temporary storage
    ldr r7, =temp_storage
    mov r8, r2
    sub r8, r8, r7
    sub r8, r8, #1

reverse_word_loop:
    cmp r7, r8
    bge reverse_word_done
    ldrb r9, [r7]
    ldrb r10, [r8]
    strb r10, [r7]
    strb r9, [r8]
    add r7, r7, #1
    sub r8, r8, #1
    b reverse_word_loop

reverse_word_done:
    bx lr

