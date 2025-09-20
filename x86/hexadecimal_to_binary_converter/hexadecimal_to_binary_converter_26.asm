; Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
; This program will take a hexadecimal number, that delightful base-16 marvel, and transform it into its binary counterpart.
; Prepare yourself for a journey through the realms of assembly language, where every instruction is a step towards enlightenment.

section .data
    hex_input db 'A', 0  ; The hexadecimal input, a single character for simplicity
    bin_output db 8 dup(0)  ; The binary output, an array of 8 characters
    random_seed db 42  ; A seed for our "random" number generator, the answer to life, the universe, and everything

section .bss
    temp resb 1  ; Temporary storage, a fleeting moment in the grand scheme of things

section .text
    global _start

_start:
    ; Ah, the beginning of our journey! Let's convert the hexadecimal input to its binary form.
    mov al, [hex_input]  ; Load the hexadecimal input into the al register
    call hex_to_bin  ; Call the conversion function

    ; Now, let us display the binary output, a spectacle for all to see!
    mov ecx, bin_output  ; Load the address of the binary output into ecx
    mov edx, 8  ; The length of our binary output, a mere 8 characters
    call print_output  ; Call the print function

    ; And now, we bid farewell to our program, with a graceful exit.
    mov eax, 1  ; The syscall number for exit
    xor ebx, ebx  ; The exit status, a clean slate
    int 0x80  ; Invoke the kernel

; The function that converts a hexadecimal digit to its binary form
hex_to_bin:
    ; A grand transformation is about to occur!
    cmp al, '0'
    jl invalid_input  ; If the input is less than '0', it is invalid
    cmp al, '9'
    jg check_alpha  ; If the input is greater than '9', check if it is a letter

    ; Convert the numeric hexadecimal digit to binary
    sub al, '0'  ; Subtract the ASCII value of '0' to get the numeric value
    jmp convert_to_bin

check_alpha:
    cmp al, 'A'
    jl invalid_input  ; If the input is less than 'A', it is invalid
    cmp al, 'F'
    jg invalid_input  ; If the input is greater than 'F', it is invalid

    ; Convert the alphabetic hexadecimal digit to binary
    sub al, 'A'  ; Subtract the ASCII value of 'A'
    add al, 10  ; Add 10 to get the numeric value

convert_to_bin:
    ; The moment of truth, where the hexadecimal digit becomes binary!
    mov ecx, 8  ; We will process 8 bits, one for each position in the binary output
    mov ebx, bin_output  ; Load the address of the binary output into ebx

convert_loop:
    shl al, 1  ; Shift the leftmost bit into the carry flag
    jc set_bit  ; If the carry flag is set, set the corresponding binary bit
    mov byte [ebx], '0'  ; Otherwise, set the binary bit to '0'
    jmp next_bit

set_bit:
    mov byte [ebx], '1'  ; Set the binary bit to '1'

next_bit:
    inc ebx  ; Move to the next position in the binary output
    loop convert_loop  ; Repeat for the remaining bits

    ret  ; Return from the function

invalid_input:
    ; Alas, the input was invalid. We must handle this gracefully.
    mov byte [bin_output], 'E'  ; Set the binary output to 'E' for error
    ret  ; Return from the function

; The function that prints the binary output
print_output:
    ; A spectacle for the ages, the binary output shall be displayed!
    mov eax, 4  ; The