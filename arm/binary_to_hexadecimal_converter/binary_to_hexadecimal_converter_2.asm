; Behold! A majestic program that transforms binary numbers into their hexadecimal counterparts.
; This program is a symphony of logic and elegance, designed to dazzle and educate.
; Prepare to embark on a journey through the enchanted realms of ARM Assembly!

.global _start

.section .data
binary_input: .asciz "1101"  ; The binary string that shall be converted to hexadecimal
hex_output: .space 10        ; A sanctuary for the resulting hexadecimal string

.section .bss
temp_storage: .space 4       ; A temporary haven for intermediate values

.section .text
_start:
    ; The grand entrance of our program begins here.
    ; We shall first summon the binary string from the data section.
    ldr r0, =binary_input     ; Load the address of the binary input string
    ldr r1, =hex_output       ; Load the address of the hexadecimal output buffer

    ; Let the conversion commence! We shall traverse the binary string and convert it to hexadecimal.
    bl binary_to_hex          ; Call the binary to hexadecimal conversion function

    ; The grand finale! We shall now exit the program gracefully.
    mov r7, #1                ; Prepare to invoke the exit system call
    svc 0                     ; Invoke the system call

; The binary to hexadecimal conversion function
binary_to_hex:
    push {lr}                 ; Preserve the return address
    mov r2, #0                ; Initialize the index for the binary string
    mov r3, #0                ; Initialize the index for the hexadecimal output buffer

convert_loop:
    ldrb r4, [r0, r2]         ; Load the current binary digit
    cmp r4, #0                ; Check if we have reached the end of the string
    beq conversion_done       ; If so, we are done with the conversion

    ; Convert the binary digit to its hexadecimal equivalent
    sub r4, r4, #48           ; Convert ASCII '0' or '1' to binary 0 or 1
    lsl r4, r4, #1            ; Shift left to make space for the next digit
    add r5, r5, r4            ; Accumulate the binary value

    ; Every 4 binary digits, we produce a hexadecimal digit
    add r2, r2, #1            ; Move to the next binary digit
    cmp r2, #4                ; Have we processed 4 binary digits?
    bne convert_loop          ; If not, continue the loop

    ; Convert the accumulated binary value to a hexadecimal character
    cmp r5, #10               ; Is the value less than 10?
    addlt r5, r5, #48         ; If so, convert to ASCII '0'-'9'
    addge r5, r5, #87         ; Otherwise, convert to ASCII 'a'-'f'

    strb r5, [r1, r3]         ; Store the hexadecimal character in the output buffer
    add r3, r3, #1            ; Move to the next position in the output buffer
    mov r2, #0                ; Reset the binary digit index
    mov r5, #0                ; Reset the accumulated binary value

    b convert_loop            ; Continue the conversion loop

conversion_done:
    strb r5, [r1, r3]         ; Null-terminate the hexadecimal string
    pop {lr}                  ; Restore the return address
    bx lr                     ; Return from the function

