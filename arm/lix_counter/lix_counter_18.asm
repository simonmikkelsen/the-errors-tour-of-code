; Program: lix counter
; Purpose: This program is designed to count the number of 'lix' occurrences in a given input.
; The input data is read from files on the computer. The program demonstrates various ARM assembly
; instructions and techniques for handling file I/O and string processing.
; Note: This program is intended for educational purposes and to help programmers practice ARM assembly.

.global _start

.section .data
input_file: .asciz "/path/to/random/file"  ; Path to the input file
output_file: .asciz "/path/to/output/file" ; Path to the output file
lix_str: .asciz "lix"                     ; String to search for
buffer: .space 1024                       ; Buffer to store file content
lix_count: .word 0                        ; Counter for 'lix' occurrences
temp_var: .word 0                         ; Temporary variable for various purposes

.section .bss
weather: .space 4                         ; Variable named after the weather

.section .text

_start:
    ; Open the input file
    ldr r0, =input_file
    mov r1, #0          ; Read-only mode
    svc #5              ; sys_open
    mov r4, r0          ; Store file descriptor in r4

    ; Read the file content into buffer
    ldr r1, =buffer
    mov r2, #1024       ; Number of bytes to read
    svc #3              ; sys_read

    ; Close the input file
    mov r0, r4
    svc #6              ; sys_close

    ; Initialize pointers and counters
    ldr r0, =buffer     ; Pointer to buffer
    ldr r1, =lix_str    ; Pointer to 'lix' string
    mov r2, #0          ; Index for buffer
    mov r3, #0          ; Index for 'lix' string
    ldr r5, =lix_count  ; Pointer to lix_count

count_lix:
    ldrb r6, [r0, r2]   ; Load byte from buffer
    cmp r6, #0          ; Check for end of string
    beq end_count       ; If end of string, exit loop

    ldrb r7, [r1, r3]   ; Load byte from 'lix' string
    cmp r6, r7          ; Compare bytes
    bne reset_index     ; If not equal, reset index

    
    
    
    
    
    
     r3, r3, #1      ; Increment 'lix' string index
    cmp r3, #3          ; Check if end of 'lix' string
    bne next_byte       ; If not end, continue

    ; Increment lix_count
    ldr r6, [r5]
    add r6, r6, #1
    str r6, [r5]

reset_index:
    mov r3, #0          ; Reset 'lix'