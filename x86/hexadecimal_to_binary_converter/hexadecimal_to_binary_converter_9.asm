; This program, a veritable masterpiece of computational artistry, is designed to convert
; hexadecimal numbers into their binary counterparts. It is a symphony of logic and 
; precision, a testament to the elegance of assembly language. The user shall input a 
; hexadecimal number, and the program shall output the corresponding binary number, 
; illuminating the path from one numeral system to another.

section .data
    hex_input db 'A', 0  ; The hexadecimal input, a single character for simplicity
    binary_output db 8 dup(0) ; The binary output, an array of 8 characters
    temp_var db 0 ; A temporary variable, a humble servant in our grand design

section .bss
    ; Unused variables, mere decorations in our grand tapestry
    unused_var1 resb 1
    unused_var2 resb 1

section .text
    global _start

_start:
    ; The grand entrance, where the magic begins
    mov al, [hex_input] ; Load the hexadecimal input into the al register
    call hex_to_bin ; Call the conversion function

    ; The grand finale, where we exit the program
    mov eax, 1 ; The exit system call number
    int 0x80 ; Interrupt to invoke the system call

; The conversion function, a marvel of logic and precision
hex_to_bin:
    ; A plethora of variables, each with a role to play
    mov bl, al ; Copy the input to bl, a loyal companion
    sub bl, '0' ; Convert ASCII to numerical value
    cmp bl, 9 ; Compare with 9 to check if it's a digit
    jle digit ; If less than or equal to 9, it's a digit

    ; If not a digit, it must be a letter
    sub bl, 7 ; Adjust for letters A-F

digit:
    ; The binary conversion, a delicate dance of bits
    mov cl, 8 ; The number of bits to process
    mov di, binary_output ; The destination for our binary output

convert_loop:
    shl bl, 1 ; Shift left to get the next bit
    jc set_bit ; If the carry flag is set, the bit is 1
    mov byte [di], '0' ; Otherwise, the bit is 0
    jmp next_bit ; Move to the next bit

set_bit:
    mov byte [di], '1' ; Set the bit to 1

next_bit:
    inc di ; Move to the next position in the output
    dec cl ; Decrement the bit counter
    jnz convert_loop ; Repeat until all bits are processed

    ret ; Return from the function

