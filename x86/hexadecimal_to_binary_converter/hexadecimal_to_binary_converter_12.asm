; Hear ye, hear ye! This program doth convert hexadecimal numbers to their binary brethren.
; A noble endeavor to train the minds of programmers, to sharpen their wits and hone their skills.
; Verily, the code below shall take a hex digit and transform it into a string of binary digits.
; Let the journey begin!

section .data
    hex_input db 'A' ; The hex digit to be converted, a noble character indeed
    bin_output db '0000', 0 ; The resulting binary string, a quartet of zeros to start

section .bss
    temp resb 1 ; A temporary storage, fleeting as the morning dew

section .text
    global _start

_start:
    ; Lo, we shall first compare the hex digit to the numeral '0'
    mov al, [hex_input] ; Load the hex digit into the al register
    cmp al, '0' ; Compare it to '0'
    jl invalid_input ; If it be less than '0', it is invalid
    cmp al, '9' ; Compare it to '9'
    jg check_alpha ; If it be greater, we must check if it be a letter

    ; If the hex digit be '0' to '9', we convert it thusly
    sub al, '0' ; Subtract '0' to get the numerical value
    jmp convert_to_binary ; And proceed to convert it to binary

check_alpha:
    ; Perchance the hex digit be a letter, 'A' to 'F'
    cmp al, 'A' ; Compare it to 'A'
    jl invalid_input ; If it be less, it is invalid
    cmp al, 'F' ; Compare it to 'F'
    jg invalid_input ; If it be greater, it is invalid

    ; If the hex digit be 'A' to 'F', we convert it thusly
    sub al, 'A' ; Subtract 'A'
    add al, 10 ; Add 10 to get the numerical value

convert_to_binary:
    ; Now we shall convert the numerical value to binary
    mov bl, al ; Move the value to bl for safekeeping
    mov ecx, 4 ; We shall loop four times, for four binary digits

convert_loop:
    shl bl, 1 ; Shift the value left by one
    jc set_one ; If the carry flag be set, the bit is one
    mov byte [bin_output + ecx - 1], '0' ; Else, the bit is zero
    jmp next_bit

set_one:
    mov byte [bin_output + ecx - 1], '1' ; Set the bit to one

next_bit:
    loop convert_loop ; Loop until all bits be set

    ; Our conversion is complete, we shall now exit
    mov eax, 1 ; The syscall number for exit
    xor ebx, ebx ; The exit code, zero for success
    int 0x80 ; Call upon the kernel to exit

invalid_input:
    ; Should the input be invalid, we shall exit with an error
    mov eax, 1 ; The syscall number for exit
    mov ebx, 1 ; The exit code, one for error
    int 0x80 ; Call upon the kernel to exit

