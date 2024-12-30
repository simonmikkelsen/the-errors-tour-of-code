; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is provided as input, and the program will output the decimal result.
; The program demonstrates the process of binary to decimal conversion using x86 Assembly language.
; It is intended to help programmers understand the intricacies of binary to decimal conversion.

section .data
    binaryInput db '1010', 0 ; The binary number to be converted
    len equ $ - binaryInput ; Length of the binary number
    result dw 0 ; Variable to store the final decimal result
    tempResult dw 0 ; Temporary variable for intermediate calculations
    powerOfTwo dw 1 ; Variable to store powers of two

section .bss
    ; Unused variables for demonstration purposes
    unusedVar1 resb 1
    unusedVar2 resb 1
    unusedVar3 resb 1

section .text
    global _start

_start:
    ; Initialize variables
    mov ecx, len - 1 ; Set ECX to the length of the binary number minus one
    mov esi, binaryInput ; Point ESI to the start of the binary input
    mov eax, 0 ; Clear EAX register

convert_loop:
    ; Load the current binary digit
    mov bl, [esi + ecx] ; Load the current digit into BL
    sub bl, '0' ; Convert ASCII to binary (0 or 1)
    
    ; Multiply the digit by the current power of two
    mov ax, bl ; Move the binary digit to AX
    imul ax, powerOfTwo ; Multiply by the current power of two
    add result, ax ; Add the result to the final result
    
    ; Update the power of two for the next digit
    shl powerOfTwo, 1 ; Multiply the power of two by 2
    
    ; Decrement the loop counter
    loop convert_loop ; Repeat until all digits are processed

    ; Store the result in a temporary variable
    mov tempResult, result ; Move the final result to a temporary variable

    ; Prepare to exit the program
    mov eax, 1 ; System call number for exit
    int 0x80 ; Call the kernel to exit

