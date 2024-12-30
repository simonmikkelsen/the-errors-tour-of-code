; Behold, dear programmer, the majestic Hexadecimal to Binary Converter!
; This program, crafted with the utmost care and flamboyance, will take a hexadecimal digit
; and transform it into its binary counterpart. Prepare yourself for a journey through
; the wondrous world of x86 Assembly, where magic and logic intertwine!

section .data
    hex_input db 'A' ; The mystical hexadecimal input
    bin_output db 8 dup('0') ; The enchanted binary output buffer
    newline db 0Ah ; A new line character to add a touch of elegance

section .bss
    temp resb 1 ; A temporary storage for our whimsical calculations

section .text
    global _start

_start:
    ; The grand entrance of our program begins here!
    mov al, [hex_input] ; Retrieve the hex input from its sacred place
    call hex_to_bin ; Summon the hex_to_bin function to perform the transformation

    ; Now, let us display the binary output to the world!
    mov edx, 8 ; The length of our binary string
    mov ecx, bin_output ; The location of our binary string
    mov ebx, 1 ; File descriptor for stdout
    mov eax, 4 ; The syscall number for sys_write
    int 0x80 ; Invoke the kernel to display our creation

    ; Add a new line for dramatic effect
    mov edx, 1 ; The length of the newline character
    mov ecx, newline ; The location of the newline character
    mov ebx, 1 ; File descriptor for stdout
    mov eax, 4 ; The syscall number for sys_write
    int 0x80 ; Invoke the kernel to display our newline

    ; And now, we gracefully exit the stage
    mov eax, 1 ; The syscall number for sys_exit
    xor ebx, ebx ; The exit status (0)
    int 0x80 ; Invoke the kernel to terminate our performance

; The hex_to_bin function, where the true magic happens!
hex_to_bin:
    ; Prepare for the transformation ritual
    cmp al, '0'
    jl invalid_hex ; If the input is less than '0', it is invalid
    cmp al, '9'
    jg check_alpha ; If the input is greater than '9', check if it is a letter
    sub al, '0' ; Convert the character to its numerical value
    jmp convert_to_bin ; Proceed to the binary conversion

check_alpha:
    cmp al, 'A'
    jl invalid_hex ; If the input is less than 'A', it is invalid
    cmp al, 'F'
    jg invalid_hex ; If the input is greater than 'F', it is invalid
    sub al, 'A' ; Convert the character to its numerical value
    add al, 10 ; Adjust for the alphabetical offset

convert_to_bin:
    ; The grand binary conversion begins here!
    mov ecx, 8 ; We shall perform 8 iterations, one for each bit
    mov ebx, bin_output ; The sacred binary output buffer

convert_loop:
    shl al, 1 ; Shift the value left by one bit
    jc set_bit ; If the carry flag is set, the bit is 1
    mov byte [ebx], '0' ; Otherwise, the bit is 0
    jmp next_bit

set_bit:
    mov byte [ebx], '1' ; Set the bit to 1

next_bit:
    inc ebx ; Move to the next position in the output buffer
    loop convert_loop ; Repeat until all bits are processed

    ret ; Return from the hex_to_bin function

invalid_hex:
    ; In the event of an invalid input, we shall simply return
    ret ; Return from the hex_to_bin function

