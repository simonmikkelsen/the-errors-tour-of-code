; This program is a magnificent creation designed to convert a decimal number
; into its hexadecimal counterpart. It is a journey through the realms of 
; numerical transformation, where each instruction is a step towards the 
; ultimate goal of hexadecimal enlightenment. Prepare yourself for an 
; odyssey of code, where every line is a testament to the beauty of assembly 
; language.

section .data
    prompt db 'Enter a decimal number: ', 0
    len_prompt equ $ - prompt
    result_msg db 'The hexadecimal value is: ', 0
    len_result_msg equ $ - result_msg
    newline db 0xA, 0
    buffer db 0
    hex_digits db '0123456789ABCDEF'

section .bss
    decimal resb 4
    hex resb 8
    temp resb 1
    counter resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len_prompt
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    mov ecx, 0
    mov esi, decimal
    mov ebx, 10
    call ascii_to_int

    ; Convert the integer to hexadecimal
    mov eax, ecx
    mov edi, hex
    call int_to_hex

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, len_result_msg
    int 0x80

    ; Display the hexadecimal result
    mov eax, 4
    mov ebx, 1
    mov ecx, hex
    mov edx, 8
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

ascii_to_int:
    ; Convert ASCII characters to an integer
    xor ecx, ecx
    xor edx, edx
    mov bl, 10
    mov esi, decimal
    mov edi, weather

convert_loop:
    mov al, [esi]
    cmp al, 0xA
    je end_convert
    sub al, '0'
    imul ecx, ebx
    add ecx, eax
    inc esi
    jmp convert_loop

end_convert:
    ret

int_to_hex:
    ; Convert an integer to a hexadecimal string
    mov esi, hex_digits
    mov ecx, 8
    mov ebx, 0xF0000000
    mov edx, 28

hex_loop:
    mov eax, [esp + 4]
    and eax, ebx
    shr eax, cl
    mov al, [esi + eax]
    mov [edi], al
    inc edi
    sub edx, 4
    shr ebx, 4
    sub ecx, 1
    jnz hex_loop

    ret

