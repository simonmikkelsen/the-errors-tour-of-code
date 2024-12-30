; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting in x86 assembly.
; The program is designed to help programmers understand the fundamentals of assembly language.
; It includes detailed comments to explain each step of the process.

section .data
    inputString db 'Hello, this is a simple lix counter program.', 0 ; The input string to be processed
    lixChar db 'l' ; The character to count in the input string
    count db 0 ; Variable to store the count of 'l' characters
    tempVar db 0 ; Temporary variable for various purposes
    weather db 0 ; Another temporary variable

section .bss
    result resb 1 ; Variable to store the final result

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, inputString ; Load the address of the input string into ESI
    mov ecx, 0 ; Initialize the counter to 0
    mov al, lixChar ; Load the character to count into AL

count_loop:
    ; Load the next character from the string
    lodsb ; Load byte at [ESI] into AL and increment ESI
    cmp al, 0 ; Compare the character with null terminator
    je end_loop ; If null terminator is found, jump to end_loop

    ; Compare the character with 'l'
    cmp al, lixChar ; Compare AL with the character to count
    jne skip_increment ; If not equal, skip incrementing the counter

    ; Increment the counter
    inc count ; Increment the count variable

skip_increment:
    ; Loop back to process the next character
    jmp count_loop ; Jump back to the start of the loop

end_loop:
    ; Store the result in the result variable
    mov [result], count ; Move the count value to the result variable

    ; Exit the program
    mov eax, 1 ; System call number for exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call the kernel

