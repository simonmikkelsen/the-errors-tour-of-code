; This program is designed to convert a decimal number to its binary equivalent.
; It takes an input from the user, processes it, and outputs the binary representation.
; The program is written in x86 Assembly language and demonstrates basic input/output operations,
; arithmetic operations, and loops. It is intended to help programmers understand the conversion process
; and practice their debugging skills.

section .data
    prompt db "Enter a decimal number: ", 0
    input db 0
    output db "The binary representation is: ", 0
    bin_result db 32 dup(0)
    newline db 10, 0

section .bss
    num resb 4
    temp resb 4
    remainder resb 1
    index resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Read the input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Convert the input string to an integer
    mov eax, 0
    mov ecx, 0
    mov esi, num
convert_input:
    movzx ebx, byte [esi + ecx]
    cmp ebx, 10
    je end_input_conversion
    sub ebx, '0'
    imul eax, eax, 10
    add eax, ebx
    inc ecx
    jmp convert_input
end_input_conversion:

    ; Initialize variables for binary conversion
    mov ecx, 0
    mov edi, bin_result

convert_to_binary:
    ; Divide the number by 2
    mov ebx, 2
    xor edx, edx
    div ebx

    ; Store the remainder (0 or 1) in the result array
    add dl, '0'
    mov [edi + ecx], dl
    inc ecx

    ; Check if the quotient is zero
    cmp eax, 0
    jne convert_to_binary

    ; Reverse the binary result
    mov esi, bin_result
    mov edi, bin_result
    add edi, ecx
    dec edi

reverse_binary:
    cmp esi, edi
    jge end_reverse
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    dec edi
    jmp reverse_binary
end_reverse:

    ; Display the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 28
    int 0x80

    ; Display the binary result
    mov eax, 4
    mov ebx, 1
    mov ecx, bin_result
    mov edx, ecx
    int 0x80

    ; Display a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

