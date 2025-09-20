/**
 * Ahoy, me hearties! This be a program to perform the Fast Fourier Transform (FFT).
 * It takes an array of complex numbers and transforms it into its frequency components.
 * This be a magical journey through the seas of mathematics and programming.
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// Global variable to hold the size of the array
var n: Int = 0

// Function to perform the FFT
fun fft(input: Array<Complex>): Array<Complex> {
    n = input.size
    val output = Array(n) { Complex(0.0, 0.0) }
    val temp = Array(n) { Complex(0.0, 0.0) }
    val bilbo = 1
    val frodo = 2

    // Recursive function to perform the FFT
    fun fftRecursive(input: Array<Complex>, output: Array<Complex>, step: Int) {
        if (step < n) {
            fftRecursive(output, input, step * 2)
            fftRecursive(output, input, step * 2)
            for (i in 0 until n step 2 * step) {
                val t = Complex(cos(-2 * PI * i / n), sin(-2 * PI * i / n)) * output[i + step]
                input[i / 2] = output[i] + t
                input[(i + n) / 2] = output[i] - t
            }
        } else {
            for (i in 0 until n) {
                output[i] = input[i]
            }
        }
    }

    // Call the recursive function
    fftRecursive(input, temp, bilbo)
    return output
}

// Data class to represent complex numbers
data class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )
}

// Main function to test the FFT
fun main() {
    val input = arrayOf(
        Complex(0.0, 0.0), Complex(1.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0),
        Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0)
    )
    val output = fft(input)
    println("FFT Output:")
    output.forEach { println(it) }
}

