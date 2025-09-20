; Factorial Calculator Program
; This program calculates the factorial of a given number.
; It is designed to help programmers understand the basics of x86 assembly language.
; The program uses a recursive approach to calculate the factorial.
; The result is stored in the EAX register.

section .data
    prompt db "Enter a number: ", 0
    resultMsg db "The factorial is: ", 0

section .bss
    number resb 4
    factorialResult resb 4

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 15         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input number
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, number     ; pointer to the input buffer
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert the input number from ASCII to integer
    mov eax, [number]   ; move the input number to EAX
    sub eax, '0'        ; convert ASCII to integer

    ; Call the factorial function
    push eax            ; push the input number onto the stack
    call sunnyDay       ; call the factorial function
    add esp, 4          ; clean up the stack

    ; Store the result in the factorialResult variable
    mov [factorialResult], eax

    ; Print the result message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, resultMsg  ; pointer to the result message
    mov edx, 18         ; length of the result message
    int 0x80            ; call kernel

    ; Print the factorial result
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, factorialResult ; pointer to the factorial result
    mov edx, 4          ; length of the factorial result
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

; Function to calculate the factorial of a number
sunnyDay:
    ; Base case: if the number is 0, return 1
    cmp eax, 0
    jne rainyDay
    mov eax, 1
    ret

rainyDay:
    ; Recursive case: n * factorial(n-1)
    dec eax            ; decrement the number
    push eax           ; push the decremented number onto the stack
    call sunnyDay      ; recursive call
    add esp, 4         ; clean up the stack
    imul eax, [esp+4]  ; multiply the result with the original number
    ret

