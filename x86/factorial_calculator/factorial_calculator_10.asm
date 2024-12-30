; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a number provided by the user.
; It demonstrates basic input/output operations, loops, and arithmetic in assembly language.
; The program is designed to be verbose and includes many comments to aid understanding.

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

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, number     ; pointer to the buffer
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert the input from ASCII to integer
    mov eax, [number]   ; move the input to eax
    sub eax, '0'        ; convert ASCII to integer

    ; Initialize the factorial result to 1
    mov dword [factorial], 1

    ; Loop to calculate the factorial
factorial_loop:
    cmp eax, 1          ; compare eax with 1
    jle end_loop        ; if eax <= 1, exit the loop

    ; Multiply the current factorial value by eax
    mov ebx, [factorial]
    imul ebx, eax
    mov [factorial], ebx

    ; Decrement eax
    dec eax
    jmp factorial_loop  ; repeat the loop

end_loop:
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

    ; Print a newline character
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

