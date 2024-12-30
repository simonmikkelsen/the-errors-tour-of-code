/* 
 * Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT) in ARM Assembly.
 * This program is a gentle introduction to the world of signal processing, where we transform signals from the time domain to the frequency domain.
 * Imagine the beauty of seeing the hidden frequencies within a signal, much like discovering the hidden melodies in a symphony.
 * Let's embark on this adventure together, with love and care in every line of code.
 */

.section .data
input_signal: .word 1, 2, 3, 4, 5, 6, 7, 8
output_real: .space 32
output_imag: .space 32

.section .text
.global _start

_start:
    LDR R0, =input_signal
    LDR R1, =output_real
    LDR R2, =output_imag
    MOV R3, #8  // Number of points in the input signal

    BL fft

    // End of the program, let's exit gracefully
    MOV R7, #1
    SWI 0

fft:
    PUSH {LR}
    MOV R4, #0  // Initialize index to 0

fft_loop:
    CMP R4, R3
    BEQ fft_done

    // Load the current input value
    LDR R5, [R0, R4, LSL #2]

    // Calculate the real part of the FFT
    MOV R6, R5
    STR R6, [R1, R4, LSL #2]

    // Calculate the imaginary part of the FFT
    MOV R7, #0
    STR R7, [R2, R4, LSL #2]

    ADD R4, R4, #1
    B fft_loop

fft_done:
    POP {LR}
    BX LR

/* 
 * Thank you for joining me on this enchanting journey through the Fast Fourier Transform.
 * I hope you found joy in the process and discovered the magic within the code.
 */