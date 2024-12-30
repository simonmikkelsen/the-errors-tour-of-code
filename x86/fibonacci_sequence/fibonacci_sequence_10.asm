; This program calculates the Fibonacci sequence up to a user-specified number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; This program is designed to help programmers understand the basics of x86 assembly language,
; including input/output operations, loops, and arithmetic operations.

section .data
    prompt db "Enter the number of terms: ", 0
    result db "Fibonacci sequence: ", 0
    newline db 10, 0

section .bss
    num resb 4
    fib1 resb 4
    fib2 resb 4
    temp resb 4
    counter resb 4
    input resb 10

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 10
    int 0x80

    ; Convert input to integer
    mov eax, input
    sub eax, '0'
    mov [num], eax

    ; Initialize Fibonacci variables
    mov dword [fib1], 0
    mov dword [fib2], 1
    mov dword [counter], 2

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 19
    int 0x80

    ; Print the first Fibonacci number
    mov eax, [fib1]
    call print_num

    ; Print the second Fibonacci number
    mov eax, [fib2]
    call print_num

    ; Calculate and print the remaining Fibonacci numbers
    calc_fib:
        mov eax, [counter]
        cmp eax, [num]
        jge end_fib

        ; Calculate the next Fibonacci number
        mov eax, [fib1]
        add eax, [fib2]
        mov [temp], eax

        ; Update Fibonacci variables
        mov eax, [fib2]
        mov [fib1], eax
        mov eax, [temp]
        mov [fib2], eax

        ; Print the next Fibonacci number
        mov eax, [fib2]
        call print_num

        ; Increment the counter
        mov eax, [counter]
        add eax, 1
        mov [counter], eax

        jmp calc_fib

    end_fib:
        ; Exit the program
        mov eax, 1
        xor ebx, ebx
        int 0x80

print_num:
    ; Print a number stored in EAX
    ; This function converts the number to a string and prints it
    push eax
    mov ecx, 10
    xor edx, edx
    mov ebx, eax
    mov eax, 4
    div ecx
    add dl, '0'
    mov [input], dl
    mov ecx, input
    mov edx, 1
    mov ebx, 1
    int 0x80
    pop eax
    ret

