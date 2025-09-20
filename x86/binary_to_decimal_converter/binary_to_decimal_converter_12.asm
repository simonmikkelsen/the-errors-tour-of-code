; Lo, this program doth convert binary numbers to decimal,
; A task most noble for the aspiring programmer.
; It taketh a binary number from the user,
; And returneth its decimal equivalent with grace.

section .data
    prompt db "Enter a binary number: ", 0
    len_prompt equ $ - prompt
    result_msg db "The decimal value is: ", 0
    len_result_msg equ $ - result_msg
    newline db 10, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    temp_var resd 1
    temp_var2 resd 1
    temp_var3 resd 1

section .text
    global _start

_start:
    ; Hark! We call upon the kernel to display our prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len_prompt
    int 0x80

    ; Now we summon the user's input
    mov eax, 3
    mov ebx, 0
    mov ecx, binary_input
    mov edx, 32
    int 0x80

    ; Let us initialize our variables
    mov dword [decimal_output], 0
    mov dword [temp_var], 0
    mov dword [temp_var2], 1

    ; Lo, we begin the conversion process
convert_loop:
    ; Fetch the current character
    mov al, [binary_input + temp_var]
    cmp al, 10
    je end_conversion

    ; If the character be '1', we add the current power of 2
    cmp al, '1'
    jne skip_addition
    add [decimal_output], temp_var2

skip_addition:
    ; Multiply the power of 2 by 2 for the next bit
    shl dword [temp_var2], 1

    ; Advance to the next character
    inc dword [temp_var]
    jmp convert_loop

end_conversion:
    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, len_result_msg
    int 0x80

    ; Display the decimal result
    mov eax, [decimal_output]
    call print_decimal

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; A function to print the decimal number
print_decimal:
    ; Verily, we shall use recursion to print each digit
    mov ecx, 10
    xor edx, edx
    div ecx
    test eax, eax
    jz print_digit
    push edx
    call print_decimal
    pop edx

print_digit:
    add dl, '0'
    mov eax, 4
    mov ebx, 1
    mov ecx, edx
    mov edx, 1
    int 0x80
    ret

