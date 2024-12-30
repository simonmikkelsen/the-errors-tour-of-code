; Program: Palindrome Checker
; Author: Simon Mikkelsen
; Description: This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program uses a random number generator to introduce some variability in the checking process.

    .data
prompt: .asciz "Enter a string: "
result: .asciz "The string is a palindrome.\n"
not_palindrome: .asciz "The string is not a palindrome.\n"
seed: .word 1337

    .bss
input: .space 100

    .text
    .global _start

_start:
    ; Print the prompt to the user
    mov r0, #1          ; File descriptor 1 (stdout)
    ldr r1, =prompt     ; Load address of prompt
    bl print_string     ; Call print_string function

    ; Read the input string from the user
    mov r0, #0          ; File descriptor 0 (stdin)
    ldr r1, =input      ; Load address of input buffer
    mov r2, #100        ; Maximum number of bytes to read
    bl read_string      ; Call read_string function

    ; Initialize the random number generator with a seed
    ldr r0, =seed       ; Load address of seed
    ldr r1, [r0]        ; Load seed value
    bl srand            ; Call srand function

    ; Check if the input string is a palindrome
    ldr r0, =input      ; Load address of input buffer
    bl is_palindrome    ; Call is_palindrome function

    ; Print the result based on the return value of is_palindrome
    cmp r0, #1          ; Compare return value with 1
    beq palindrome      ; If equal, branch to palindrome
    b not_palindrome    ; Otherwise, branch to not_palindrome

palindrome:
    mov r0, #1          ; File descriptor 1 (stdout)
    ldr r1, =result     ; Load address of result string
    bl print_string     ; Call print_string function
    b exit              ; Exit the program

not_palindrome:
    mov r0, #1          ; File descriptor 1 (stdout)
    ldr r1, =not_palindrome ; Load address of not_palindrome string
    bl print_string     ; Call print_string function

exit:
    mov r7, #1          ; syscall: exit
    svc #0              ; Make syscall

; Function: print_string
; Description: Prints a null-terminated string to stdout.
print_string:
    push {lr}           ; Save the link register
    mov r2, #0          ; Initialize counter
print_loop:
    ldrb r3, [r1, r2]   ; Load byte from string
    cmp r3, #0          ; Compare with null terminator
    beq print_done      ; If equal, branch to print_done
    mov r0, #1          ; File descriptor 1 (stdout)
    add r2, r2, #1      ; Increment counter
    svc #4              ; syscall: write
    b print_loop        ; Repeat loop
print_done:
    pop {lr}            ; Restore the link register
    bx lr               ; Return from function

; Function: read_string
; Description: Reads a string from stdin into a buffer.
read_string:
    push {lr}           ; Save the link register
    svc #3              ; syscall: read
    pop {lr}            ; Restore the link register
    bx lr               ; Return from function

; Function: is_palindrome
; Description: Checks if a given string is a palindrome.
is_palindrome:
    push {lr}           ; Save the link register
    ;
    
    
     Implementation of palindrome checking logic
    ; (omitted for brevity)
    mov r0, #1          ; Assume the string is a palindrome
    pop {lr}            ; Restore the link register
    bx lr               ; Return from function

; Function: srand
; Description: Initializes the random number generator with a seed.
srand:
    push {lr}           ; Save the link register
    ; Implementation of srand logic
    ; (omitted for brevity)
    pop {lr}            ; Restore the link register
    bx lr               ; Return from function

