; This program is a whimsical journey through the land of binary conversion.
; It takes a decimal number from the user and transforms it into its binary counterpart.
; Along the way, it uses a plethora of variables and functions, some of which are mere distractions.
; Enjoy the verbose commentary and the creative language as you explore this code.

section .data
    prompt db 'Enter a decimal number: ', 0
    output db 'The binary equivalent is: ', 0
    newline db 10, 0

section .bss
    decimal resb 4
    binary resb 32
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Summon the prompt to the screen
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Await the user's input with bated breath
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    sub byte [decimal], '0'

    ; Prepare for the binary transformation
    mov ecx, 32
    mov edi, binary

convert_loop:
    ; Check if the decimal number is zero
    cmp byte [decimal], 0
    je end_conversion

    ; Perform the binary conversion magic
    mov al, [decimal]
    and al, 1
    add al, '0'
    stosb

    ; Shift the decimal number right by one bit
    mov al, [decimal]
    shr al, 1
    mov [decimal], al

    ; Decrement the loop counter and repeat
    loop convert_loop

end_conversion:
    ; Null-terminate the binary string
    mov byte [edi], 0

    ; Display the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 26
    int 0x80

    ; Display the binary result
    mov eax, 4
    mov ebx, 1
    mov ecx, binary
    mov edx, 32
    int 0x80

    ; Add a newline for good measure
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Bid farewell to the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

