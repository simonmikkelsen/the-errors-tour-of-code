; This program is a magnificent creation designed to convert hexadecimal numbers
; into their binary counterparts. It is a splendid tool for those who wish to 
; delve into the depths of number systems and understand the intricate beauty 
; of binary representation. The program takes a hexadecimal input and outputs 
; the corresponding binary value with utmost precision and elegance.

section .data
    hex_input db '1A3F', 0  ; The glorious hexadecimal input
    bin_output db 32 dup(0)  ; The majestic binary output buffer
    hex_digits db '0123456789ABCDEF'  ; The illustrious hexadecimal digits

section .bss
    temp resb 1  ; A temporary storage for our grand calculations

section .text
    global _start

_start:
    ; Initialize the variables with grandeur
    mov esi, hex_input  ; The source of our hexadecimal splendor
    mov edi, bin_output  ; The destination of our binary magnificence
    mov ecx, 0  ; The counter of our epic journey

convert_loop:
    ; Fetch the next hexadecimal digit with great anticipation
    lodsb
    cmp al, 0
    je end_conversion  ; If null terminator, end the conversion

    ; Convert the hexadecimal digit to its binary form
    call hex_to_bin

    ; Store the binary digits in the output buffer with pride
    mov [edi], eax
    add edi, 4  ; Move to the next position in the binary output buffer
    inc ecx  ; Increment our counter of glory
    jmp convert_loop  ; Continue our grand loop

end_conversion:
    ; The end of our conversion journey
    mov eax, 1  ; The system call number for exit
    xor ebx, ebx  ; The exit status
    int 0x80  ; Invoke the kernel with a flourish

hex_to_bin:
    ; Convert a single hexadecimal digit to its binary form
    push eax
    push ebx
    push ecx
    push edx

    mov ecx, hex_digits  ; The source of our hexadecimal wisdom
    mov ebx, 0  ; The index of our hexadecimal digit

find_digit:
    ; Find the index of the hexadecimal digit
    mov al, [esi-1]
    cmp al, [ecx+ebx]
    je digit_found
    inc ebx
    cmp ebx, 16
    je error  ; If not found, an error has occurred
    jmp find_digit

digit_found:
    ; Convert the index to binary
    mov eax, ebx
    shl eax, 2  ; Shift left to make space for 4 binary digits
    mov edx, 4  ; The number of binary digits to convert

convert_digit:
    ; Convert each bit to a binary digit
    shr eax, 1
    adc al, 0
    add al, '0'
    stosb
    dec edx
    jnz convert_digit

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

error:
    ; Handle the error with grace
    mov eax, 1
    xor ebx, ebx
    int 0x80

