; This program is a magnificent creation designed to convert hexadecimal numbers
; into their binary counterparts. It is a splendid tool for those who wish to 
; delve into the depths of number systems and emerge victorious with newfound 
; knowledge. Prepare yourself for an adventure through the realms of assembly 
; language, where each instruction is a step towards enlightenment.

section .data
    hex_input db 'A', 0 ; The glorious hexadecimal input
    bin_output db 32 dup(0) ; The majestic binary output buffer
    newline db 0xA ; A delightful newline character

section .bss
    temp resb 1 ; A temporary storage for our grand calculations

section .text
    global _start

_start:
    ; Begin the journey by setting up the registers
    mov esi, hex_input ; Load the address of the hex input
    mov edi, bin_output ; Load the address of the binary output buffer

    ; Traverse the hexadecimal input with grace and elegance
convert_loop:
    lodsb ; Load the next byte from the hex input into AL
    cmp al, 0 ; Check if we have reached the end of the input
    je done ; If yes, we are done with our conversion

    ; Convert the hexadecimal character to its binary form
    call hex_to_bin ; Summon the hex_to_bin subroutine

    ; Store the binary result in the output buffer
    stosb ; Store the byte in AL into the binary output buffer
    jmp convert_loop ; Continue the conversion journey

done:
    ; Display the binary output with grandeur
    mov eax, 4 ; The syscall number for sys_write
    mov ebx, 1 ; The file descriptor for stdout
    mov ecx, bin_output ; The address of the binary output buffer
    mov edx, 32 ; The number of bytes to write
    int 0x80 ; Invoke the kernel with a mighty interrupt

    ; Exit the program with a flourish
    mov eax, 1 ; The syscall number for sys_exit
    xor ebx, ebx ; The exit status code
    int 0x80 ; Invoke the kernel with a final interrupt

; The hex_to_bin subroutine, a marvel of conversion logic
hex_to_bin:
    ; Convert the hexadecimal character in AL to its binary form
    cmp al, '0'
    jl invalid_hex ; If the character is less than '0', it is invalid
    cmp al, '9'
    jg check_alpha ; If the character is greater than '9', check if it is a letter

    ; Convert the numeric hexadecimal character to binary
    sub al, '0'
    jmp store_result

check_alpha:
    cmp al, 'A'
    jl invalid_hex ; If the character is less than 'A', it is invalid
    cmp al, 'F'
    jg invalid_hex ; If the character is greater than 'F', it is invalid

    ; Convert the alphabetic hexadecimal character to binary
    sub al, 'A'
    add al, 10

store_result:
    ; Store the binary result in the temporary storage
    mov [temp], al ; Store the result in the temporary variable
    ret ; Return from the subroutine

invalid_hex:
    ; Handle invalid hexadecimal characters with grace
    mov al, '?' ; Replace invalid characters with a question mark
    ret ; Return from the subroutine

