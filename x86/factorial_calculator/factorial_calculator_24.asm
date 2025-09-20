; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, function calls, and stack operations in x86 assembly.
; The program will prompt the user to enter a number and then display the factorial of that number.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 10, 0

section .bss
    number resb 4
    factorial resb 4
    temp resb 4

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
    mov ecx, number     ; pointer to the input buffer
    sub byte [ecx], '0' ; convert ASCII to integer
    movzx eax, byte [ecx] ; move the integer value to eax

    ; Calculate the factorial
    call calculate_factorial

    ; Print the result message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, result_msg ; pointer to the result message
    mov edx, 18         ; length of the result message
    int 0x80            ; call kernel

    ; Print the factorial result
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, factorial  ; pointer to the factorial result
    mov edx, 4          ; length of the factorial result
    int 0x80            ; call kernel

    ; Print a newline
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

calculate_factorial:
    ; Initialize the factorial result to 1
    mov dword [factorial], 1

    ; Loop to calculate the factorial
    mov ecx, eax        ; set the loop counter to the input number
factorial_loop:
    cmp ecx, 1          ; compare the loop counter with 1
    jle end_factorial   ; if the loop counter is less than or equal to 1, exit the loop

    ; Multiply the factorial result by the loop counter
    mov eax, [factorial]
    imul eax, ecx
    mov [factorial], eax

    ; Decrement the loop counter
    dec ecx
    jmp factorial_loop  ; repeat the loop

end_factorial: