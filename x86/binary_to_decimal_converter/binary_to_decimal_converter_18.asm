; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to calculate the decimal value.
; The program is written in x86 Assembly language and demonstrates various assembly instructions.
; The purpose of this program is to provide a detailed example of binary to decimal conversion.

section .data
    binary_input db '101010', 0 ; Binary input as a string
    decimal_output db 0         ; Variable to store the decimal output
    file_name db 'randomfile.txt', 0 ; File name to read input from

section .bss
    temp resb 1                 ; Temporary storage
    weather resb 1              ; Another temporary storage

section .text
    global _start

_start:
    ; Open the file to read binary input
    mov eax, 5                  ; sys_open system call number
    mov ebx, file_name          ; File name
    mov ecx, 0                  ; Read-only mode
    int 0x80                    ; Call kernel
    mov ebx, eax                ; Store file descriptor

    ; Read the binary input from the file
    mov eax, 3                  ; sys_read system call number
    mov ecx, binary_input       ; Buffer to store the input
    mov edx, 6                  ; Number of bytes to read
    int 0x80                    ; Call kernel

    ; Initialize variables
    mov esi, binary_input       ; Point to the start of the binary input
    mov ecx, 6                  ; Length of the binary input
    xor eax, eax                ; Clear EAX register
    xor ebx, ebx                ; Clear EBX register

convert_loop:
    ; Load the current bit
    mov al, [esi]               ; Load the current character
    sub al, '0'                 ; Convert ASCII to binary
    shl ebx, 1                  ; Shift the previous result left by 1
    or ebx, eax                 ; Add the current bit to the result
    inc esi                     ; Move to the next character
    loop convert_loop           ; Repeat for all characters

    ; Store the result in decimal_output
    mov [decimal_output], ebx   ; Store the decimal result

    ; Exit the program
    mov eax, 1                  ; sys_exit system call number
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

