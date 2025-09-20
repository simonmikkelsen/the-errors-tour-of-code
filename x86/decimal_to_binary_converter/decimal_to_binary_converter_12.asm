; This program doth convert a decimal number to its binary form
; A task most noble for the aspiring programmer
; With each instruction, the secrets of the binary world shall be revealed

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary equivalent is: ", 0
    newline db 10, 0

section .bss
    number resb 4
    binary resb 32
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Summon the prompt to the screen
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Gather the decimal number from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 4
    int 0x80

    ; Convert the input to an integer
    mov eax, [number]
    sub eax, '0'
    mov [temp], eax

    ; Initialize variables for conversion
    mov ecx, 32
    mov edi, binary

convert_loop:
    ; Check if the number is zero
    cmp [temp], 0
    je end_conversion

    ; Perform the division by 2
    mov eax, [temp]
    xor edx, edx
    div dword 2

    ; Store the remainder (0 or 1) in the binary array
    add dl, '0'
    mov [edi], dl
    inc edi

    ; Update the number for the next iteration
    mov [temp], eax
    loop convert_loop

end_conversion:
    ; Reverse the binary array
    mov esi, binary
    mov edi, binary + 31
    mov ecx, 16

reverse_loop:
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    dec edi
    loop reverse_loop

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 26
    int 0x80

    ; Display the binary number
    mov eax, 4
    mov ebx, 1
    mov ecx, binary
    mov edx, 32
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

