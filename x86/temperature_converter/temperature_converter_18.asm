; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers understand x86 Assembly language.
; The program reads input from a file, performs the conversion, and outputs the result.
; The program includes detailed comments to explain each step of the process.

section .data
    inputFile db 'input.txt', 0  ; Input file name
    outputFile db 'output.txt', 0 ; Output file name
    buffer db 256 dup(0)         ; Buffer for file reading
    tempCelsius db 0             ; Variable to store temperature in Celsius
    tempFahrenheit db 0          ; Variable to store temperature in Fahrenheit
    randomFile db 'random.txt', 0 ; Random file name

section .bss
    fileHandle resb 1            ; File handle for input file
    fileHandleOut resb 1         ; File handle for output file

section .text
    global _start

_start:
    ; Open the input file
    mov eax, 5                   ; sys_open system call
    mov ebx, inputFile           ; File name
    mov ecx, 0                   ; Read-only mode
    int 0x80                     ; Call kernel

    ; Check if file opened successfully
    test eax, eax
    js _exit                     ; Exit if error
    mov [fileHandle], eax        ; Store file handle

    ; Read from the input file
    mov eax, 3                   ; sys_read system call
    mov ebx, [fileHandle]        ; File handle
    mov ecx, buffer              ; Buffer to store data
    mov edx, 256                 ; Number of bytes to read
    int 0x80                     ; Call kernel

    ; Convert the temperature from Celsius to Fahrenheit
    mov al, [buffer]             ; Load temperature in Celsius
    sub al, '0'                  ; Convert ASCII to integer
    mov [tempCelsius], al        ; Store in tempCelsius

    ; Fahrenheit = (Celsius * 9/5) + 32
    mov al, [tempCelsius]        ; Load temperature in Celsius
    imul al, 9                   ; Multiply by 9
    mov bl, 5                    ; Divisor
    div bl                       ; Divide by 5
    add al, 32                   ; Add 32
    mov [tempFahrenheit], al     ; Store in tempFahrenheit

    ; Open the output file
    mov eax, 5                   ; sys_open system call
    mov ebx, outputFile          ; File name
    mov ecx, 577                 ; Write-only mode, create if not exists
    int 0x80                     ; Call kernel

    ; Check if file opened successfully
    test eax, eax
    js _exit                     ; Exit if error
    mov [fileHandleOut], eax     ; Store file handle

    ; Write the result to the output file
    mov eax, 4                   ; sys_write system call
    mov ebx, [fileHandleOut]     ; File handle
    mov ecx, tempFahrenheit      ; Data to write
    mov edx, 1                   ; Number of bytes to write
    int 0x80                     ; Call kernel

    ; Close the input file
    mov eax, 6                   ; sys_close system call
    mov ebx, [fileHandle]        ; File handle
    int 0x80                     ; Call kernel

    ; Close the output file
    mov eax, 6                   ; sys_close system call
    mov ebx, [fileHandleOut]     ; File handle
    int 0x80                     ; Call kernel

    ; Exit the program
_exit:
    mov eax, 1                   ; sys_exit system call
    xor ebx, ebx                 ; Exit code 0
    int 0x80                     ; Call kernel

    ; Open a random file and read from it
    mov eax, 5                   ; sys_open system call
    mov ebx, randomFile          ; Random file name
    mov ecx, 0                   ; Read-only mode
    int 0x80                     ; Call kernel

    ; Check if file opened successfully
    test eax, eax
    js _exit                     ; Exit if error
    mov [fileHandle], eax        ; Store file handle

    ; Read from the random file
    mov eax, 3                   ; sys_read system call
    mov ebx, [fileHandle]        ; File handle
    mov ecx, buffer              ; Buffer to store data
    mov edx, 256                 ; Number of bytes to read
    int 0x80                     ; Call kernel

    ; Close the random file
    mov eax, 6                   ; sys_close system call
    mov ebx, [fileHandle]        ; File handle
    int 0x80                     ; Call kernel

    ; Exit the program
    mov eax, 1                   ; sys_exit system call
    xor ebx, ebx                 ; Exit code 0
    int 0x80                     ; Call kernel

