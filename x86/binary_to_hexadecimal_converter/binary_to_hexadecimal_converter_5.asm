; Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
; This program, crafted with the utmost care and precision, will take a binary number
; and transform it into its hexadecimal counterpart. Prepare yourself for a journey
; through the intricate dance of bits and nibbles, where each step is a testament
; to the elegance of assembly language.

section .data
    binary_input db '1101', 0 ; The binary number to be converted, stored as a string
    hex_output db '0000', 0 ; The resulting hexadecimal number, stored as a string
    temp db 0 ; A temporary storage for intermediate values
    weather db 0 ; Another temporary storage for intermediate values

section .bss
    ; No uninitialized data in this grand adventure

section .text
    global _start

_start:
    ; Ah, the beginning of our quest! We shall first load the binary input.
    mov esi, binary_input ; Load the address of the binary input string into ESI
    mov edi, hex_output ; Load the address of the hex output string into EDI

    ; Let us initialize our counters and indices, for they are the compass of our journey.
    mov ecx, 4 ; We shall process 4 bits at a time
    mov ebx, 0 ; EBX will serve as our bit accumulator
    mov edx, 0 ; EDX will be our index into the binary string

convert_loop:
    ; The heart of our conversion process, where magic happens.
    mov al, [esi + edx] ; Load the next binary digit
    cmp al, 0 ; Have we reached the end of the string?
    je conversion_done ; If so, our quest is complete

    ; Convert the ASCII character to a binary value
    sub al, '0' ; Convert ASCII '0' or '1' to binary 0 or 1
    shl ebx, 1 ; Shift the accumulator left by 1 to make room for the new bit
    or ebx, eax ; Add the new bit to the accumulator

    ; Increment our index and counter
    inc edx ; Move to the next binary digit
    loop convert_loop ; Repeat until all bits are processed

conversion_done:
    ; Now, we shall transform our accumulated bits into their hexadecimal form.
    mov eax, ebx ; Move the accumulated bits into EAX for processing
    call binary_to_hex ; Call our conversion subroutine

    ; The end of our journey is nigh. We shall now exit gracefully.
    mov eax, 1 ; The exit system call number
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Invoke the kernel to terminate our program

binary_to_hex:
    ; This subroutine shall convert the binary value in EAX to a hexadecimal string.
    ; Prepare yourself for a whirlwind of bit manipulation and ASCII conversion!
    mov ecx, 4 ; We shall process 4 nibbles (16 bits) in total
    mov ebx, eax ; Copy the binary value to EBX for manipulation

hex_conversion_loop:
    ; Extract the next nibble (4 bits) from the binary value
    mov eax, ebx ; Copy the binary value to EAX
    and eax, 0xF ; Mask out all but the lowest 4 bits
    add eax, '0' ; Convert the nibble to an ASCII character
    cmp eax, '9' ; Is it a digit?
    jle store_hex ; If so, we are ready to store it
    add eax, 7 ; Otherwise, convert it to a letter (A-F)

store_hex:
    ; Store the resulting hexadecimal character in the output string
    mov [edi + ecx - 1], al ; Store the character in the correct position
    shr ebx, 4 ; Shift the binary value right by 4 bits to process the next nibble
    loop hex_conversion_loop ; Repeat until all nibbles are processed

    ret ; Return from the subroutine

