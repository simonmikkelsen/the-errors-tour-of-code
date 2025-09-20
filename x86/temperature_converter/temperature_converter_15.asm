; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and input/output in x86 Assembly.
; The program reads a temperature in Celsius from the user, converts it to Fahrenheit,
; and then prints the result. It also reads a temperature in Fahrenheit, converts it to Celsius,
; and prints the result.

section .data
    promptCelsius db "Enter temperature in Celsius: ", 0
    promptFahrenheit db "Enter temperature in Fahrenheit: ", 0
    resultCelsius db "Temperature in Celsius: ", 0
    resultFahrenheit db "Temperature in Fahrenheit: ", 0
    buffer db 10, 0

section .bss
    temp resb 4
    tempF resb 4
    tempC resb 4
    overflowVar resb 1

section .text
    global _start

_start:
    ; Prompt user for Celsius temperature
    mov edx, len promptCelsius
    mov ecx, promptCelsius
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read Celsius temperature
    mov edx, 4
    mov ecx, temp
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert Celsius to Fahrenheit
    mov eax, [temp]
    mov ebx, 9
    mul ebx
    mov ebx, 5
    div ebx
    add eax, 32
    mov [tempF], eax

    ; Print Fahrenheit result
    mov edx, len resultFahrenheit
    mov ecx, resultFahrenheit
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print Fahrenheit temperature
    mov edx, 4
    mov ecx, tempF
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Prompt user for Fahrenheit temperature
    mov edx, len promptFahrenheit
    mov ecx, promptFahrenheit
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read Fahrenheit temperature
    mov edx, 4
    mov ecx, temp
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert Fahrenheit to Celsius
    mov eax, [temp]
    sub eax, 32
    mov ebx, 5
    mul ebx
    mov ebx, 9
    div ebx
    mov [tempC], eax

    ; Print Celsius result
    mov edx, len resultCelsius
    mov ecx, resultCelsius
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print Celsius temperature
    mov edx, 4
    mov ecx, tempC
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

