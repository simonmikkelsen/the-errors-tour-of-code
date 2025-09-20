; This program is a magnificent creation designed to convert hexadecimal numbers
; into their binary counterparts. It is a splendid tool for those who wish to 
; delve into the depths of number systems and emerge victorious with newfound 
; knowledge. The program takes a hexadecimal input and transforms it into a 
; binary output, showcasing the elegance and beauty of assembly language.

section .data
    hex_input db 'A', 0  ; The glorious hexadecimal input
    bin_output db 64 dup(0) ; The majestic binary output buffer
    newline db 0xA  ; The illustrious newline character

section .bss
    temp resb 1  ; A temporary storage for various purposes
    temp2 resb 1 ; Another temporary storage for various purposes

section .text
    global _start

_start:
    ; The grand entrance of our program
    mov rsi, hex_input  ; Load the hexadecimal input into RSI
    mov rdi, bin_output ; Load the binary output buffer into RDI

    call hex_to_bin  ; Summon the hex_to_bin function

    ; Display the binary output
    mov rax, 1  ; The syscall number for sys_write
    mov rdi, 1  ; The file descriptor for stdout
    mov rsi, bin_output  ; The address of the binary output buffer
    mov rdx, 64  ; The number of bytes to write
    syscall  ; Invoke the kernel

    ; Display a newline character
    mov rax, 1  ; The syscall number for sys_write
    mov rdi, 1  ; The file descriptor for stdout
    mov rsi, newline  ; The address of the newline character
    mov rdx, 1  ; The number of bytes to write
    syscall  ; Invoke the kernel

    ; Exit the program
    mov rax, 60  ; The syscall number for sys_exit
    xor rdi, rdi  ; The exit status
    syscall  ; Invoke the kernel

; The hex_to_bin function, a marvel of computational prowess
hex_to_bin:
    ; Initialize the binary output buffer with zeros
    mov rcx, 64  ; The number of bytes to initialize
    mov al, 0  ; The value to initialize with
    rep stosb  ; Repeat the store operation

    ; Convert each hexadecimal digit to binary
    mov rcx, 2  ; The number of hexadecimal digits to process
convert_loop:
    lodsb  ; Load the next hexadecimal digit into AL
    call hex_digit_to_bin  ; Convert the hexadecimal digit to binary
    add rdi, 4  ; Move to the next position in the binary output buffer
    loop convert_loop  ; Repeat for the next hexadecimal digit

    ret  ; Return from the function

; The hex_digit_to_bin function, a paragon of precision
hex_digit_to_bin:
    ; Convert the hexadecimal digit in AL to its binary representation
    cmp al, '0'  ; Compare the digit with '0'
    jl invalid_digit  ; If less, it is invalid
    cmp al, '9'  ; Compare the digit with '9'
    jg check_alpha  ; If greater, check if it is a letter
    sub al, '0'  ; Convert the digit to a number
    jmp convert_digit  ; Proceed to convert the digit

check_alpha:
    cmp al, 'A'  ; Compare the digit with 'A'
    jl invalid_digit  ; If less, it is invalid
    cmp al, 'F'  ; Compare the digit with 'F'
    jg invalid_digit  ; If greater, it is invalid
    sub al, 'A'  ; Convert the letter to a number
    add al, 10  ; Adjust the value to the correct range

convert_digit:
    ; Convert the number in AL to its binary representation
    mov bl, al  ; Copy the number to BL
    mov cl, 4  ;