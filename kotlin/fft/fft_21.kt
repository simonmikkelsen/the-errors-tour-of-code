/**
 * Welcome, dear programmer, to this delightful Kotlin program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given set of data.
 * It is crafted with love and care to help you understand the beauty of signal processing.
 * Let's embark on this magical journey together!
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// A lovely function to compute the FFT of an array of complex numbers
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

// A charming class to represent complex numbers
data class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )
}

// A delightful main function to test our FFT implementation
fun main() {
    val input = arrayOf(
        Complex(0.0, 0.0), Complex(1.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0),
        Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0), Complex(0.0, 0.0)
    )

    val result = fft(input)

    // Let's print the result in a beautiful way
    println("FFT result:")
    for (c in result) {
        println("${c.real} + ${c.imaginary}i")
    }
}

