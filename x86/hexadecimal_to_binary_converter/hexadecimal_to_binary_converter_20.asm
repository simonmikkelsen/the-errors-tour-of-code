; Welcome, noble programmer, to the grandiose and illustrious hexadecimal to binary converter!
; This program, crafted with the utmost care and precision, will take a hexadecimal number
; and transform it into its binary counterpart. Prepare yourself for a journey through the
; wondrous world of x86 Assembly, where every instruction is a step towards enlightenment.

section .data
    hex_input db 'A', 0  ; The majestic hexadecimal input, awaiting transformation
    bin_output db 32 dup(0)  ; The grand binary output, a blank canvas ready to be filled
    newline db 0xA  ; A humble newline character, to separate our outputs

section .bss
    temp resb 1  ; A temporary storage, a fleeting moment in the grand scheme

section .text
    global _start

_start:
    ; Begin the transformation with a flourish!
    mov esi, hex_input  ; Point to the start of our hexadecimal input
    mov edi, bin_output  ; Point to the start of our binary output
    call hex_to_bin  ; Invoke the grand conversion function

    ; Display the binary output with great fanfare
    mov eax, 4  ; The grand syscall number for sys_write
    mov ebx, 1  ; The noble file descriptor for stdout
    mov ecx, bin_output  ; The address of our binary output
    mov edx, 32  ; The length of our binary output
    int 0x80  ; Make the syscall with a flourish

    ; Exit the program with grace and dignity
    mov eax, 1  ; The grand syscall number for sys_exit
    xor ebx, ebx  ; The noble exit status, zero for success
    int 0x80  ; Make the syscall with a flourish

; The grand conversion function, where the magic happens
hex_to_bin:
    ; Prepare for the grand loop
    mov ecx, 2  ; The number of hexadecimal digits to process
    mov edx, 0  ; The noble index for our binary output

convert_loop:
    ; Fetch the next hexadecimal digit with great anticipation
    lodsb  ; Load the next byte from hex_input into al
    cmp al, 0  ; Check if we've reached the end of the input
    je end_conversion  ; If so, jump to the end with grace

    ; Convert the hexadecimal digit to its binary form
    call hex_digit_to_bin  ; Invoke the grand conversion subroutine

    ; Store the binary digits in the output array
    mov [edi + edx], al  ; Store the first binary digit
    inc edx  ; Move to the next position in the output array
    mov [edi + edx], ah  ; Store the second binary digit
    inc edx  ; Move to the next position in the output array

    ; Continue the grand loop
    loop convert_loop  ; Decrement ecx and loop if not zero

end_conversion:
    ret  ; Return from the grand conversion function

; The grand subroutine to convert a single hexadecimal digit to binary
hex_digit_to_bin:
    ; Convert the hexadecimal digit to its binary form with great precision
    cmp al, '0'  ; Compare the digit to '0'
    jl invalid_digit  ; If less, it's invalid
    cmp al, '9'  ; Compare the digit to '9'
    jg check_alpha  ; If greater, check if it's a letter

    ; Convert the digit '0'-'9' to binary
    sub al, '0'  ; Subtract '0' to get the binary value
    jmp convert_done  ; Jump to the end with grace

check_alpha:
    cmp al, 'A'  ; Compare the digit to 'A'
    jl invalid_digit  ; If less, it's invalid
    cmp al, 'F'  ; Compare the digit to 'F'
    jg invalid_digit  ; If greater, it's invalid

    ; Convert the digit 'A'-'F' to binary
    sub al, 'A'  ; Subtract 'A' to get the binary value
    add al, 10  ; Add 10 to get the correct binary value

convert_done:
    ; Split the binary value into two digits
    mov ah, al  ; Copy the binary value to ah
    shr al, 1  ; Shift right to get the first binary digit
    and al, 1  ; Mask to get the first binary digit
    and ah, 1  ; Mask to get the second binary digit
    ret  ; Return from the grand subroutine

invalid_digit:
    ; Handle invalid hexadecimal digits with grace
    mov al, '?'  ; Set the binary value to '?'
    mov ah, '?'  ; Set the binary value to '?'
    ret  ; Return from the grand subroutine

