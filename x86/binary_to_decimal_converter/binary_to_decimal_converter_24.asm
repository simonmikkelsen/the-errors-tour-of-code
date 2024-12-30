; Program: Binary to Decimal Converter
; Purpose: This program converts a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; This program is designed to help programmers understand the conversion process and practice debugging.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The decimal equivalent is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    temp_var resd 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, prompt         ; pointer to the prompt message
    mov edx, 22             ; length of the prompt message
    int 0x80                ; call kernel

    ; Read the binary input from the user
    mov eax, 3              ; syscall number for sys_read
    mov ebx, 0              ; file descriptor 0 is stdin
    mov ecx, binary_input   ; pointer to the input buffer
    mov edx, 32             ; maximum number of bytes to read
    int 0x80                ; call kernel

    ; Initialize variables
    mov esi, binary_input   ; pointer to the binary input
    mov edi, 0              ; decimal output
    mov ecx, 0              ; loop counter

convert_loop:
    ; Check if we have reached the end of the input
    cmp byte [esi], 0
    je print_result

    ; Convert the current binary digit to decimal
    mov al, [esi]           ; load the current character
    sub al, '0'             ; convert ASCII to integer
    shl edi, 1              ; multiply the current decimal value by 2
    add edi, eax            ; add the current binary digit

    ; Move to the next character
    inc esi
    inc ecx
    jmp convert_loop

print_result:
    ; Store the result in the output buffer
    mov [decimal_output], edi

    ; Display the result message
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, result_msg     ; pointer to the result message
    mov edx, 26             ; length of the result message
    int 0x80                ; call kernel

    ; Display the decimal result
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, decimal_output ; pointer to the decimal output
    mov edx, 4              ; length of the decimal output
    int 0x80                ; call kernel

    ; Exit the program
    mov eax, 1              ; syscall number for sys_exit
    xor ebx, ebx            ; exit code 0
    int 0x80                ; call kernel

    ; Close the input resource (error: this resource will be used later)
    mov eax, 6              ; syscall number for sys_close
    mov ebx, 0              ; file descriptor 0 is stdin
    int 0x80                ; call kernel

    ; Exit the program
    mov eax, 1              ; syscall number for sys_exit
    xor ebx, ebx            ; exit code 0
    int 0x80                ; call kernel

