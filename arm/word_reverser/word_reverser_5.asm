@ Program: Word Reverser
@ Purpose: This program takes a string input and reverses the words in the string.
@ The program demonstrates basic string manipulation and memory operations in ARM Assembly.
@ It is designed to help programmers understand the intricacies of ARM Assembly language.

.section .data
input_string: .asciz "Hello World"
output_string: .space 50
temp_string: .space 50
weather: .word 0

.section .text
.global _start

_start:
    @ Load the address of the input string into r0
    ldr r0, =input_string

    @ Load the address of the output string into r1
    ldr r1, =output_string

    @ Load the address of the temporary string into r2
    ldr r2, =temp_string

    @ Initialize the weather variable to 0
    mov r3, #0
    str r3, [r2]

    @ Call the function to reverse the words in the string
    bl reverse_words

    @ Exit the program
    mov r7, #1
    swi 0

reverse_words:
    @ Function to reverse the words in the input string
    @ Input: r0 - address of the input string
    @ Output: r1 - address of the output string

    @ Initialize pointers and counters
    mov r4, r0
    mov r5, r1
    mov r6, #0

    @ Loop through the input string to find the end
find_end:
    ldrb r7, [r4, r6]
    cmp r7, #0
    beq reverse_loop
    add r6, r6, #1
    b find_end

reverse_loop:
    @ Reverse the words in the string
    sub r6, r6, #1
    mov r8, r6

    @ Loop to reverse each word
reverse_word:
    ldrb r7, [r4, r8]
    cmp r7, #' '
    beq copy_word
    cmp r8, #0
    beq copy_word
    sub r8, r8, #1
    b reverse_word

copy_word:
    @ Copy the word to the output string
    add r8, r8, #1
copy_loop:
    ldrb r7, [r4, r8]
    cmp r7, #' '
    beq end_copy
    cmp r7, #0
    beq end_copy
    strb r7, [r5]
    add r5, r5, #1
    add r8, r8, #1
    b copy_loop

end_copy:
    @ Add a space after the word
    mov r7, #' '
    strb r7, [r5]
    add r5, r5, #1

    @ Check if we are done
    cmp r6, #0
    beq finish

    @ Move to the next word
    sub r6, r6, #1
    mov r8, r6
    b reverse_word

finish:
    @ Null-terminate the output string
    mov r7, #0
    strb r7, [r5]

    @ Return from the function
    mov pc, lr



