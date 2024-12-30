; This program is a binary to decimal converter written in x86 Assembly.
; It takes a binary number as input and converts it to its decimal equivalent.
; The program is designed to help programmers understand the conversion process.
; It includes detailed comments to explain each step of the process.

section .data
    binary_input db "1101", 0 ; The binary number to be converted (as a string)
    len equ $ - binary_input  ; Length of the binary number string
    result dw 0               ; Variable to store the final decimal result
    temp dw 0                 ; Temporary variable for calculations
    power dw 1                ; Variable to store the current power of 2

section .bss
    buffer resb 10            ; Buffer to store intermediate results

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, binary_input     ; Point ESI to the start of the binary input string
    add esi, len - 1          ; Move ESI to the last character of the string
    xor ecx, ecx              ; Clear ECX (will be used as a counter)
    xor eax, eax              ; Clear EAX (will be used for calculations)

convert_loop:
    ; Check if we have processed all characters
    cmp esi, binary_input - 1
    jl end_conversion

    ; Load the current character
    mov al, [esi]
    sub al, '0'               ; Convert ASCII character to integer (0 or 1)
    imul ax, power            ; Multiply by the current power of 2
    add result, ax            ; Add to the result

    ; Update the power of 2
    imul power, power, 2

    ; Move to the previous character
    dec esi
    inc ecx                   ; Increment the counter
    jmp convert_loop

end_conversion:
    ; Prepare to exit the program
    mov eax, 1                ; System call number (sys_exit)
    xor ebx, ebx              ; Exit code 0
    int 0x80                  ; Call kernel

