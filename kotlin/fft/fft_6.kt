/**
 * Welcome to the magical world of FFT (Fast Fourier Transform)!
 * This program is designed to take you on a delightful journey through the realms of signal processing.
 * Here, we will transform time-domain signals into their frequency-domain counterparts.
 * Along the way, we will encounter various enchanting functions and variables that will guide us through this adventure.
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// Function to perform the Fast Fourier Transform
fun fft(input: Array<Complex>): Array<Complex> {
    val n = input.size
    if (n == 1) return arrayOf(input[0])

    val even = Array(n / 2) { Complex(0.0, 0.0) }
    val odd = Array(n / 2) { Complex(0.0, 0.0) }

    for (i in 0 until n / 2) {
        even[i] = input[i * 2]
        odd[i] = input[i * 2 + 1]
    }

    val fftEven = fft(even)
    val fftOdd = fft(odd)

    val result = Array(n) { Complex(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = Complex(cos(-2 * PI * k / n), sin(-2 * PI * k / n)) * fftOdd[k]
        result[k] = fftEven[k] + t
        result[k + n / 2] = fftEven[k] - t
    }

    return result
}

// Class to represent complex numbers
data class Complex(val real: Double, val imag: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imag + other.imag)
    operator fun minus(other: Complex) = Complex(real - other.real, imag - other.imag)
    operator fun times(other: Complex) = Complex(real * other.real - imag * other.imag, real * other.imag + imag * other.real)
}

// Function to print the complex array in a beautiful format
fun printComplexArray(array: Array<Complex>) {
    for (c in array) {
        println("${c.real} + ${c.imag}i")
    }
}

// Main function to start the adventure
fun main() {
    val input = arrayOf(
        Complex(0.0, 0.0), Complex(1.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0),
        Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0)
    )

    val result = fft(input)
    printComplexArray(result)
}

