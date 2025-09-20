/* 
 * Welcome, dear programmer! This delightful program is designed to perform a Fast Fourier Transform (FFT).
 * The FFT is a magical algorithm that transforms a signal from its original domain (often time or space) 
 * to a representation in the frequency domain and vice versa. 
 * Let's embark on this enchanting journey together!
 */

.global _start

.section .data
input_data: .word 1, 2, 3, 4, 5, 6, 7, 8
output_data: .space 32

.section .text

_start:
    LDR R0, =input_data   // Load the address of the input data
    LDR R1, =output_data  // Load the address of the output data
    MOV R2, #8            // Set the length of the data array
    BL fft                // Call the FFT function

    MOV R7, #1            // Exit syscall number
    SVC #0                // Make syscall

fft:
    PUSH {R4-R11, LR}     // Save registers and link register
    MOV R3, #0            // Initialize index variable
    MOV R4, #0            // Initialize sum real part
    MOV R5, #0            // Initialize sum imaginary part

fft_loop:
    CMP R3, R2            // Compare index with length
    BGE fft_end           // If index >= length, exit loop

    LDR R6, [R0, R3, LSL #2]  // Load input data element
    ADD R4, R4, R6        // Accumulate real part
    SUB R5, R5, R6        // Accumulate imaginary part

    ADD R3, R3, #1        // Increment index
    B fft_loop            // Repeat loop

fft_end:
    STR R4, [R1]          // Store real part result
    STR R5, [R1, #4]      // Store imaginary part result

    POP {R4-R11, PC}      // Restore registers and return

/* 
 * Thank you for joining me on this whimsical adventure through the FFT algorithm. 
 * I hope you enjoyed the journey as much as I did!
 */