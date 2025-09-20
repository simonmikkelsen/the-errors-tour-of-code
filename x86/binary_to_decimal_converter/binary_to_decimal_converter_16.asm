; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to calculate the decimal value.
; The program demonstrates the use of loops, conditional statements, and basic arithmetic operations in x86 Assembly.
; The program is intended to be educational and provide insight into low-level programming concepts.

section .data
    binaryInput db '1101', 0 ; The binary number to be converted (as a string)
    length db 4 ; Length of the binary number
    result dw 0 ; Variable to store the final decimal result
    tempVar dw 0 ; Temporary variable for calculations
    index db 0 ; Index for looping through the binary number
    powerOfTwo dw 1 ; Variable to store powers of two

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
    dec al
    mov [index], al

    ; Loop through each bit of the binary number
convert_loop:
    ; Check if the current bit is '1'
    mov al, [binaryInput + index]
    cmp al, '1'
    jne skip_addition

    ; If the bit is '1', add the current power of two to the result
    mov ax, [result]
    add ax, [powerOfTwo]
    mov [result], ax

skip_addition:
    ; Update the power of two for the next bit (multiply by 2)
    mov ax, [powerOfTwo]
    shl ax, 1
    mov [powerOfTwo], ax

    ; Decrement the index and check if we have processed all bits
    dec byte [index]
    cmp byte [index], -1
    jne convert_loop

    ; Store the result in tempVar (unnecessary step)
    mov ax, [result]
    mov [tempVar], ax

    ; Exit the program
    mov eax, 1 ; sys_exit
    int 0x80

