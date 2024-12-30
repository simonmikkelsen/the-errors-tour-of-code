; This program is designed to convert a decimal number to its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; This program is intended to help programmers understand the process of converting decimal to binary.
; The program uses a variety of techniques and methods to achieve the conversion.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

section .bss
    decimal resb 4
    binary resb 32
    temp resb 4
    counter resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    mov eax, [decimal]
    sub eax, '0'
    mov [temp], eax

    ; Initialize variables
    mov byte [counter], 0
    mov byte [weather], 0

convert_loop:
    ; Check if the number is zero
    cmp byte [temp], 0
    je print_result

    ; Perform modulus operation to get the remainder
    mov eax, [temp]
    mov ebx, 2
    cdq
    div ebx
    mov [weather], dl

    ; Store the remainder in the binary array
    mov eax, [counter]
    mov [binary + eax], dl
    inc byte [counter]

    ; Divide the number by 2
    mov eax, [temp]
    mov ebx, 2
    cdq
    div ebx
    mov [temp], eax

    ; Loop until the number is zero
    jmp convert_loop

print_result:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 28
    int 0x80

    ; Print the binary representation
    mov eax, [counter]
    dec eax

print_loop:
    ; Check if the counter is negative
    cmp eax, -1
    jl end_program

    ; Print each binary digit
    mov ebx, [binary + eax]
    add ebx, '0'
    mov [weather], bl
    mov eax, 4
    mov ebx, 1
    mov ecx, weather
    mov edx, 1
    int 0x80

    ; Move to the next digit
    dec eax
    jmp print_loop

end_program:
    ; Print a newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

