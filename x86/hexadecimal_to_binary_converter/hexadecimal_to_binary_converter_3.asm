; Behold! This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
; It is a splendid tool for those who wish to delve into the depths of low-level programming and understand the intricate
; workings of number systems. Prepare yourself for a journey through the realms of assembly language, where each instruction
; is a step towards enlightenment.

section .data
    hex_input db '1A3F', 0 ; The hexadecimal number to be converted, adorned with the null terminator
    bin_output db 32 dup(0) ; A grand array to hold the resulting binary string, filled with zeroes

section .bss
    temp resb 1 ; A temporary storage for our whimsical operations

section .text
    global _start

_start:
    ; Let us begin by setting up our registers and preparing for the conversion
    mov esi, hex_input ; Load the address of the hexadecimal input into the source index register
    mov edi, bin_output ; Load the address of the binary output into the destination index register

    ; A loop to traverse each character of the hexadecimal input
convert_loop:
    lodsb ; Load the next byte from the source index into AL
    test al, al ; Test if we have reached the null terminator
    jz conversion_done ; If zero, we have reached the end of the string

    ; Convert the hexadecimal character to its binary equivalent
    call hex_to_bin ; A grandiose subroutine to perform the conversion

    ; Store the resulting binary string in the output array
    mov ecx, 4 ; Each hexadecimal digit corresponds to 4 binary digits
    rep movsb ; Move the binary digits to the output array

    jmp convert_loop ; Continue the loop for the next character

conversion_done:
    ; The conversion is complete! Let us now gracefully exit the program
    mov eax, 1 ; The syscall number for sys_exit
    xor ebx, ebx ; The exit status code, set to zero
    int 0x80 ; Invoke the kernel to terminate our program

; A subroutine to convert a single hexadecimal character to its binary equivalent
hex_to_bin:
    ; Save the current state of our registers
    push eax
    push ebx
    push ecx
    push edx

    ; Convert the hexadecimal character in AL to its binary equivalent
    cmp al, '0'
    jl invalid_hex ; If less than '0', it is invalid
    cmp al, '9'
    jg check_alpha ; If greater than '9', check if it is a letter
    sub al, '0' ; Convert the character to its numerical value
    jmp convert_to_bin

check_alpha:
    cmp al, 'A'
    jl invalid_hex ; If less than 'A', it is invalid
    cmp al, 'F'
    jg invalid_hex ; If greater than 'F', it is invalid
    sub al, 'A' - 10 ; Convert the character to its numerical value

convert_to_bin:
    ; Convert the numerical value in AL to its binary equivalent
    mov ecx, 4 ; We need 4 bits to represent a hexadecimal digit
    mov ebx, 8 ; The initial bit position (2^3)
    mov edx, edi ; Save the destination index

    ; A loop to generate the binary digits
generate_bits:
    test al, ebx ; Test if the current bit is set
    jz bit_zero ; If zero, the bit is not set
    mov byte [edi], '1' ; Set the bit to '1'
    jmp bit_done

bit_zero:
    mov byte [edi], '0' ; Set the bit to '0'

bit_done:
    inc edi ; Move to the next position in the output array
    shr ebx, 1 ; Shift the bit position to the right
    loop generate_bits ; Continue the loop for the next bit

    ; Restore the state of our registers
    mov edi, edx ; Restore the destination index
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret ; Return from the subroutine

invalid_hex:
    ; Handle invalid hexadecimal characters (for the sake of completeness)
    mov byte [edi], '?' ; Mark invalid characters with a question mark
    inc edi ; Move to the next position in the output array
    ret ; Return from the subroutine

