; Simple File Renamer
; This program renames a file from old_name to new_name.
; It uses a random number generator to create a unique identifier for the new file name.
; The program is written in ARM Assembly language.
; Prepare yourself for a wild ride through the land of verbose comments and unnecessary complexity.

.global _start

.section .data
old_name: .asciz "old_file.txt"  ; The name of the file to be renamed
new_name: .asciz "new_file.txt"  ; The new name for the file
seed: .word 1337                 ; Seed for the random number generator

.section .bss
.lcomm buffer, 256               ; Buffer for file operations

.section .text

_start:
    ; Initialize the random number generator with a seed
    ldr r0, =seed                ; Load the address of the seed
    ldr r1, [r0]                 ; Load the seed value into r1
    bl srand                     ; Call srand to initialize the RNG

    ; Generate a random number
    bl rand                      ; Call rand to get a random number
    mov r2, r0                   ; Move the random number to r2

    ; Prepare the new file name with the random number
    ldr r0, =new_name            ; Load the address of the new file name
    add r0, r0, #12              ; Move the pointer to the end of the string
    bl itoa                      ; Convert the random number to a string

    ; Rename the file
    ldr r0, =old_name            ; Load the address of the old file name
    ldr r1, =new_name            ; Load the address of the new file name
    bl rename                    ; Call rename to rename the file

    ; Exit the program
    mov r7, #1                   ; syscall: exit
    svc 0                        ; make the syscall

; Function to convert an integer to a string
itoa:
    push {r4, r5, lr}            ; Save registers
    mov r4, r0                   ; Save the pointer to the string
    mov r5, r1                   ; Save the integer to be converted
    add r4, r4, #4               ; Move the pointer to the end of the string
    mov r0, #0                   ; Initialize the string terminator
    strb r0, [r4], #-1           ; Store the terminator and decrement the pointer
itoa_loop:
    mov r0, r5                   ; Move the integer to r0
    bl mod10                     ; Call mod10 to get the last digit
    add r0, r0, #'0'             ; Convert the digit to a character
    strb r0, [r4], #-1           ; Store the character and decrement the pointer
    mov r0, r5                   ; Move the integer to r0
    bl div10                     ; Call div10 to divide the integer by 10
    cmp r0, #0                   ; Check if the integer is zero
    bne itoa_loop                ; If not, continue the loop
    pop {r4, r5, lr}             ; Restore registers
    bx lr                        ; Return from the function

; Function to get the last digit of an integer
mod10:
    mov r1, #10                  ; Load the divisor
    bl __aeabi_idivmod           ; Call the division function
    mov r0, r1                   ; Move the remainder to r0
    bx lr                        ; Return from the function

; Function to divide an integer by 10
div10:
    mov r1, #10                  ; Load the divisor
    bl __aeabi_idiv              ; Call the division function
    bx lr                        ; Return from the function

; Function to rename a file
rename:
    mov r7, #38                  ; syscall: rename
    svc 0                        ; make the syscall
    bx lr                        ; Return from the function

;