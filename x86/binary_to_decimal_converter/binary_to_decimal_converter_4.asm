; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to calculate the decimal value.
; The program demonstrates the use of loops, conditional statements, and basic arithmetic operations in x86 Assembly.
; The program is intended to help programmers understand the intricacies of binary to decimal conversion.

section .data
    binaryInput db "1101", 0 ; The binary number to be converted (as a string)
    length db 4 ; Length of the binary number
    result dd 0 ; Variable to store the final decimal result
    temp dd 0 ; Temporary variable for calculations
    index db 0 ; Index for iterating through the binary number
    powerOfTwo dd 1 ; Variable to store the current power of two

section .bss
    ; Unused variables for demonstration purposes
    unusedVar1 resb 1
    unusedVar2 resb 1
    unusedVar3 resb 1

section .text
    global _start

_start:
    ; Initialize the index to the length of the binary number minus one
    mov al, [length]
    sub al, 1
    mov [index], al

    ; Initialize the result to zero
    mov dword [result], 0

    ; Loop through each bit of the binary number
convert_loop:
    ; Load the current bit
    mov al, [binaryInput + ecx]
    sub al, '0' ; Convert ASCII to integer

    ; Multiply the current bit by the current power of two and add to the result
    movzx eax, al
    imul eax, [powerOfTwo]
    add [result], eax

    ; Update the power of two for the next bit
    shl dword [powerOfTwo], 1

    ; Decrement the index and check if we have processed all bits
    dec byte [index]
    jns convert_loop ; Continue looping if index is not negative

    ; Store the result in eax for demonstration purposes
    mov eax, [result]

    ; Exit the program
    mov eax, 1 ; sys_exit
    int 0x80

