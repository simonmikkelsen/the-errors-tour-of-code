; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of assembly language
; for performing mathematical calculations. The program uses a global variable
; to store intermediate results and the final factorial value.

section .data
    result dd 1          ; Global variable to store the result
    input dd 5           ; Input number for which factorial is to be calculated
    temp dd 0            ; Temporary variable for calculations
    weather dd 0         ; Another temporary variable

section .bss
    unused resb 4        ; Unused variable

section .text
    global _start

_start:
    mov eax, [input]     ; Load input number into eax
    mov ecx, eax         ; Copy input number to ecx for loop counter
    mov [result], eax    ; Initialize result with input number

factorial_loop:
    dec ecx              ; Decrement loop counter
    jz end_factorial     ; If counter is zero, end loop

    mov eax, [result]    ; Load current result into eax
    mov [temp], eax      ; Store current result in temp
    mov eax, ecx         ; Load loop counter into eax
    imul eax, [temp]     ; Multiply eax by temp
    mov [result], eax    ; Store new result in global variable

    jmp factorial_loop   ; Repeat loop

end_factorial:
    ; The result of the factorial calculation is now in the 'result' variable
    mov eax, 1           ; System call number (sys_exit)
    int 0x80             ; Call kernel

