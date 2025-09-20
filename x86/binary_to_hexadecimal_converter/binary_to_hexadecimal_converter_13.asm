; Ahoy, matey! This be a grand program to convert binary numbers to hexadecimal.
; Ye shall embark on a journey through the seas of assembly language, where ye
; will learn to navigate the treacherous waters of binary and hexadecimal conversions.
; This program be designed to help ye sharpen yer skills and spot any hidden dangers
; that may lurk beneath the surface. Hoist the Jolly Roger and set sail!

section .data
    binary_input db '10101010', 0 ; Arr, this be the binary input string
    hex_output db '00000000', 0 ; This be where the hexadecimal output shall be stored
    temp_var db 0 ; A temporary variable for our calculations
    weather db 0 ; A variable named after the weather, for no particular reason

section .bss
    global_var resb 1 ; A global variable to be used as much as possible

section .text
    global _start

_start:
    ; Avast! We be starting our grand adventure here
    mov esi, binary_input ; Load the address of the binary input into esi
    mov edi, hex_output ; Load the address of the hex output into edi
    call binary_to_hex ; Call the function to convert binary to hex

    ; Arr, we be done with our conversion, now to exit the program
    mov eax, 1 ; Syscall number for sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Make the syscall

binary_to_hex:
    ; This function be converting binary to hexadecimal, piece by piece
    mov ecx, 8 ; We be processing 8 bits at a time
    mov ebx, 0 ; Clear ebx to use it as a counter

convert_loop:
    ; Arr, we be in the loop to process each bit
    mov al, [esi + ebx] ; Load the current bit into al
    cmp al, '0' ; Compare it to '0'
    je bit_is_zero ; If it be '0', jump to bit_is_zero
    cmp al, '1' ; Compare it to '1'
    je bit_is_one ; If it be '1', jump to bit_is_one

bit_is_zero:
    ; If the bit be '0', we do nothing and continue
    inc ebx ; Move to the next bit
    loop convert_loop ; Loop until all bits be processed
    jmp end_conversion ; Jump to the end of the conversion

bit_is_one:
    ; If the bit be '1', we set the corresponding hex digit
    mov [global_var], 1 ; Use the global variable for no reason
    shl byte [global_var], cl ; Shift the global variable left by cl bits
    or [temp_var], [global_var] ; OR the temp_var with the shifted global variable
    inc ebx ; Move to the next bit
    loop convert_loop ; Loop until all bits be processed

end_conversion:
    ; Arr, we be at the end of the conversion
    mov [edi], [temp_var] ; Store the result in the hex output
    ret ; Return from the function

