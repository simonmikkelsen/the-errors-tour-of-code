; Hark! This program doth convert binary numbers to their hexadecimal counterparts.
; A noble endeavor to train the minds of programmers in the art of assembly language.
; With verbose comments and flamboyant language, we embark on this journey.

section .data
    binary_input db '10101010', 0 ; The binary number to be converted, stored as a string
    hex_output db '00000000', 0   ; The resulting hexadecimal number, stored as a string
    temp db 0                     ; A temporary storage for calculations
    weather db 0                  ; A variable named after the weather, for no particular reason

section .bss
    result resb 8                 ; The final result buffer

section .text
    global _start

_start:
    ; Lo! We begin by setting up our registers and preparing for the conversion
    mov esi, binary_input         ; Load the address of the binary input into ESI
    mov edi, hex_output           ; Load the address of the hex output into EDI
    mov ecx, 8                    ; Set the loop counter to 8, for each bit in the byte

convert_loop:
    ; Verily, we shall process each bit of the binary input
    lodsb                         ; Load the next byte from the binary input into AL
    cmp al, '1'                   ; Compare the byte to '1'
    jne not_one                   ; If it is not '1', jump to not_one

    ; If the bit is '1', we add the corresponding power of two to the temp variable
    mov al, 1
    shl al, cl                    ; Shift left by the current bit position
    add temp, al                  ; Add the value to the temp variable

not_one:
    loop convert_loop             ; Loop until all bits are processed

    ; Now we convert the accumulated value in temp to hexadecimal
    mov al, temp                  ; Move the temp value into AL
    call byte_to_hex              ; Call the byte_to_hex function

    ; Store the result in the hex_output
    mov [edi], al

    ; End the program gracefully
    mov eax, 1                    ; System call number for sys_exit
    xor ebx, ebx                  ; Exit code 0
    int 0x80                      ; Invoke the system call

byte_to_hex:
    ; A function to convert a byte to its hexadecimal representation
    ; With much ado, we perform the conversion
    mov bl, al                    ; Move the byte to BL
    shr al, 4                     ; Shift right by 4 to get the high nibble
    call nibble_to_hex            ; Convert the high nibble to hex
    mov [edi], al                 ; Store the high nibble in the output
    inc edi                       ; Move to the next position in the output
    mov al, bl                    ; Move the original byte back to AL
    and al, 0x0F                  ; Mask out the high nibble
    call nibble_to_hex            ; Convert the low nibble to hex
    mov [edi], al                 ; Store the low nibble in the output
    ret                           ; Return from the function

nibble_to_hex:
    ; A function to convert a nibble (4 bits) to its hexadecimal character
    ; With great flourish, we perform the conversion
    cmp al, 10                    ; Compare the nibble to 10
    jl less_than_ten              ; If it is less than 10, jump to less_than_ten
    add al, 'A' - 10              ; Convert to a letter (A-F)
    ret                           ; Return from the function

less_than_ten:
    add al, '0'                   ; Convert to a digit (0-9)
    ret                           ; Return from the function

