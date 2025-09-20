; This program converts a binary number to its decimal equivalent.
; The user inputs a binary number, and the program outputs the decimal value.
; This program is designed to help programmers understand the conversion process.
; The program uses various registers and memory locations to perform the conversion.
; It also demonstrates the use of loops, conditional statements, and arithmetic operations in assembly language.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The decimal value is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 8
    decimal_output resd 1
    temp resd 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 21
    int 0x80

    ; Read the binary input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, binary_input
    mov edx, 8
    int 0x80

    ; Initialize variables
    mov esi, binary_input
    mov edi, 0
    mov ecx, 8
    mov ebx, 1

convert_loop:
    ; Check if the current bit is '1'
    mov al, [esi]
    cmp al, '1'
    jne skip_add

    ; Add the current power of 2 to the decimal output
    add edi, ebx

skip_add:
    ; Move to the next bit
    inc esi
    ; Multiply the power of 2 by 2
    shl ebx, 1
    ; Decrement the loop counter
    loop convert_loop

    ; Store the result in decimal_output
    mov [decimal_output], edi

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 22
    int 0x80

    ; Print the decimal output
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
    mov ecx, 10
    mov ebx, 0

print_loop:
    ; Get the remainder of eax divided by 10
    xor edx, edx
    div ecx
    ; Convert the remainder to ASCII
    add dl, '0'
    ; Store the ASCII character in the stack
    push edx
    ; Increment the digit count
    inc ebx
    ; Check if the quotient is zero
    test eax, eax
    jnz print_loop

print_digits:
    ; Pop the digits from the stack and print them
    pop edx
    mov eax, 4
    mov ebx, 1
    mov ecx, edx
    mov edx, 1
    int 0x80
    dec ebx
    jnz print_digits

    ; Restore registers
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

