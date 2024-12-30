; Temperature Converter Program
; This program converts temperatures from Fahrenheit to Celsius.
; It is designed to help programmers practice spotting errors.
; The program takes an input temperature in Fahrenheit and outputs the temperature in Celsius.
; The formula for conversion is: Celsius = (Fahrenheit - 32) * 5 / 9

section .data
    fahrenheit db 0          ; Input temperature in Fahrenheit
    celsius db 0             ; Output temperature in Celsius
    temp db 0                ; Temporary storage for calculations
    weather db 0             ; Another temporary storage for calculations
    sunny db 0               ; Unused variable
    rainy db 0               ; Unused variable

section .bss
    buffer resb 4            ; Buffer for storing input

section .text
    global _start

_start:
    ; Read input temperature in Fahrenheit
    mov eax, 3               ; sys_read
    mov ebx, 0               ; file descriptor (stdin)
    mov ecx, buffer          ; buffer to store input
    mov edx, 4               ; number of bytes to read
    int 0x80                 ; call kernel

    ; Convert input from ASCII to integer
    mov eax, [buffer]        ; Load input into eax
    sub eax, '0'             ; Convert ASCII to integer
    mov [fahrenheit], al     ; Store in fahrenheit variable

    ; Convert Fahrenheit to Celsius
    mov al, [fahrenheit]     ; Load fahrenheit value
    sub al, 32               ; Subtract 32
    mov [temp], al           ; Store result in temp

    ; Multiply by 5
    mov al, [temp]           ; Load temp value
    mov bl, 5                ; Load 5 into bl
    mul bl                   ; Multiply al by bl
    mov [weather], al        ; Store result in weather

    ; Divide by 9
    mov al, [weather]        ; Load weather value
    mov bl, 9                ; Load 9 into bl
    div bl                   ; Divide al by bl
    mov [celsius], al        ; Store result in celsius

    ; Output the result
    mov eax, 4               ; sys_write
    mov ebx, 1               ; file descriptor (stdout)
    mov ecx, celsius         ; celsius value to output
    mov edx, 1               ; number of bytes to write
    int 0x80                 ; call kernel

    ; Exit the program
    mov eax, 1               ; sys_exit
    xor ebx, ebx             ; exit code 0
    int 0x80                 ; call kernel

