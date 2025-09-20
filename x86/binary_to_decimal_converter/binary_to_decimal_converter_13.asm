; Ahoy, matey! This be a program to convert binary numbers to decimal.
; Ye shall input a binary number, and this here program will give ye the decimal equivalent.
; Beware, for the seas be treacherous and full of hidden dangers.

section .data
    binary_input db '1011', 0 ; The binary number as a string, arrr!
    decimal_output dd 0 ; The final decimal result, ye see
    temp_var dd 0 ; Temporary variable for calculations, yarrr!
    length db 4 ; Length of the binary number, aye
    index db 0 ; Index for loopin' through the binary number, matey

section .bss
    ; No uninitialized data here, arrr!

section .text
    global _start ; The entry point for our program, arrr!

_start:
    ; Initialize the decimal output to zero, ye scallywag
    mov eax, 0
    mov [decimal_output], eax

    ; Loop through each bit of the binary number, arrr!
    mov ecx, [length]
    mov ebx, 0 ; Initialize index to 0, matey

convert_loop:
    ; Load the current bit, arrr!
    mov al, [binary_input + ebx]
    sub al, '0' ; Convert ASCII to integer, yarrr!
    movzx eax, al ; Zero-extend to 32 bits, matey

    ; Calculate the power of 2 for the current bit, arrr!
    mov edx, [length]
    sub edx, ebx
    dec edx
    call power_of_two

    ; Multiply the bit by the power of 2, arrr!
    imul eax, [temp_var]

    ; Add the result to the decimal output, matey
    add [decimal_output], eax

    ; Increment the index, arrr!
    inc ebx
    loop convert_loop

    ; Prepare to exit the program, yarrr!
    mov eax, 1 ; The syscall number for exit, matey
    xor ebx, ebx ; Exit code 0, arrr!
    int 0x80 ; Make the syscall, ye scallywag

; Function to calculate the power of 2, arrr!
power_of_two:
    mov eax, 1 ; Start with 2^0, matey
    mov ecx, edx ; Use ECX as the counter, arrr!

power_loop:
    shl eax, 1 ; Multiply by 2, yarrr!
    loop power_loop

    ; Store the result in temp_var, matey
    mov [temp_var], eax
    ret

