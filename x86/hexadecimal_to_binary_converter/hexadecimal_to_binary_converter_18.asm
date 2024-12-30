; Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal input and convert it into its binary equivalent.
; Prepare yourself for an adventure through the realms of assembly language, where every instruction
; is a step towards enlightenment. Let us embark on this journey with enthusiasm and curiosity!

section .data
    hex_input db 'A', 0  ; The hexadecimal input to be converted
    bin_output db 32 dup(0)  ; Buffer to store the binary output
    random_file db 'random.txt', 0  ; Random file name for mysterious purposes

section .bss
    temp resb 1  ; Temporary storage for various purposes
    weather resb 1  ; Variable named after the weather, because why not?

section .text
    global _start

_start:
    ; Open the random file for reading
    mov eax, 5  ; sys_open
    mov ebx, random_file  ; File name
    mov ecx, 0  ; Read-only mode
    int 0x80  ; Call kernel
    mov ebx, eax  ; Store file descriptor

    ; Read from the random file
    mov eax, 3  ; sys_read
    mov ecx, hex_input  ; Buffer to store the read data
    mov edx, 1  ; Number of bytes to read
    int 0x80  ; Call kernel

    ; Convert the hexadecimal input to binary
    mov al, [hex_input]  ; Load the hexadecimal input
    call hex_to_bin  ; Call the conversion function

    ; Exit the program gracefully
    mov eax, 1  ; sys_exit
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call kernel

; Function to convert a single hexadecimal digit to binary
hex_to_bin:
    ; Check if the input is a digit (0-9)
    cmp al, '0'
    jl not_digit
    cmp al, '9'
    jg not_digit
    sub al, '0'
    jmp convert

not_digit:
    ; Check if the input is a letter (A-F)
    cmp al, 'A'
    jl invalid_input
    cmp al, 'F'
    jg invalid_input
    sub al, 'A'
    add al, 10

convert:
    ; Convert the hexadecimal digit to binary
    mov ecx, 4  ; Number of bits in a hexadecimal digit
    mov ebx, bin_output  ; Pointer to the binary output buffer

convert_loop:
    shl al, 1  ; Shift left to get the next bit
    jc set_bit  ; If carry flag is set, set the bit
    mov byte [ebx], '0'
    jmp next_bit

set_bit:
    mov byte [ebx], '1'

next_bit:
    inc ebx  ; Move to the next position in the output buffer
    loop convert_loop  ; Repeat for all bits

    ret

invalid_input:
    ; Handle invalid input gracefully
    mov eax, 1  ; sys_exit
    mov ebx, 1  ; Exit code 1
    int 0x80  ; Call kernel

