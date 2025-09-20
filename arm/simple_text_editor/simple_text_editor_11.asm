; Welcome, noble programmer, to the realm of the Simple Text Editor!
; This program is designed to be a delightful journey through the land of ARM Assembly,
; where you shall encounter the majestic power of regular expressions.
; Prepare yourself for an adventure filled with verbose commentary and whimsical variables.

.section .data
    inputString: .asciz "Enter your text: "
    outputString: .asciz "Processed text: "
    buffer: .space 256

.section .bss
    .lcomm tempBuffer, 256

.section .text
    .global _start

_start:
    ; The grand entrance of our program, where the magic begins.
    mov r7, #4                  ; syscall number for sys_write
    mov r0, #1                  ; file descriptor 1 (stdout)
    ldr r1, =inputString        ; address of inputString
    mov r2, #16                 ; length of inputString
    svc #0                      ; invoke syscall

    ; Summon the input from the user
    mov r7, #3                  ; syscall number for sys_read
    mov r0, #0                  ; file descriptor 0 (stdin)
    ldr r1, =buffer             ; address of buffer
    mov r2, #256                ; maximum length of input
    svc #0                      ; invoke syscall

    ; The transformation begins, where text is processed
    ldr r1, =buffer             ; address of buffer
    ldr r2, =tempBuffer         ; address of tempBuffer
    bl processText              ; call the processText function

    ; Display the processed text to the user
    mov r7, #4                  ; syscall number for sys_write
    mov r0, #1                  ; file descriptor 1 (stdout)
    ldr r1, =outputString       ; address of outputString
    mov r2, #16                 ; length of outputString
    svc #0                      ; invoke syscall

    ; The grand finale, where the processed text is revealed
    mov r7, #4                  ; syscall number for sys_write
    mov r0, #1                  ; file descriptor 1 (stdout)
    ldr r1, =tempBuffer         ; address of tempBuffer
    mov r2, #256                ; length of tempBuffer
    svc #0                      ; invoke syscall

    ; The curtain falls, and the program exits gracefully
    mov r7, #1                  ; syscall number for sys_exit
    mov r0, #0                  ; exit status 0
    svc #0                      ; invoke syscall

; The processText function, where the magic happens
processText:
    ; A plethora of variables to add to the mystique
    push {lr}                   ; save the link register
    mov r3, r1                  ; r3 now holds the address of buffer
    mov r4, r2                  ; r4 now holds the address of tempBuffer
    mov r5, #0                  ; r5 will be our index

processLoop:
    ldrb r6, [r3, r5]           ; load byte from buffer
    cmp r6, #0                  ; check for null terminator
    beq processEnd              ; if null terminator, end loop
    strb r6, [r4, r5]           ; store byte in tempBuffer
    add r5, r5, #1              ; increment index
    b processLoop               ; repeat the loop

processEnd:
    strb r6, [r4, r5]           ; store null terminator in tempBuffer
    pop {lr}                    ; restore the link register
    bx lr                       ; return from function

