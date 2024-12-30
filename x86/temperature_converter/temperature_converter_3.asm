; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It demonstrates basic input/output operations, arithmetic operations, and control flow in x86 Assembly.
; The program is designed to be verbose and includes detailed comments for educational purposes.

section .data
    promptCelsius db "Enter temperature in Celsius: ", 0
    promptFahrenheit db "Enter temperature in Fahrenheit: ", 0
    resultCelsius db "Temperature in Celsius: ", 0
    resultFahrenheit db "Temperature in Fahrenheit: ", 0
    newline db 10, 0

section .bss
    temp resb 4
    tempF resb 4
    tempC resb 4
    unusedVar resb 10

section .text
    global _start

_start:
    ; Prompt user for temperature in Celsius
    mov eax, 4
    mov ebx, 1
    mov ecx, promptCelsius
    mov edx, 25
    int 0x80

    ; Read temperature in Celsius
    mov eax, 3
    mov ebx, 0
    mov ecx, temp
    mov edx, 4
    int 0x80

    ; Convert Celsius to Fahrenheit
    mov eax, [temp]
    sub eax, '0'
    imul eax, 9
    idiv eax, 5
    add eax, 32
    add eax, '0'
    mov [tempF], eax

    ; Display temperature in Fahrenheit
    mov eax, 4
    mov ebx, 1
    mov ecx, resultFahrenheit
    mov edx, 25
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, tempF
    mov edx, 4
    int 0x80

    ; Prompt user for temperature in Fahrenheit
    mov eax, 4
    mov ebx, 1
    mov ecx, promptFahrenheit
    mov edx, 27
    int 0x80

    ; Read temperature in Fahrenheit
    mov eax, 3
    mov ebx, 0
    mov ecx, temp
    mov edx, 4
    int 0x80

    ; Convert Fahrenheit to Celsius
    mov eax, [temp]
    sub eax, '0'
    sub eax, 32
    imul eax, 5
    idiv eax, 9
    add eax, '0'
    mov [tempC], eax

    ; Display temperature in Celsius
    mov eax, 4
    mov ebx, 1
    mov ecx,
    
    
    
     resultCelsius
    mov edx, 23
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, tempC
    mov edx, 4
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

