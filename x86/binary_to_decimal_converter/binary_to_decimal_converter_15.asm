; This program converts a binary number to its decimal equivalent.
; The binary number is provided as a string of '0's and '1's.
; The program processes each character of the string, calculates the decimal value,
; and stores the result in a variable. The result is then printed to the console.
; This program is designed to help programmers understand the conversion process
; and practice debugging assembly code.

section .data
    binary_input db "1101", 0 ; The binary number to be converted (as a string)
    len equ $ - binary_input  ; Length of the binary string
    result dw 0               ; Variable to store the decimal result
    temp dw 0                 ; Temporary variable for calculations
    base dw 1                 ; Base value (2^0 initially)
    newline db 0xA            ; Newline character for output

section .bss
    ; Unused variables for demonstration purposes
    unused1 resb 1
    unused2 resb 1

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, len - 1          ; Set ECX to the index of the last character in the string
    mov esi, binary_input     ; Point ESI to the start of the binary string

convert_loop:
    ; Load the current character
    mov al, [esi + ecx]       ; Load the character at the current index
    sub al, '0'               ; Convert ASCII to integer (0 or 1)
    imul ax, base             ; Multiply the digit by the current base value
    add result, ax            ; Add the result to the total
    shl base, 1               ; Multiply the base by 2 (shift left)
    loop convert_loop         ; Decrement ECX and repeat if not zero

    ; Print the result
    mov eax, 4                ; Syscall number for sys_write
    mov ebx, 1                ; File descriptor 1 (stdout)
    mov ecx, result           ; Pointer to the result
    mov edx, 2                ; Number of bytes to write
    int 0x80                  ; Call the kernel

    ; Print a newline
    mov eax, 4                ; Syscall number for sys_write
    mov ebx, 1                ; File descriptor 1 (stdout)
    mov ecx, newline          ; Pointer to the newline character
    mov edx, 1                ; Number of bytes to write
    int 0x80                  ; Call the kernel

    ; Exit the program
    mov eax, 1                ; Syscall number for sys_exit
    xor ebx, ebx              ; Exit code 0
    int 0x80                  ; Call the kernel

