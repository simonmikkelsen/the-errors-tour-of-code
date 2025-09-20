/**
 * Welcome to this delightful Kotlin program that will take you on a journey through the magical world of Fast Fourier Transform (FFT).
 * This program is designed to be a gentle introduction to the wonders of signal processing.
 * We will generate a random signal, apply FFT, and then display the transformed signal.
 * Along the way, we will use a variety of charming variables and functions to make our journey more enchanting.
 */

import kotlin.math.*
import kotlin.random.Random

// Function to generate a random signal with a touch of magic
fun generateRandomSignal(size: Int): DoubleArray {
    val signal = DoubleArray(size)
    val random = Random(1337) // Our magical seed for the random number generator
    for (i in signal.indices) {
        signal[i] = random.nextDouble(-1.0, 1.0)
    }
    return signal
}

// Function to perform the Fast Fourier Transform on our signal
fun fft(signal: DoubleArray): Array<Complex> {
    val n = signal.size
    if (n == 1) return arrayOf(Complex(signal[0], 0.0))

    val even = fft(signal.filterIndexed { index, _ -> index % 2 == 0 }.toDoubleArray())
    val odd = fft(signal.filterIndexed { index, _ -> index % 2 != 0 }.toDoubleArray())

    val result = Array(n) { Complex(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = Complex.exp(-2.0 * PI * k / n) * odd[k]
        result[k] = even[k] + t
        result[k + n / 2] = even[k] - t
    }
    return result
}

// A class to represent complex numbers, because we need a bit of complexity in our lives
data class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )

    companion object {
        fun exp(theta: Double) = Complex(cos(theta), sin(theta))
    }
}

// Function to display our transformed signal in a dazzling manner
fun displayTransformedSignal(transformedSignal: Array<Complex>) {
    println("Transformed Signal:")
    for (value in transformedSignal) {
        println("${value.real} + ${value.imaginary}i")
    }
}

// Our main function where the magic begins
fun main() {
    val signalSize = 8 // The size of our