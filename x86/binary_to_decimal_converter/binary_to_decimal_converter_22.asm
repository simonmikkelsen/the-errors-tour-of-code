; This program converts a binary number to its decimal equivalent.
; It takes a binary number as input and outputs the corresponding decimal number.
; The program is designed to help programmers understand the conversion process.
; It uses various registers and memory locations to perform the conversion.

section .data
    binary_input db '1011', 0 ; The binary number to be converted (as a string)
    len equ $ - binary_input  ; Length of the binary number string
    decimal_output db 0       ; The resulting decimal number

section .bss
    temp resb 1               ; Temporary storage for calculations
    uninitialized_var resb 1  ; Uninitialized variable

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, len - 1          ; ECX will be used as the index for the binary string
    mov ebx, 0                ; EBX will store the decimal result
    mov edx, 1                ; EDX will store the current power of 2

convert_loop:
    ; Load the current binary digit
    mov al, [binary_input + ecx]
    sub al, '0'               ; Convert ASCII to integer (0 or 1)
    
    ; Multiply the binary digit by the current power of 2 and add to the result
    imul eax, edx
    add ebx, eax
    
    ; Update the power of 2 for the next digit
    shl edx, 1
    
    ; Decrement the index and check if we are done
    loop convert_loop

    ; Store the result in the output variable
    mov [decimal_output], bl

    ; Exit the program
    mov eax, 1                ; System call number (sys_exit)
    xor ebx, ebx              ; Exit code 0
    int 0x80                  ; Call kernel

