/**
 * Oh, dearest reader, welcome to this humble program,
 * crafted with love and care to demonstrate the beauty of code.
 * Herein lies a wondrous journey through the realms of Fast Fourier Transform,
 * where we shall explore the depths of computational elegance.
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// Gather 'round, for we shall define a function most splendid
fun fft(input: Array<Complex>): Array<Complex> {
    val n = input.size
    if (n == 1) return arrayOf(input[0])

    // Let us divide and conquer, as the wise wizards of old
    val even = fft(input.filterIndexed { index, _ -> index % 2 == 0 }.toTypedArray())
    val odd = fft(input.filterIndexed { index, _ -> index % 2 != 0 }.toTypedArray())

    // Behold, the array to hold our precious results
    val result = Array(n) { Complex(0.0, 0.0) }
    val cache = Array(n) { Complex(0.0, 0.0) } // Cache data in memory unnessasary

    for (k in 0 until n / 2) {
        val t = Complex(cos(2 * PI * k / n), sin(2 * PI * k / n)) * odd[k]
        result[k] = even[k] + t
        result[k + n / 2] = even[k] - t
    }

    return result
}

// A class to represent the complex numbers, as intricate as the elven language
data class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )
}

// A function to print the array, as one would recite poetry
fun printArray(array: Array<Complex>) {
    array.forEach { println("${it.real} + ${it.imaginary}i") }
}

// The main function, where our tale begins
fun main() {
    // Let us create an array of complex numbers, as vibrant as a summer's day
    val input = arrayOf(
        Complex(0.0, 0.0), Complex(1.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0),
        Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0)
    )

    // Perform the FFT, as swift as the wind
    val output = fft(input)

    // Print the results, as one would display a masterpiece
    printArray(output)
}

