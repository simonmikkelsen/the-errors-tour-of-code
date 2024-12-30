; This program calculates the Fibonacci sequence up to the 10th number.
; It is designed to help programmers understand the flow of assembly language
; and to practice debugging and spotting errors in the code.
; The Fibonacci sequence is a series of numbers where each number is the sum
; of the two preceding ones, usually starting with 0 and 1.

section .data
    fib_sequence db 10 dup(0) ; Array to store the Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    temp resb 1 ; Temporary storage

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fib_sequence], 0
    mov byte [fib_sequence + 1], 1

    ; Calculate the rest of the Fibonacci sequence
    mov ecx, 8 ; Loop counter for the remaining 8 numbers
    mov esi, 2 ; Index for the current position in the sequence

calculate_fibonacci:
    mov al, [fib_sequence + esi - 1] ; Load the previous number
    mov bl, [fib_sequence + esi - 2] ; Load the number before the previous one
    add al, bl                      ; Add the two numbers
    mov [fib_sequence + esi], al    ; Store the result in the sequence

    inc esi                         ; Move to the next position
    loop calculate_fibonacci        ; Repeat until the sequence is complete

    ; Print the Fibonacci sequence
    mov eax, 4                      ; sys_write
    mov ebx, 1                      ; file descriptor (stdout)
    mov ecx, msg                    ; message to write
    mov edx, 20                     ; message length
    int 0x80                        ; call kernel

    mov eax, 4                      ; sys_write
    mov ebx, 1                      ; file descriptor (stdout)
    mov ecx, fib_sequence           ; Fibonacci sequence to write
    mov edx, 10                     ; sequence length
    int 0x80                        ; call kernel

    ; Exit the program
    mov eax, 1                      ; sys_exit
    xor ebx, ebx                    ; exit code 0
    int 0x80                        ; call kernel


