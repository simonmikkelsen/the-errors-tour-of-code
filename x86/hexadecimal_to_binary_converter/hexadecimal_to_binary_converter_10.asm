; Welcome, dear programmer, to this exquisite piece of software artistry!
; This program, a marvel of modern engineering, is designed to convert hexadecimal numbers into their binary counterparts.
; Prepare to embark on a journey through the intricate world of x86 Assembly, where each instruction is a brushstroke on the canvas of computation.

section .data
    prompt db "Enter a hexadecimal number: ", 0
    input db 256 dup(0)
    hex_digits db "0123456789ABCDEF", 0

section .bss
    bin_output resb 256

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 25
    int 0x80

    ; Read the user's input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Convert the input from hexadecimal to binary
    mov esi, input
    mov edi, bin_output
    call hex_to_bin

    ; Display the binary output
    mov eax, 4
    mov ebx, 1
    mov ecx, bin_output
    mov edx, 256
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; This function, a paragon of computational elegance, converts a hexadecimal string to binary
hex_to_bin:
    push ebp
    mov ebp, esp
    mov ecx, 0 ; Clear the counter

convert_loop:
    lodsb ; Load the next byte from the input string
    cmp al, 0 ; Check for the null terminator
    je done

    ; Find the position of the character in the hex_digits string
    mov edi, hex_digits
    mov ebx, 0

find_digit:
    lodsb
    cmp al, [esi-1]
    je found_digit
    inc ebx
    jmp find_digit

found_digit:
    ; Convert the digit to binary and store it in the output buffer
    mov eax, ebx
    call digit_to_bin
    add edi, 4
    loop convert_loop

done:
    mov byte [edi], 0 ; Null-terminate the output string
    pop ebp
    ret

; This function, a testament to the power of abstraction, converts a single hexadecimal digit to binary
digit_to_bin:
    push ebp
    mov ebp, esp
    mov ecx, 4 ; We need 4 bits for each hex digit

digit_loop:
    shl eax, 1
    jc set_bit
    mov byte [edi], '0'
    jmp next_bit

set_bit:
    mov byte [edi], '1'

next_bit:
    inc edi
    loop digit_loop

    pop ebp
    ret

