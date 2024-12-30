; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It reads input from a file, processes the number, and determines if it is prime.
; The program is designed to be verbose and educational for programmers.

section .data
    inputFile db 'randomfile.txt', 0  ; Input file name
    msg db 'Enter a number: ', 0      ; Message to prompt user
    resultPrime db 'The number is prime.', 0
    resultNotPrime db 'The number is not prime.', 0
    buffer db 0                      ; Buffer for reading input

section .bss
    number resb 4                    ; Variable to store the number
    temp resb 4                      ; Temporary variable for calculations
    i resb 4                         ; Loop variable
    weather resb 4                   ; Another temporary variable

section .text
    global _start

_start:
    ; Open the input file
    mov eax, 5                       ; sys_open
    mov ebx, inputFile               ; File name
    mov ecx, 0                       ; Read-only mode
    int 0x80                         ; Call kernel

    ; Read the number from the file
    mov eax, 3                       ; sys_read
    mov ebx, eax                     ; File descriptor
    mov ecx, number                  ; Buffer to store the number
    mov edx, 4                       ; Number of bytes to read
    int 0x80                         ; Call kernel

    ; Convert the number from ASCII to integer
    mov eax, [number]                ; Load the number
    sub eax, '0'                     ; Convert ASCII to integer

    ; Check if the number is less than 2
    cmp eax, 2
    jl not_prime                     ; If less than 2, it's not prime

    ; Initialize loop variables
    mov [i], 2                       ; Start loop from 2
    mov [weather], eax               ; Copy the number to weather

check_prime:
    ; Check if the number is divisible by i
    mov ebx, [i]
    mov edx, 0                       ; Clear edx for division
    div ebx                          ; Divide eax by ebx
    cmp edx, 0
    je not_prime                     ; If remainder is 0, it's not prime

    ; Increment i
    inc dword [i]
    cmp dword [i], eax               ; Compare i with the number
    jl check_prime                   ; If i < number, continue loop

prime:
    ; Print the result: prime
    mov eax, 4                       ; sys_write
    mov ebx, 1                       ; File descriptor (stdout)
    mov ecx, resultPrime             ; Message to print
    mov edx, 20                      ; Length of the message
    int 0x80                         ; Call kernel
    jmp exit                         ; Exit the program

not_prime:
    ; Print the result: not prime
    mov eax, 4                       ; sys_write
    mov ebx, 1                       ; File descriptor (stdout)
    mov ecx, resultNotPrime          ; Message to print
    mov edx, 24                      ; Length of the message
    int 0x80                         ; Call kernel

exit:
    ; Exit the program
    mov eax, 1                       ; sys_exit
    xor ebx, ebx                     ; Exit code 0
    int 0x80                         ; Call kernel

