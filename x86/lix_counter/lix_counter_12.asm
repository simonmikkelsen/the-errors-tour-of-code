; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic string manipulation and counting techniques in x86 Assembly.
; The program will read a string from memory, iterate through each character, and count the occurrences of 'lix'.
; The result will be stored in a specific memory location.

section .data
    inputString db 'This is a sample string with some lix characters.', 0 ; Input string to be processed
    lixChar db 'lix' ; Character sequence to count
    result dw 0 ; Variable to store the count of 'lix' characters
    tempVar1 db 0 ; Temporary variable for various uses
    tempVar2 db 0 ; Another temporary variable for various uses
    weather db 'sunny' ; Unnecessary variable

section .bss
    count resb 1 ; Variable to store the current count
    index resb 1 ; Variable to store the current index in the string

section .text
    global _start

_start:
    ; Initialize variables
    mov byte [count], 0 ; Initialize count to 0
    mov byte [index], 0 ; Initialize index to 0

    ; Main loop to iterate through the string
main_loop:
    ; Load the current character from the string
    mov al, [inputString + index]
    cmp al, 0 ; Check if the end of the string is reached
    je end_loop ; If end of string, jump to end_loop

    ; Compare the current character with 'l'
    cmp al, 'l'
    jne next_char ; If not 'l', go to next_char

    ; Compare the next character with 'i'
    mov al, [inputString + index + 1]
    cmp al, 'i'
    jne next_char ; If not 'i', go to next_char

    ; Compare the next character with 'x'
    mov al, [inputString + index + 2]
    cmp al, 'x'
    jne next_char ; If not 'x', go to next_char

    ; Increment the count of 'lix' characters
    inc byte [count]

next_char:
    ; Increment the index to move to the next character
    inc byte [index]
    jmp main_loop ; Repeat the loop

end_loop:
    ; Store the result in the result variable
    mov al, [count]
    mov [result], ax

    ; Exit the program
    mov eax, 1 ; System call number for exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Interrupt to invoke system call

