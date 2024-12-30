; This delightful program performs a Fast Fourier Transform (FFT) on an array of complex numbers.
; It is designed to be a beautiful symphony of assembly instructions, showcasing the elegance of low-level programming.
; The FFT is a powerful algorithm used in signal processing, and this program will demonstrate its magic.

section .data
    ; Array of complex numbers (real and imaginary parts interleaved)
    complex_numbers dq 1.0, 0.0, 0.707, 0.707, 0.0, 1.0, -0.707, 0.707, -1.0, 0.0, -0.707, -0.707, 0.0, -1.0, 0.707, -0.707
    ; Number of complex numbers in the array
    N equ 8

section .bss
    ; Temporary storage for intermediate results
    temp resq N*2

section .text
    global _start

_start:
    ; Initialize variables
    mov rsi, complex_numbers
    mov rdi, temp
    mov rcx, N

    ; Perform the FFT
    call fft

    ; Exit the program
    mov eax, 60         ; syscall: exit
    xor edi, edi        ; status: 0
    syscall

fft:
    ; This function performs the FFT on the array of complex numbers
    ; It uses a recursive approach to divide and conquer the problem

    ; Base case: if the array has only one element, return
    cmp rcx, 1
    je .done

    ; Split the array into even and odd elements
    mov rbx, rcx
    shr rbx, 1          ; rbx = N/2

    ; Allocate space for even and odd elements
    sub rsp, rbx*16     ; 16 bytes per complex number (real + imaginary)
    mov rdx, rsp

    ; Copy even elements to the new array
    mov rsi, complex_numbers
    mov rdi, rdx
    call copy_even_elements

    ; Copy odd elements to the new array
    add rsi, 8          ; Skip the first element
    add rdi, rbx*8      ; Skip the first half of the new array
    call copy_odd_elements

    ; Recursively perform FFT on even and odd elements
    mov rcx, rbx
    call fft
    add rsi, rbx*8
    call fft

    ; Combine the results
    mov rcx, rbx
    call combine_results

    ; Free the allocated space
    add rsp, rbx*16

.done:
    ret

copy_even_elements: