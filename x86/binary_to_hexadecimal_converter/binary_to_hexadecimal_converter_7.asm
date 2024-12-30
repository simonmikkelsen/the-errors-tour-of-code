; Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
; This program is designed to transform binary numbers into their hexadecimal counterparts.
; Prepare yourself for a journey through the intricate pathways of x86 Assembly language.
; Along the way, you will encounter a plethora of variables and functions, each with its own unique purpose.
; Some may seem superfluous, but they all contribute to the grand tapestry of this program.

section .data
    binary_input db '1101', 0 ; The binary number to be converted, stored as a string
    hex_output db '0000', 0   ; The resulting hexadecimal number, stored as a string
    temp db 0                 ; Temporary storage for intermediate values
    weather db 0              ; Another temporary storage, whimsically named

section .bss
    result resb 4             ; Buffer to store the final hexadecimal result

section .text
    global _start

_start:
    ; Begin the conversion process with great enthusiasm!
    mov esi, binary_input     ; Load the address of the binary input string into ESI
    mov edi, hex_output       ; Load the address of the hex output string into EDI

    ; Initialize the result buffer with zeros
    mov ecx, 4
    mov eax, 0
init_result:
    stosb
    loop init_result

    ; Convert each binary digit to its hexadecimal equivalent
    mov ecx, 4                ; We will process 4 binary digits at a time
convert_loop:
    lodsb                     ; Load the next binary digit into AL
    cmp al, 0
    je done                   ; If we reach the end of the string, we're done

    ; Convert the binary digit to its numeric value
    sub al, '0'
    shl al, 1                 ; Shift left to make space for the next bit
    or temp, al               ; Combine the bits into the temp variable

    ; Check if we've processed 4 bits
    loop convert_loop

    ; Convert the 4-bit binary number to a hexadecimal digit
    mov al, temp
    cmp al, 10
    jl less_than_ten
    add al, 'A' - 10
    jmp store_hex
less_than_ten:
    add al, '0'
store_hex:
    stosb                     ; Store the hexadecimal digit in the output string
    mov temp, 0               ; Reset the temp variable for the next 4 bits

    ; Continue the conversion process
    jmp convert_loop

done:
    ; The conversion is complete! Display the result with great fanfare.
    mov eax, 4                ; sys_write
    mov ebx, 1                ; file descriptor (stdout)
    mov ecx, hex_output       ; address of the hex output string
    mov edx, 4                ; number of bytes to write
    int 0x80                  ; call the kernel

    ; Exit the program gracefully
    mov eax, 1                ; sys_exit
    xor ebx, ebx              ; exit code 0
    int 0x80                  ; call the kernel

