; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers understand x86 Assembly language.
; The program takes user input for the temperature value and the conversion type.
; It then performs the conversion and displays the result.
; The program includes detailed comments to explain each step.

section .data
    promptCelsius db "Enter temperature in Celsius: ", 0
    promptFahrenheit db "Enter temperature in Fahrenheit: ", 0
    resultCelsius db "Temperature in Celsius: ", 0
    resultFahrenheit db "Temperature in Fahrenheit: ", 0
    tempInput db 0
    tempOutput db 0
    newline db 10, 0

section .bss
    temp resb 4
    tempC resb 4
    tempF resb 4

section .text
    global _start

_start:
    ; Prompt user for input
    mov edx, len promptCelsius
    mov ecx, promptCelsius
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read user input
    mov edx, 4
    mov ecx, temp
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert input to integer
    mov eax, [temp]
    sub eax, '0'
    mov [tempInput], eax

    ; Perform Celsius to Fahrenheit conversion
    ; Formula: F = (C * 9/5) + 32
    mov eax, [tempInput]
    mov ebx, 9
    mul ebx
    mov ebx, 5
    div ebx
    add eax, 32
    mov [tempOutput], eax

    ; Display result in Fahrenheit
    mov edx, len resultFahrenheit
    mov ecx, resultFahrenheit
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display converted temperature
    mov eax, [tempOutput]
    add eax, '0'
    mov [tempF], eax
    mov edx, 4
    mov ecx, tempF
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit program
    mov eax, 1
    int 0x80

