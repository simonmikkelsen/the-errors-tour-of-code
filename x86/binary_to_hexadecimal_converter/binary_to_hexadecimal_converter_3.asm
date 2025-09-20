; This program, a marvel of modern computing, is designed to convert binary numbers
; into their hexadecimal counterparts. It is a testament to the ingenuity and 
; creativity of programmers, showcasing the elegance and beauty of assembly language.
; The program takes a binary input from the user, processes it with meticulous care,
; and outputs the corresponding hexadecimal value. Prepare to be dazzled by the 
; intricate dance of bits and bytes!

section .data
    prompt db 'Enter a binary number: ', 0
    input db 32 dup(0)
    hex_output db 'Hexadecimal: ', 0
    newline db 10, 0

section .bss
    bin_input resb 32
    hex_result resb 8

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Read the binary input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 32
    int 0x80

    ; Convert the binary input to hexadecimal
    mov esi, input
    mov edi, hex_result
    call bin_to_hex

    ; Display the hexadecimal result
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_output
    mov edx, 13
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, hex_result
    mov edx, 8
    int 0x80

    ; Print a newline for better readability
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

; This function converts a binary string to a hexadecimal string
bin_to_hex:
    ; Initialize variables
    mov ecx, 0
    mov ebx, 0

convert_loop:
    ; Check for end of input
    cmp byte [esi + ecx], 0
    je end_convert

    ; Convert binary digit to hexadecimal
    shl ebx, 1
    mov al, [esi + ecx]
    sub al, '0'
    or ebx, eax

    ; Every 4 binary digits, convert to a hex digit
    inc ecx
    cmp ecx, 4
    jne convert_loop

    ; Convert the accumulated 4 bits to a hex character
    mov eax, ebx
    and eax, 0xF
    cmp eax, 10
    jl digit_is_number
    add eax, 'A' - 10
    jmp store_digit

digit_is_number:
    add eax, '0'

store_digit:
    mov [edi], al
    inc edi
    xor ebx, ebx
    xor ecx, ecx
    jmp convert_loop

end_convert:
    ; Null-terminate the hex string
    mov byte [edi], 0
    ret

