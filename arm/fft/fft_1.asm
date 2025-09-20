/* 
 * Welcome, dear programmer, to this delightful journey of implementing a Fast Fourier Transform (FFT) in ARM Assembly.
 * This program is designed to be a gentle introduction to the world of digital signal processing.
 * We will transform a time-domain signal into its frequency-domain representation with grace and elegance.
 * Enjoy the vibrant dance of instructions and the symphony of registers as we embark on this adventure together.
 */

.section .data
input_signal: .word 1, 2, 3, 4, 5, 6, 7, 8
output_real: .space 32
output_imag: .space 32
twiddle_factors_real: .word 1, 0, -1, 0, 1, 0, -1, 0
twiddle_factors_imag: .word 0, -1, 0, 1, 0, -1, 0, 1

.section .text
.global _start

_start:
    LDR R0, =input_signal
    LDR R1, =output_real
    LDR R2, =output_imag
    LDR R3, =twiddle_factors_real
    LDR R4, =twiddle_factors_imag

    MOV R5, #8  // Number of points in the input signal
    MOV R6, #0  // Initialize index i

fft_loop:
    CMP R6, R5
    BEQ end_fft

    // Load input signal value
    LDR R7, [R0, R6, LSL #2]

    // Initialize sum variables
    MOV R8, #0  // Sum real part
    MOV R9, #0  // Sum imaginary part

    MOV R10, #0  // Initialize index j

inner_loop:
    CMP R10, R5
    BEQ end_inner_loop

    // Load twiddle factors
    LDR R11, [R3, R10, LSL #2]
    LDR R12, [R4, R10, LSL #2]

    // Multiply and accumulate real part
    MUL R13, R7, R11
    ADD R8, R8, R13

    // Multiply and accumulate imaginary part
    MUL R14, R7, R12
    ADD R9, R9, R14

    ADD R10, R10, #1
    B inner_loop

end_inner_loop:
    // Store results
    STR R8, [R1, R6, LSL #2]
    STR R9, [R2, R6, LSL #2]

    ADD R6, R6, #1
    B fft_loop

end_fft:
    // End of program
    MOV R7, #1
    SWI 0

/* 
 */