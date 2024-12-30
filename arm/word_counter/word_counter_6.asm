; Program: Word Counter
; Purpose: This program counts the number of words in a given string.
; It reads a string from the user, processes it, and outputs the word count.
; The program demonstrates basic string processing and counting techniques in ARM Assembly.

    .data
inputString:    .asciz "Enter a string: "
outputString:   .asciz "Word count: %d\n"
buffer:         .space 100

    .text
    .global _start

_start:
    ; Print the prompt to the user
    ldr     r0, =inputString
    bl      print_string

    ; Read the input string from the user
    ldr     r0, =buffer
    mov     r1, #100
    bl      read_string

    ; Initialize word count to 0
    mov     r4, #0

    ; Initialize index to 0
    mov     r5, #0

    ; Loop through the input string
count_words:
    ldrb    r6, [r0, r5]
    cmp     r6, #0
    beq     end_count

    ; Check if the current character is a space
    cmp     r6, #' '
    bne     not_space

    ; Increment word count
    add     r4, r4, #1

not_space:
    ; Increment index
    add     r5, r5, #1
    b       count_words

end_count:
    ; Print the word count
    ldr     r0, =outputString
    mov     r1, r4
    bl      printf

    ; Exit the program
    mov     r0, #0
    mov     r7, #1
    svc     #0

; Function to print a string
print_string:
    push    {lr}
    mov     r1, r0
    mov     r2, #14
    mov     r7, #4
    svc     #0
    pop     {lr}
    bx      lr

; Function to read a string
read_string:
    push    {lr}
    mov     r2, r1
    mov     r1, r0
    mov     r7, #3
    svc     #0
    pop     {lr}
    bx      lr

; Function to print formatted output
printf:
    push    {lr}
    mov     r7, #4
    svc     #0
    pop     {lr}
    bx      lr

