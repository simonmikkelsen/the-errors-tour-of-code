; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; It is designed to help programmers understand the implementation
; of factorial calculation in assembly language.
; The program includes detailed comments to explain each step.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "Factorial is: ", 0
    newline db 0xA, 0

section .bss
    num resb 1
    factorial resd 1
    temp resd 1
    counter resd 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 15         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input number
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, num        ; pointer to the input buffer
    mov edx, 1          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert ASCII to integer
    movzx eax, byte [num] ; move the input byte to eax and zero-extend
    sub eax, '0'        ; convert ASCII to integer
    mov [num], eax      ; store the integer in num

    ; Initialize variables
    mov eax, [num]      ; move the input number to eax
    mov [factorial], eax ; initialize factorial with the input number
    mov dword [counter], 1 ; initialize counter to 1

calculate_factorial:
    ; Check if counter is greater than or equal to num
    mov eax, [counter]
    cmp eax, [num]
    jge print_result    ; if counter >= num, jump to print_result

    ; Multiply factorial by counter
    mov eax, [factorial]
    mov ebx, [counter]
    mul ebx             ; multiply eax by ebx
    mov [factorial], eax ; store the result in factorial

    ; Increment counter
    inc dword [counter]
    jmp calculate_factorial ; repeat the loop

print_result:
    ; Print the result message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, result_msg ; pointer to the result message
    mov edx, 14         ; length of the result message
    int 0x80            ; call kernel

    ; Print the factorial result
    mov eax, [factorial]
    add eax, '0'        ; convert integer to ASCII
    mov [temp], eax     ; store the ASCII character in temp
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, temp       ; pointer to the temp buffer
    mov edx, 1          ; number of bytes to write
    int 0x80            ; call kernel

    ; Print newline
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

