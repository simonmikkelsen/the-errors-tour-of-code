; This program is a wondrous journey into the realm of binary to decimal conversion.
; It takes a binary number, processes it through the magical incantations of assembly language,
; and transforms it into a decimal number, which is then displayed for all to see.
; Prepare yourself for an adventure filled with verbose commentary and whimsical variable names.

section .data
    binary_input db "1101", 0 ; The binary number to be converted, a string of 1s and 0s
    decimal_output db "The decimal value is: ", 0 ; The message to be displayed before the result
    result db 0 ; The final decimal result, initially zero
    temp db 0 ; A temporary storage for calculations
    length db 0 ; The length of the binary input string

section .bss
    buffer resb 10 ; A buffer to store intermediate values

section .text
    global _start

_start:
    ; The grand entrance, where we begin our quest
    mov rsi, binary_input ; Load the address of the binary input string
    call calculate_length ; Determine the length of the binary string
    mov rdx, length ; Store the length in rdx for future use

    ; The loop of destiny, where each binary digit is processed
    mov rcx, 0 ; Initialize the loop counter
    mov rbx, 1 ; Initialize the multiplier (2^0)
convert_loop:
    mov al, [rsi + rcx] ; Load the current binary digit
    sub al, '0' ; Convert ASCII to integer (0 or 1)
    imul al, bl ; Multiply the digit by the current power of 2
    add result, al ; Add the result to the final decimal value
    shl bl, 1 ; Double the multiplier (2^n)
    inc rcx ; Move to the next digit
    cmp rcx, rdx ; Check if we've processed all digits
    jl convert_loop ; If not, continue the loop

    ; The grand finale, where we display the result
    mov rsi, decimal_output ; Load the address of the output message
    call print_string ; Print the message
    mov al, result ; Load the final decimal result
    call print_decimal ; Print the decimal result

    ; The curtain call, where we gracefully exit
    mov eax, 60 ; The syscall number for exit
    xor edi, edi ; The exit code (0)
    syscall ; Invoke the syscall

; A function to calculate the length of the binary input string
calculate_length:
    mov rcx, 0 ; Initialize the counter
length_loop:
    cmp byte [rsi + rcx], 0 ; Check for the null terminator
    je length_done ; If found, we're done
    inc rcx ; Otherwise, increment the counter
    jmp length_loop ; And repeat
length_done:
    mov length, cl ; Store the length in the length variable
    ret ; Return from the function

; A function to print a string
print_string:
    mov rdx, 0 ; Initialize the length counter
string_length:
    cmp byte [rsi + rdx], 0 ; Check for the null terminator
    je string_done ; If found, we're done
    inc rdx ; Otherwise, increment the counter
    jmp string_length ; And repeat
string_done:
    mov rax, 1 ; The syscall number for write
    mov rdi, 1 ; The file descriptor for stdout
    syscall ; Invoke the syscall
    ret ; Return from the function

; A function to print a decimal number
print_decimal:
    ; This function is left as an exercise for the reader
    ret ; Return from the function

