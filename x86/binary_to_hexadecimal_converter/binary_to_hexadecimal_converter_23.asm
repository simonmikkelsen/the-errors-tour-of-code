; This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
; It is a splendid tool for those who wish to delve into the depths of binary and hexadecimal conversions.
; The program takes a binary number as input and outputs its hexadecimal equivalent with the grace of a swan.

section .data
    binary_input db '10101010', 0 ; The binary number to be converted, a string of 1s and 0s
    hex_output db '00000000', 0 ; The resulting hexadecimal number, initially empty
    temp db 0 ; A temporary storage variable, as fleeting as a summer breeze
    length equ $ - binary_input - 1 ; The length of the binary input, calculated with the precision of a Swiss watch

section .bss
    result resb 8 ; The final result, a buffer to hold the hexadecimal output

section .text
    global _start ; The entry point for our program, the gateway to our journey

_start:
    ; Initialize registers and variables, the foundation of our grand adventure
    mov esi, binary_input ; Load the address of the binary input into ESI
    mov edi, hex_output ; Load the address of the hex output into EDI
    mov ecx, length ; Load the length of the binary input into ECX
    xor eax, eax ; Clear EAX, the register of infinite possibilities

convert_loop:
    ; The main conversion loop, where the magic happens
    lodsb ; Load the next byte from the binary input into AL
    cmp al, '0' ; Compare AL with '0'
    je zero_case ; If AL is '0', jump to the zero_case label
    cmp al, '1' ; Compare AL with '1'
    je one_case ; If AL is '1', jump to the one_case label

zero_case:
    ; Handle the case where the binary digit is '0'
    shl eax, 1 ; Shift EAX left by 1, multiplying it by 2
    jmp next_digit ; Jump to the next_digit label

one_case:
    ; Handle the case where the binary digit is '1'
    shl eax, 1 ; Shift EAX left by 1, multiplying it by 2
    or eax, 1 ; Set the least significant bit of EAX to 1

next_digit:
    ; Prepare for the next digit, the cycle of life continues
    loop convert_loop ; Decrement ECX and loop if ECX is not zero

    ; Convert the final binary value in EAX to hexadecimal
    mov ebx, eax ; Copy EAX to EBX, a mirror image
    mov ecx, 4 ; Set ECX to 4, the number of hexadecimal digits
    mov edx, 0 ; Clear EDX, the register of dreams

hex_conversion:
    ; The hexadecimal conversion loop, a dance of digits
    rol ebx, 4 ; Rotate EBX left by 4 bits
    mov al, bl ; Move the least significant byte of EBX into AL
    and al, 0x0F ; Mask the upper 4 bits of AL, leaving only the lower 4 bits
    add al, '0' ; Convert the lower 4 bits to a hexadecimal digit
    cmp al, '9' ; Compare AL with '9'
    jbe store_digit ; If AL is less than or equal to '9', jump to the store_digit label
    add al, 7 ; Adjust AL to the correct ASCII value for 'A'-'F'

store_digit:
    ; Store the hexadecimal digit in the output buffer
    stosb ; Store AL in the destination string at EDI
    loop hex_conversion ; Decrement ECX and loop if ECX is not zero

    ; End of the program, the final curtain call
    mov eax, 1 ; The syscall number for sys_exit
    xor ebx, ebx ; The exit status, a clean slate
    int 0x80 ; Make the syscall, exiting the stage

