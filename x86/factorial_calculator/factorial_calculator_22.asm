; Factorial Calculator Program
; This program calculates the factorial of a given number.
; It demonstrates the use of loops, conditional statements, and basic arithmetic operations in x86 Assembly.
; The program is designed to be verbose and includes many comments to help understand each step.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 0xA, 0

section .bss
    number resb 1
    factorial resd 1
    temp resd 1
    weather resd 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 15         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input number
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, number     ; pointer to the input buffer
    mov edx, 1          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert ASCII to integer
    sub byte [number], '0'

    ; Initialize variables
    mov eax, [number]   ; move the input number to eax
    mov [factorial], eax; initialize factorial with the input number
    mov [temp], eax     ; initialize temp with the input number

    ; Calculate factorial
factorial_loop:
    dec eax             ; decrement eax
    jz end_loop         ; if eax is zero, end the loop
    imul dword [factorial], eax ; multiply factorial by eax
    jmp factorial_loop  ; repeat the loop

end_loop:
    ; Print the result message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, result_msg ; pointer to the result message
    mov edx, 18         ; length of the result message
    int 0x80            ; call kernel

    ; Print the factorial result
    mov eax, [factorial]
    add eax, '0'        ; convert integer to ASCII
    mov [weather], eax  ; store the result in weather variable
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, weather    ; pointer to the weather variable