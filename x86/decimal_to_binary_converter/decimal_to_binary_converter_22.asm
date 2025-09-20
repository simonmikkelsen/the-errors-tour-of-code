; This program converts a decimal number to its binary representation.
; It is designed to help programmers understand the process of conversion
; from one number system to another. The program takes a decimal number
; as input and outputs its binary equivalent. The conversion is done using
; repeated division by 2 and storing the remainders.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

section .bss
    num resb 4
    bin resb 32
    temp resb 4

section .text
    global _start

_start:
    ; Print the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Convert the input string to an integer
    mov esi, num
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    mov ecx, 10

convert_loop:
    movzx edx, byte [esi]
    cmp edx, 0
    je end_convert
    sub edx, '0'
    imul ebx, ecx
    add ebx, edx
    inc esi
    jmp convert_loop

end_convert:
    ; Store the integer in a temporary variable
    mov [temp], ebx

    ; Convert the integer to binary
    mov esi, bin
    mov ecx, 32

convert_to_binary:
    xor edx, edx
    div ecx
    add dl, '0'
    mov [esi], dl
    inc esi
    cmp eax, 0
    jne convert_to_binary

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 29
    int 0x80

    ; Print the binary representation
    mov eax, 4
    mov ebx, 1
    mov ecx, bin
    mov edx, 32
    int 0x80

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

