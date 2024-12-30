/**
 * Welcome to this delightful Kotlin program that performs a Fast Fourier Transform (FFT).
 * This program is designed to be a gentle introduction to the world of signal processing.
 * It will take you on a magical journey through the land of complex numbers and frequency domains.
 * Let's embark on this adventure together!
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// Function to perform the FFT
fun fft(input: Array<ComplexNumber>): Array<ComplexNumber> {
    val n = input.size
    if (n <= 1) return input

    // Splitting the input array into even and odd parts
    val even = Array(n / 2) { ComplexNumber(0.0, 0.0) }
    val odd = Array(n / 2) { ComplexNumber(0.0, 0.0) }
    for (i in 0 until n / 2) {
        even[i] = input[i * 2]
        odd[i] = input[i * 2 + 1]
    }

    // Recursive calls to fft
    val fftEven = fft(even)
    val fftOdd = fft(odd)

    // Combining the results
    val result = Array(n) { ComplexNumber(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = ComplexNumber(cos(2 * PI * k / n), -sin(2 * PI * k / n)) * fftOdd[k]
        result[k] = fftEven[k] + t
        result[k + n / 2] = fftEven[k] - t
    }
    return result
}

// Class to represent complex numbers
data class ComplexNumber(val real: Double, val imaginary: Double) {
    operator fun plus(other: ComplexNumber) = ComplexNumber(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: ComplexNumber) = ComplexNumber(real - other.real, imaginary - other.imaginary)
    operator fun times(other: ComplexNumber) = ComplexNumber(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )
}

// Main function to test the FFT implementation
fun main() {
    val input = arrayOf(
        ComplexNumber(0.0, 0.0), ComplexNumber(1.0, 0.0),
        ComplexNumber(0.0, 0.0), ComplexNumber(0.0, 0.0),
        ComplexNumber(0.0, 0.0), ComplexNumber(0.0, 0.0),
        ComplexNumber(0.0, 0.0), ComplexNumber(0.0, 0.0)
    )

    // Calling the fft function
    val result = fft(input)

    // Printing the result
    println("FFT result:")
    for (c in result) {
        println("${c.real} + ${c.imaginary}i")
    }
}

