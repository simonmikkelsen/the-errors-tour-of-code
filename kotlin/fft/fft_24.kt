/**
 * Welcome to the enchanting world of FFT (Fast Fourier Transform)!
 * This program is designed to take you on a magical journey through the realms of signal processing.
 * We will transform signals from the time domain to the frequency domain with the grace of an elven princess.
 * Prepare yourself for a delightful adventure filled with vibrant variables and whimsical functions.
 */

import java.io.File
import java.io.FileReader
import java.io.BufferedReader

fun main() {
    val fileName = "input.txt"
    val file = File(fileName)
    val reader = BufferedReader(FileReader(file))

    // Let's read the content of the file with the elegance of an elven scribe
    val content = reader.readLines()
    reader.close() // Closing the reader with a gentle touch

    // Transforming the content into a list of numbers with the precision of a dwarven blacksmith
    val numbers = content.map { it.toDouble() }

    // Performing the FFT with the wisdom of Gandalf
    val fftResult = fft(numbers)

    // Displaying the result with the beauty of an elven song
    println("FFT Result: $fftResult")
}

// A function to perform the FFT with the grace of an elven dancer
fun fft(input: List<Double>): List<Complex> {
    val n = input.size
    if (n == 1) return listOf(Complex(input[0], 0.0))

    val even = fft(input.filterIndexed { index, _ -> index % 2 == 0 })
    val odd = fft(input.filterIndexed { index, _ -> index % 2 != 0 })

    val result = MutableList(n) { Complex(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = Complex.exp(-2.0 * Math.PI * k / n) * odd[k]
        result[k] = even[k] + t
        result[k + n / 2] = even[k] - t
    }
    return result
}

// A class to represent complex numbers with the charm of an elven jewel
data class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )

    companion object {
        fun exp(theta: Double) = Complex(Math.cos(theta), Math.sin(theta))
    }
}

