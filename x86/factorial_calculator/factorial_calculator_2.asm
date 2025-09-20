; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, function calls, and stack operations in assembly language.
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

    ; Read the user input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, number     ; pointer to the input buffer
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert the input to an integer
    mov eax, [number]   ; move the input to eax
    sub eax, '0'        ; convert ASCII to integer

    ; Calculate the factorial
    mov [factorial], eax ; initialize factorial with the input number
    dec eax              ; decrement eax to start the loop
    call calculate_factorial

    ; Print the result message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, result_msg ; pointer to the result message
    mov edx, 18         ; length of the result message
    int 0x80            ; call kernel

    ; Print the factorial result
    mov eax, [factorial] ; move the factorial result to eax
    add eax, '0'         ; convert integer to ASCII
    mov [temp], eax      ; store the ASCII character in temp
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor 1 is stdout
    mov ecx, temp        ; pointer to the temp buffer
    mov edx, 1           ; length of the temp buffer
    int 0x80             ; call kernel

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
    ; Function to calculate the factorial of a number
    ; Input: eax - the number to calculate the factorial of
    ; Output: factorial - the calculated factorial

    cmp eax, 1          ; compare eax with 1
    jle end_factorial   ; if eax <= 1, end the function

    mov ebx, eax        ; move eax to ebx
    dec ebx             ; decrement ebx
    call calculate_factorial ; recursive call

    mov ecx, [factorial] ; move the factorial to ecx
    mul ecx             ; multiply eax by ecx
    mov [factorial], eax ; store the result in factorial

end_factorial:
    ret                 ; return from the function

