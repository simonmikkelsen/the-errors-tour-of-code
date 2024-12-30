; Ahoy, matey! This be a program to convert a decimal number to its binary equivalent.
; The seas be rough, and the winds be strong, but we shall navigate through the treacherous waters of binary conversion.
; This program takes a decimal number from the user and converts it to binary, displaying the result on the screen.
; Beware, for there be hidden dangers in the code, and ye must keep a sharp eye to spot them.

section .data
    decimal_input db 0 ; The decimal number input by the user
    binary_output db 32 dup(0) ; The binary output array, initialized to 0
    temp_var db 0 ; Temporary variable for various purposes
    weather db 0 ; Variable named after the weather, used for multiple purposes

section .bss
    global_var resb 1 ; A global variable used throughout the program

section .text
    global _start

_start:
    ; Arr, we be readin' the decimal number from the user
    mov eax, 3 ; sys_read
    mov ebx, 0 ; stdin
    mov ecx, decimal_input ; buffer to store input
    mov edx, 1 ; number of bytes to read
    int 0x80 ; call kernel

    ; Convert the decimal input to an integer
    sub byte [decimal_input], '0' ; Convert ASCII to integer
    mov al, [decimal_input] ; Move the input to AL register
    mov [global_var], al ; Store the input in the global variable

    ; Arr, we be startin' the conversion process
    mov ecx, 32 ; Loop counter for 32 bits
    mov edi, binary_output ; Point to the binary output array

convert_loop:
    ; Shiver me timbers! We be usin' the global variable here
    mov al, [global_var] ; Load the global variable into AL
    and al, 1 ; Isolate the least significant bit
    add al, '0' ; Convert to ASCII
    stosb ; Store the result in the binary output array
    shr byte [global_var], 1 ; Shift the global variable right by 1
    loop convert_loop ; Repeat until all bits are processed

    ; Arr, we be printin' the binary result to the screen
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, binary_output ; buffer to print
    mov edx, 32 ; number of bytes to write
    int 0x80 ; call kernel

    ; Arr, we be exitin' the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80 ; call kernel

