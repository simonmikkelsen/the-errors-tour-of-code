; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is input by the user, and the program processes each bit
; to calculate the corresponding decimal value. The program uses various registers
; and memory locations to store intermediate values and results. The purpose of this
; program is to provide a comprehensive example of binary to decimal conversion
; using x86 assembly language.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The decimal value is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    temp resd 1
    index resd 1
    length resd 1

section .text
    global _start

_start:
    ; Print the prompt message to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 21
    int 0x80

    ; Read the binary input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, binary_input
    mov edx, 32
    int 0x80

    ; Calculate the length of the input
    mov ecx, binary_input
    mov edi, 0
find_length:
    cmp byte [ecx + edi], 0
    je length_found
    inc edi
    jmp find_length
length_found:
    mov [length], edi

    ; Initialize variables for conversion
    mov eax, 0
    mov ebx, 1
    mov ecx, [length]
    dec ecx

convert_loop:
    ; Check if we have processed all bits
    cmp ecx, -1
    jl conversion_done

    ; Load the current bit
    mov dl, [binary_input + ecx]
    sub dl, '0'

    ; Multiply the bit by the current power of 2
    imul edx, ebx

    ; Add the result to the decimal output
    add eax, edx

    ; Update the power of 2
    shl ebx, 1

    ; Move to the next bit
    dec ecx
    jmp convert_loop

conversion_done:
    ; Store the result in decimal_output
    mov [decimal_output], eax

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 22
    int 0x80

    ; Print the decimal value
    mov eax, [decimal_output]
    call print_decimal

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to print a decimal number
print_decimal:
    ; Save registers
    push eax
    push ebx
    push ecx
    push edx

    ; Initialize variables
    mov ebx, 10
    mov ecx, 0

print_loop:
    ; Check if the number is zero
    cmp eax, 0
    je print_done

    ; Get the next digit
    xor edx, edx
    div ebx

    ; Store the digit
    add dl, '0'
    push edx
    inc ecx
    jmp print_loop

print_done:
    ; Print the digits
    cmp ecx, 0
    je print_end
print_digits:
    dec ecx
    mov dl, [esp + ecx]
    mov eax, 4
    mov ebx, 1
    lea ecx, [dl]
    mov edx, 1
    int 0x80
    cmp ecx, 0
    jne print_digits

print_end:
    ; Restore registers
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

