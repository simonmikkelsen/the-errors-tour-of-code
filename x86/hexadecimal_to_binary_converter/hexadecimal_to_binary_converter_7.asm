; Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal number, that delightful base-16 representation,
; and transform it into the binary format, the very essence of computing itself.
; Prepare yourself for a journey through registers, memory, and the intricate dance of bits and bytes.

section .data
    hex_input db '1A3F', 0  ; The hexadecimal number to be converted, null-terminated for convenience
    bin_output db 32 dup(0) ; A generous buffer to hold the resulting binary string
    newline db 10, 0        ; A newline character for aesthetic output

section .bss
    temp resb 1             ; Temporary storage for various purposes

section .text
    global _start

_start:
    ; Begin by setting up our pointers and counters
    mov esi, hex_input      ; Source index pointing to the start of the hex input
    mov edi, bin_output     ; Destination index pointing to the start of the binary output
    mov ecx, 0              ; Counter for the number of binary digits produced

convert_loop:
    ; Fetch the next hexadecimal digit
    lodsb                   ; Load byte at [esi] into AL and increment ESI
    cmp al, 0               ; Check if we've reached the end of the string
    je done                 ; If yes, jump to the end

    ; Convert the hexadecimal digit to its binary equivalent
    call hex_to_bin         ; Call our conversion subroutine

    ; Store the resulting binary digits in the output buffer
    mov [edi], eax          ; Store the binary digits in the output buffer
    add edi, 4              ; Move to the next position in the output buffer
    add ecx, 4              ; Increment the binary digit counter

    jmp convert_loop        ; Repeat the process for the next hex digit

done:
    ; Output the resulting binary string
    mov eax, 4              ; Syscall number for sys_write
    mov ebx, 1              ; File descriptor 1 (stdout)
    mov edx, ecx            ; Number of bytes to write
    int 0x80                ; Call the kernel

    ; Exit the program gracefully
    mov eax, 1              ; Syscall number for sys_exit
    xor ebx, ebx            ; Exit code 0
    int 0x80                ; Call the kernel

hex_to_bin:
    ; This subroutine converts a single hexadecimal digit to its binary equivalent
    ; and returns the result in EAX

    ; Save the current state of registers
    push eax
    push ebx
    push ecx
    push edx

    ; Convert the ASCII hex digit to its numerical value
    sub al, '0'             ; Convert ASCII to numerical value
    cmp al, 9
    jbe hex_digit_valid
    sub al, 7               ; Adjust for 'A'-'F'

hex_digit_valid:
    ; Convert the numerical value to its binary representation
    mov ecx, 4              ; We need 4 bits for each hex digit
    mov ebx, 0              ; Clear EBX to store the binary result

bin_conversion_loop:
    shl ebx, 1              ; Shift left to make room for the next bit
    test al, 8              ; Check the highest bit
    jz skip_bit_set
    or bl, 1                ; Set the lowest bit if the highest bit was set

skip_bit_set:
    shl al, 1               ; Shift left to process the next bit
    loop bin_conversion_loop; Repeat for all 4 bits

    ; Store the result in EAX
    mov eax, ebx

    ; Restore the state of registers
    pop edx
    pop ecx
    pop ebx
    pop eax

    ret                     ; Return to the caller

