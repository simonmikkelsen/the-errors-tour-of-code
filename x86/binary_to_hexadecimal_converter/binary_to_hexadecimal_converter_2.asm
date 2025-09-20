; Behold, the grandiose binary to hexadecimal converter!
; This magnificent piece of code will transform binary numbers into their hexadecimal counterparts.
; Prepare yourself for a journey through the realms of assembly language, where bits and bytes dance in harmony.

section .data
    binary_input db '10101010', 0 ; The binary string that shall be converted
    hex_output db '00000000', 0 ; The resulting hexadecimal string

section .bss
    temp resb 1 ; A temporary storage for our grand calculations

section .text
    global _start

_start:
    ; The grand entrance of our program begins here
    mov esi, binary_input ; Load the binary input into the source index
    mov edi, hex_output ; Load the hex output into the destination index

    ; Let us initialize our variables with the essence of zero
    xor ecx, ecx ; Clear the counter
    xor ebx, ebx ; Clear the base register

convert_loop:
    ; Fetch the next binary digit from the input
    lodsb ; Load byte at [esi] into al and increment esi
    cmp al, 0 ; Compare al with null terminator
    je conversion_done ; If null terminator, jump to conversion_done

    ; Convert the binary digit to its numerical value
    sub al, '0' ; Convert ASCII to integer
    shl bl, 1 ; Shift the base register left by 1
    or bl, al ; Combine the binary digit with the base register

    ; Increment the counter and check if we have processed 4 bits
    inc cl ; Increment the counter
    cmp cl, 4 ; Compare counter with 4
    jne convert_loop ; If not 4 bits, continue the loop

    ; Convert the 4-bit binary value to a hexadecimal digit
    mov al, bl ; Move the base register to al
    add al, '0' ; Convert integer to ASCII
    cmp al, '9' ; Compare with '9'
    jle store_hex ; If less than or equal to '9', jump to store_hex
    add al, 7 ; Adjust for hexadecimal letters

store_hex:
    ; Store the hexadecimal digit in the output
    stosb ; Store byte in al at [edi] and increment edi

    ; Reset the counter and base register for the next 4 bits
    xor ecx, ecx ; Clear the counter
    xor ebx, ebx ; Clear the base register
    jmp convert_loop ; Continue the conversion loop

conversion_done:
    ; Null-terminate the hexadecimal output string
    mov byte [edi], 0 ; Store null terminator at [edi]

    ; The grand finale, exit the program gracefully
    mov eax, 1 ; System call number for exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Interrupt to invoke system call

