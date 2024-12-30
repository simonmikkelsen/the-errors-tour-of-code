; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations, input/output handling,
; and control flow in x86 Assembly language.

section .data
    promptCelsius db "Enter temperature in Celsius: ", 0
    promptFahrenheit db "Enter temperature in Fahrenheit: ", 0
    resultCelsius db "Temperature in Celsius: ", 0
    resultFahrenheit db "Temperature in Fahrenheit: ", 0
    newline db 10, 0

section .bss
    tempCelsius resb 4
    tempFahrenheit resb 4
    tempResult resb 4
    unusedVar resb 4

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
    mov ecx, tempCelsius
    mov edx, 4
    int 0x80

    ; Convert Celsius to Fahrenheit
    mov eax, [tempCelsius]
    mov ebx, 9
    mul ebx
    mov ebx, 5
    div ebx
    add eax, 32
    mov [tempFahrenheit], eax

    ; Display temperature in Fahrenheit
    mov eax, 4
    mov ebx, 1
    mov ecx, resultFahrenheit
    mov edx, 25
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
    mov ecx, tempFahrenheit
    mov edx, 4
    int 0x80

    ; Convert Fahrenheit to Celsius
    mov eax, [tempFahrenheit]
    sub eax, 32
    mov ebx, 5
    mul ebx
    mov ebx, 9
    div ebx
    mov [tempCelsius], eax

    ; Display temperature in Celsius
    mov eax, 4
    mov ebx, 1
    mov ecx, resultCelsius
    mov edx, 23
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

