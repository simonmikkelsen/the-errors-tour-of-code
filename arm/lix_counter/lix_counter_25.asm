; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic ARM assembly programming concepts such as loops, conditionals, and
; random number generation. The program also includes verbose comments to help new programmers
; understand the code.

    .section .data
input_string:   .asciz "Hello, this is a sample string with some lix characters: lix lix lix."
string_length:  .word 0
lix_count:      .word 0
random_seed:    .word 1337

    .section .bss
    .lcomm buffer, 256

    .section .text
    .global _start

_start:
    ; Initialize the random number generator with a seed
    ldr r0, =random_seed
    ldr r1, [r0]
    bl srand

    ; Load the input string and its length
    ldr r0, =input_string
    bl strlen
    ldr r1, =string_length
    str r0, [r1]

    ; Initialize the lix count to zero
    ldr r0, =lix_count
    mov r1, #0
    str r1, [r0]

    ; Initialize loop variables
    mov r2, #0          ; Index variable
    ldr r3, =input_string
    ldr r4, =string_length
    ldr r4, [r4]

loop:
    ; Check if we have reached the end of the string
    cmp r2, r4
    beq end_loop

    ; Load the current character
    ldrb r5, [r3, r2]

    ; Check if the character is 'l'
    cmp r5, #'l'
    bne next_char

    ; Check if the next character is 'i'
    add r6, r2, #1
    ldrb r7, [r3, r6]
    cmp r7, #'i'
    bne next_char

    ; Check if the next character is 'x'
    add r6, r6, #1
    ldrb r7, [r3, r6]
    cmp r7, #'x'
    bne next_char

    ; Increment the lix count
    ldr r0, =lix_count
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]

next_char:
    ; Move to the next character
    add r2, r2, #1
    b loop

end_loop:
    ; Exit the program
    mov r7, #1          ; syscall: exit
    mov r0, #0          ; exit code: 0
    svc 0

