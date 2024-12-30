; Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
; This program is designed to transform the humble binary digits into their majestic hexadecimal counterparts.
; Prepare yourself for a journey through the intricate pathways of x86 Assembly, where each instruction is a step towards enlightenment.

section .data
    prompt db 'Enter a binary number: ', 0
    input db 32 dup(0)
    hex_digits db '0123456789ABCDEF', 0

section .bss
    bin_input resb 32
    hex_output resb 8

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 21
    int 0x80

    ; Read the user's input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 32
    int 0x80

    ; Convert the binary input to hexadecimal
    mov esi, input
    mov edi, hex_output
    call bin_to_hex

    ; Display the hexadecimal output
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_output
    mov edx, 8
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to convert binary to hexadecimal
bin_to_hex:
    push ebp
    mov ebp, esp
    sub esp, 16

    ; Initialize variables
    mov ecx, 0
    mov ebx, 0

convert_loop:
    ; Load the next binary digit
    mov al, byte [esi + ecx]
    cmp al, 0
    je end_convert

    ; Convert the binary digit to a number
    sub al, '0'
    shl ebx, 1
    or ebx, eax

    ; Increment the counter
    inc ecx
    cmp ecx, 4
    jne convert_loop

    ; Convert the 4-bit binary number to a hexadecimal digit
    mov al, byte [hex_digits + ebx]
    mov byte [edi], al
    inc edi

    ; Reset the counter and the 4-bit binary number
    xor ecx, ecx
    xor ebx, ebx
    jmp convert_loop

end_convert:
    ; Null-terminate the hexadecimal output
    mov byte [edi], 0

    ; Restore the stack and return
    mov esp, ebp
    pop ebp
    ret

