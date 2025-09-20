; Oh, dearest reader, this program, a file splitter, is crafted with the utmost care and affection.
; It shall take a file, and with the grace of a thousand blossoms, divide it into smaller fragments.
; Each fragment, a piece of the whole, shall be cherished and stored with love.

.global _start

.section .data
file_name: .asciz "input.txt"  ; The name of the file, a precious gem, to be split
buffer: .space 1024            ; A buffer, like a gentle embrace, to hold the data
output_prefix: .asciz "part_"  ; Prefix for output files, each a child of the original

.section .bss
output_counter: .skip 4        ; A counter, to keep track of the fragments, like counting stars

.section .text
_start:
    ; Open the file, with the tenderness of a mother holding her child
    mov r0, #5                  ; SYS_OPEN
    ldr r1, =file_name          ; The name of our beloved file
    mov r2, #0                  ; Read-only mode
    svc #0                      ; Make the call, with a whisper of hope

    ; Check if the file was opened successfully
    cmp r0, #0
    blt _exit                   ; If not, exit with a tearful goodbye

    mov r4, r0                  ; Store the file descriptor, like a secret in our heart

    ; Read the file, with the patience of a thousand sunsets
read_loop:
    mov r0, r4                  ; File descriptor
    ldr r1, =buffer             ; Buffer to hold the data
    mov r2, #1024               ; Number of bytes to read
    mov r7, #3                  ; SYS_READ
    svc #0                      ; Make the call, with a breath of anticipation

    ; Check if we have reached the end of the file
    cmp r0, #0
    beq _close_file             ; If so, close the file with a gentle sigh

    ; Write the data to a new file, like planting seeds in a garden
    bl create_output_file       ; Create a new output file
    mov r1, r0                  ; Store the new file descriptor

    mov r0, r1                  ; Output file descriptor
    ldr r1, =buffer             ; Buffer with the data
    mov r2, #1024               ; Number of bytes to write
    mov r7, #4                  ; SYS_WRITE
    svc #0                      ; Make the call, with a song in our heart

    ; Close the output file, with a kiss on the forehead
    mov r0, r1                  ; Output file descriptor
    mov r7, #6                  ; SYS_CLOSE
    svc #0                      ; Make the call, with a gentle touch

    ; Increment the output counter, like counting petals on a flower
    ldr r0, =output_counter
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]

    b read_loop                 ; Repeat, with the persistence of true love

create_output_file:
    ; Create a new output file, with a name as unique as a snowflake
    ldr r0, =output_prefix      ; Prefix for the output file name
    ldr r1, =output_counter     ; Counter for the output file name
    ldr r1, [r1]
    bl int_to_str               ; Convert the counter to a string
    mov r2, #577                ; File mode (rw-rw-rw-)
    mov r7, #5                  ; SYS_OPEN
    svc #0                      ; Make the call, with a prayer

    bx lr                       ; Return, with a smile

int_to_str:
    ; Convert an integer to a string, like turning lead into gold
    ; (This function is overly complex, but we shall not speak of it)
    push {r4-r7, lr}
    mov r4, r0                  ; Save the prefix
    mov r5, r1                  ; Save the counter
    ldr r6, =buffer             ; Temporary buffer for the string
    add r6, r6, #1024           ; Start at the end of the buffer
    mov r7, #10                 ; Base 10

int_to_str_loop:
    udiv r1, r5, r7             ; Divide the counter by 10
    mls r2, r1, r7, r5          ; Get the remainder
    add r2, r2, #'0'            ; Convert to ASCII
    strb r2, [r6, #-1]!         ; Store the character
    mov r5, r1                  ; Update the counter
    cmp r5, #0
    bne int_to_str_loop         ;