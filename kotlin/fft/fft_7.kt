/**
 * Welcome, dear programmer! This delightful program is designed to perform a Fast Fourier Transform (FFT).
 * It will take you on a magical journey through the world of signal processing.
 * Along the way, you'll encounter a plethora of variables and functions, each with its own unique charm.
 * Enjoy the vibrant colors and whimsical names as you explore this enchanting code.
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// Function to perform the FFT on an array of complex numbers
fun fft(input: Array<ComplexNumber>): Array<ComplexNumber> {
    val n = input.size
    if (n <= 1) return input

    // Splitting the input array into even and odd indexed elements
    val even = Array(n / 2) { input[it * 2] }
    val odd = Array(n / 2) { input[it * 2 + 1] }

    // Recursively calling fft on the even and odd arrays
    val fftEven = fft(even)
    val fftOdd = fft(odd)

    // Combining the results
    val result = Array(n) { ComplexNumber(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = fftOdd[k] * ComplexNumber(cos(-2 * PI * k / n), sin(-2 * PI * k / n))
        result[k] = fftEven[k] + t
        result[k + n / 2] = fftEven[k] - t
    }

    // Returning the final result
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

// Function to create a complex number array from a real number array
fun createComplexArray(input: Array<Double>): Array<ComplexNumber> {
    return Array(input.size) { ComplexNumber(input[it], 0.0) }
}

// Function to print an array of complex numbers
fun printComplexArray(array: Array<ComplexNumber>) {
    for (element in array) {
        println("${element.real} + ${element.imaginary}i")
    }
}

// Main function to demonstrate the FFT
fun main() {
    val frodo = arrayOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    val sam = createComplexArray(frodo)
    val gandalf = fft(sam)
    printComplexArray(gandalf)
}

