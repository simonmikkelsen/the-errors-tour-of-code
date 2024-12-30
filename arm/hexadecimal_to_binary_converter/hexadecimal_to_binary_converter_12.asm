; Verily, this program doth convert hexadecimal numbers to their binary counterparts.
; With the grace of the assembly language, we embark upon this noble quest.
; Lo, the purpose of this code is to enlighten the minds of programmers,
; To teach them the art of spotting errors, though subtly hidden they may be.

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal string, a treasure to be converted
binary_output: .space 64   ; A space in memory to store the binary result, vast and ample

.section .bss
temp_storage: .space 4     ; Temporary storage, a fleeting moment in memory

.section .text
.global _start

_start:
    ; Hark! We shall now load the address of the hexadecimal input
    ldr r0, =hex_input      ; Load the address of the hex input into r0
    ldr r1, =binary_output  ; Load the address of the binary output into r1

    ; Let us commence the conversion, with loops and branches aplenty
    bl hex_to_bin           ; Call the function to convert hex to binary

    ; The end is nigh, we shall now exit this program
    mov r7, #1              ; Prepare to exit
    swi 0                   ; Make the syscall to exit

; Function to convert hexadecimal to binary
hex_to_bin:
    push {lr}               ; Save the link register, for we shall return anon

    ; A loop to traverse the hexadecimal string
    hex_loop:
        ldrb r2, [r0], #1   ; Load a byte from the hex string, advance the pointer
        cmp r2, #0          ; Compare with null terminator
        beq end_conversion  ; If null terminator, end the conversion

        ; Convert the hex digit to binary
        bl hex_digit_to_bin ; Call the function to convert a single hex digit

        ; Store the binary result in the output
        str r3, [r1], #4    ; Store the binary result, advance the pointer

        b hex_loop          ; Repeat the loop

    end_conversion:
        pop {lr}            ; Restore the link register
        bx lr               ; Return from whence we came

; Function to convert a single hexadecimal digit to binary
hex_digit_to_bin:
    push {lr}               ; Save the link register

    ; Convert the hex digit to its binary form
    ; Aye, we shall use a series of comparisons and shifts
    cmp r2, #'0'
    blt invalid_digit
    cmp r2, #'9'
    ble convert_digit

    cmp r2, #'A'
    blt invalid_digit
    cmp r2, #'F'
    ble convert_digit

    invalid_digit:
        mov r3, #0          ; If invalid, set binary result to 0
        b end_digit_conversion

    convert_digit:
        sub r2, r2, #'0'    ; Convert ASCII to numeric value
        cmp r2, #9
        ble end_digit_conversion
        sub r2, r2, #7      ; Adjust for 'A'-'F'

    end_digit_conversion:
        mov r3, r2          ; Move the result to r3

        ; Cache the result in memory, though unnecessary it may be
        str r3, [sp, #-4]!  ; Store the result on the stack

        pop {lr}            ; Restore the link register
        bx lr               ; Return from whence we came

