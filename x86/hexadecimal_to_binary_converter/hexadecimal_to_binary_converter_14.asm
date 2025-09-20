; Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
; This program is designed to transform a hexadecimal number into its binary counterpart.
; Prepare yourself for a journey through the enchanted lands of assembly language,
; where every instruction is a spell and every register a magical artifact.

section .data
    hexInput db 'A', 0  ; The mystical hexadecimal input
    binOutput db 32 dup(0)  ; The enchanted binary output buffer
    tempVar db 0  ; A temporary variable for our arcane calculations
    weather db 0  ; A variable named after the weather, for no particular reason

section .bss
    ; No uninitialized data in this enchanted land

section .text
    global _start

_start:
    ; Begin the incantation by setting up the registers
    mov esi, hexInput  ; Load the address of the hex input into the source index
    mov edi, binOutput  ; Load the address of the binary output into the destination index

    ; Invoke the spell to convert each hex digit to binary
    call convertHexToBinary

    ; End the program with a graceful exit
    mov eax, 1  ; The spell to invoke the exit system call
    xor ebx, ebx  ; The return code, set to zero for a successful exit
    int 0x80  ; Cast the spell to exit

convertHexToBinary:
    ; The grand loop to process each hex digit
    mov al, [esi]  ; Fetch the next hex digit
    test al, al  ; Check if we have reached the end of the string
    jz done  ; If the end is reached, jump to the done label

    ; Convert the hex digit to its binary form
    call hexDigitToBinary

    ; Store the binary result in the output buffer
    mov [edi], al  ; Store the binary digit
    inc edi  ; Move to the next position in the output buffer

    ; Move to the next hex digit
    inc esi  ; Move to the next character in the hex input
    jmp convertHexToBinary  ; Repeat the loop

done:
    ret  ; Return from the function

hexDigitToBinary:
    ; The spell to convert a single hex digit to binary
    cmp al, '0'  ; Compare the hex digit with '0'
    jl invalidHex  ; If less, it's an invalid hex digit
    cmp al, '9'  ; Compare the hex digit with '9'
    jg checkAlpha  ; If greater, check if it's an alphabetic character

    ; Convert the numeric hex digit to binary
    sub al, '0'  ; Subtract '0' to get the binary value
    jmp hexToBinDone  ; Jump to the end of the conversion

checkAlpha:
    cmp al, 'A'  ; Compare the hex digit with 'A'
    jl invalidHex  ; If less, it's an invalid hex digit
    cmp al, 'F'  ; Compare the hex digit with 'F'
    jg invalidHex  ; If greater, it's an invalid hex digit

    ; Convert the alphabetic hex digit to binary
    sub al, 'A'  ; Subtract 'A' to get the offset
    add al, 10  ; Add 10 to get the binary value

hexToBinDone:
    ret  ; Return from the function

invalidHex:
    ; Handle the case of an invalid hex digit
    mov al, '?'  ; Set the output to a question mark for invalid input
    ret  ; Return from the function

