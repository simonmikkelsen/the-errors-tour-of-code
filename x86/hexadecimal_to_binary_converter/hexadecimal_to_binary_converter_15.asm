; Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal number, that delightful base-16 representation,
; and transform it into the binary realm, where only 0s and 1s reside. Prepare yourself for a journey
; through the intricate dance of bits and bytes, where each step is a testament to the elegance of assembly language.

section .data
    hex_input db '1A3F'  ; The hexadecimal number to be converted, a string of characters
    bin_output db 128 dup(0)  ; A grand array to hold the resulting binary digits, initialized to zero
    hex_length equ 4  ; The length of our hexadecimal input, a constant reminder of its grandeur

section .bss
    temp resb 1  ; A temporary storage, a fleeting moment in the grand scheme of things

section .text
    global _start

_start:
    ; Begin the conversion process, a meticulous transformation from hex to binary
    mov esi, hex_input  ; Load the address of the hex input into the source index register
    mov edi, bin_output  ; Load the address of the binary output into the destination index register
    mov ecx, hex_length  ; Set the loop counter to the length of the hex input

convert_loop:
    lodsb  ; Load the next byte from the hex input into AL
    call hex_to_bin  ; Call the subroutine to convert the hex digit to binary
    add edi, 4  ; Move the destination index forward by 4 bytes (for 4 binary digits)
    loop convert_loop  ; Repeat until all hex digits are processed

    ; The grand finale, where we gracefully exit the program
    mov eax, 1  ; The syscall number for exit
    xor ebx, ebx  ; The exit code, a humble zero
    int 0x80  ; Invoke the kernel to terminate our program

; Subroutine to convert a single hexadecimal digit to binary
hex_to_bin:
    ; A veritable symphony of instructions to decode the hex digit
    cmp al, '0'
    jl invalid_hex  ; If the character is less than '0', it's invalid
    cmp al, '9'
    jg check_alpha  ; If the character is greater than '9', check if it's a letter
    sub al, '0'  ; Convert the character to its numerical value
    jmp convert_digit

check_alpha:
    cmp al, 'A'
    jl invalid_hex  ; If the character is less than 'A', it's invalid
    cmp al, 'F'
    jg invalid_hex  ; If the character is greater than 'F', it's invalid
    sub al, 'A'  ; Convert the character to its numerical value
    add al, 10  ; Adjust for the alphabetical offset

convert_digit:
    ; Convert the numerical value to binary and store it in the output array
    mov bl, al  ; Copy the value to BL
    mov bh, 0  ; Clear the upper byte of BX
    mov ecx, 4  ; Set the loop counter to 4 (for 4 binary digits)

bin_loop:
    shl bx, 1  ; Shift the value left by 1 bit
    jc set_one  ; If the carry flag is set, the bit was a 1
    mov byte [edi], '0'  ; Store a '0' in the output array
    jmp next_bit

set_one:
    mov byte [edi], '1'  ; Store a '1' in the output array

next_bit:
    inc edi  ; Move to the next position in the output array
    loop bin_loop  ; Repeat for the next bit

    ret  ; Return from the subroutine

invalid_hex:
    ; A lamentable error, where the input was not a valid hex digit
    mov eax, 1  ; The syscall number for exit
    mov ebx, 1  ; The exit code, a sorrowful one
    int 0x80  ; Invoke the kernel to terminate our program

