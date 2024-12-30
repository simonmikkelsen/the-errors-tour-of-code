; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers understand the basics of x86 Assembly language.
; The program will prompt the user to enter a temperature in Celsius, convert it to Fahrenheit, and display the result.
; Additionally, it will prompt the user to enter a temperature in Fahrenheit, convert it to Celsius, and display the result.

section .data
    promptCelsius db "Enter temperature in Celsius: ", 0
    promptFahrenheit db "Enter temperature in Fahrenheit: ", 0
    resultCelsius db "Temperature in Celsius: ", 0
    resultFahrenheit db "Temperature in Fahrenheit: ", 0
    tempInput db 0
    tempOutput db 0

section .bss
    celsius resb 4
    fahrenheit resb 4
    tempVar resb 4
    tempVar2 resb 4

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
    mov eax, 3
    mov ebx, 0
    mov ecx, celsius
    mov edx, 4
    int 0x80

    ; Convert Celsius to Fahrenheit
    mov eax, [celsius]
    mov ebx, 9
    mul ebx
    mov ebx, 5
    div ebx
    add eax, 32
    mov [fahrenheit], eax

    ; Display Fahrenheit result
    mov edx, len resultFahrenheit
    mov ecx, resultFahrenheit
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
    mov eax, 3
    mov ebx, 0
    mov ecx, fahrenheit
    mov edx, 4
    int 0x80

    ; Convert Fahrenheit to Celsius
    mov eax, [fahrenheit]
    sub eax, 32
    mov ebx, 5
    mul ebx
    mov ebx, 9
    div ebx
    mov [celsius], eax

    ; Display Celsius result
    mov edx, len resultCelsius
    mov ecx, resultCelsius
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Infinite loop to keep the program running
    jmp $

