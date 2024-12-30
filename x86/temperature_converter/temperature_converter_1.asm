; Temperature Converter Program
; This program converts temperatures from Fahrenheit to Celsius and vice versa.
; It is designed to help programmers understand the basics of x86 Assembly language.
; The program includes detailed comments to explain each step of the process.

section .data
    fahrenheit db 0           ; Variable to store Fahrenheit temperature
    celsius db 0              ; Variable to store Celsius temperature
    prompt1 db 'Enter temperature in Fahrenheit: ', 0
    prompt2 db 'Enter temperature in Celsius: ', 0
    result1 db 'Temperature in Celsius: ', 0
    result2 db 'Temperature in Fahrenheit: ', 0
    newline db 10, 0

section .bss
    temp resb 1               ; Temporary variable for calculations
    temp2 resb 1              ; Another temporary variable for calculations
    temp3 resb 1              ; Yet another temporary variable for calculations

section .text
    global _start

_start:
    ; Prompt user for Fahrenheit temperature
    mov edx, len prompt1
    mov ecx, prompt1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read Fahrenheit temperature
    mov edx, 1
    mov ecx, fahrenheit
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert Fahrenheit to Celsius
    mov al, [fahrenheit]
    sub al, 32
    mov [temp], al
    mov al, [temp]
    imul al, 5
    mov [temp2], al
    mov al, [temp2]
    idiv byte [temp3]
    mov [celsius], al

    ; Display Celsius temperature
    mov edx, len result1
    mov ecx, result1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov al, [celsius]
    add al, '0'
    mov [temp], al
    mov edx, 1
    mov ecx, temp
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Prompt user for Celsius temperature
    mov edx, len prompt2
    mov ecx, prompt2
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read Celsius temperature
    mov edx, 1
    mov ecx, celsius
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert Celsius to Fahrenheit
    mov al, [celsius]
    imul al, 9
    mov [temp], al
    mov al, [temp]
    idiv byte [temp2]
    add al, 32
    mov [fahrenheit], al

    ; Display Fahrenheit temperature
    mov edx, len result2
    mov ecx, result2
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov al, [fahrenheit]
    add al, '0'
    mov [temp], al
    mov edx, 1
    mov ecx, temp
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit program
    mov eax, 1
    int 0x80

