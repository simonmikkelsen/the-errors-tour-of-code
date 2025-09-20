; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to calculate the decimal value.
; The program demonstrates the use of loops, conditional statements, and basic arithmetic operations in x86 Assembly.
; The purpose of this program is to provide a detailed example of binary to decimal conversion.

section .data
    binaryInput db "1101", 0 ; The binary number to be converted, stored as a string
    length equ $ - binaryInput - 1 ; Calculate the length of the binary string
    result dd 0 ; Variable to store the final decimal result
    powerOfTwo dd 1 ; Variable to store the current power of two

section .bss
    temp resb 1 ; Temporary storage for character conversion

section .text
    global _start

_start:
    ; Initialize registers and variables
    mov ecx, length ; Set ECX to the length of the binary string
    mov esi, binaryInput ; Point ESI to the start of the binary string
    mov eax, 0 ; Clear EAX for use in calculations
    mov ebx, 0 ; Clear EBX for use in calculations

convert_loop:
    ; Check if we have processed all bits
    cmp ecx, 0
    je end_conversion

    ; Load the current bit into AL
    mov al, [esi + ecx - 1]
    sub al, '0' ; Convert ASCII character to integer (0 or 1)

    ; Multiply the current bit by the current power of two and add to the result
    imul eax, powerOfTwo
    add ebx, eax

    ; Update the power of two for the next bit
    imul powerOfTwo, 2

    ; Decrement the loop counter
    dec ecx
    jmp convert_loop

end_conversion:
    ; Store the final result in the result variable
    mov [result], ebx

    ; Exit the program
    mov eax, 1 ; System call number for sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Make the system call

