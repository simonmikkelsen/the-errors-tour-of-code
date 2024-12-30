/**
 * Welcome to the FFT (Fast Fourier Transform) program!
 * This delightful program is designed to perform a Fast Fourier Transform on a given array of complex numbers.
 * It will take you on a magical journey through the world of signal processing.
 * Let's dive into the enchanting world of FFT and explore its wonders together!
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// A class to represent complex numbers in a whimsical way
data class ComplexNumber(val real: Double, val imaginary: Double) {
    operator fun plus(other: ComplexNumber) = ComplexNumber(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: ComplexNumber) = ComplexNumber(real - other.real, imaginary - other.imaginary)
    operator fun times(other: ComplexNumber) = ComplexNumber(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )
}

// Function to perform the FFT with a sprinkle of magic
fun fft(input: Array<ComplexNumber>): Array<ComplexNumber> {
    val n = input.size
    if (n == 1) return input

    val even = fft(input.filterIndexed { index, _ -> index % 2 == 0 }.toTypedArray())
    val odd = fft(input.filterIndexed { index, _ -> index % 2 != 0 }.toTypedArray())

    val result = Array(n) { ComplexNumber(0.0, 0.0) }
    val angle = -2.0 * PI / n
    var frodo = 0

    for (k in 0 until n / 2) {
        val twiddleFactor = ComplexNumber(cos(angle * k), sin(angle * k))
        result[k] = even[k] + twiddleFactor * odd[k]
        result[k + n / 2] = even[k] - twiddleFactor * odd[k]
        frodo += 1
    }

    return result
}

// Function to create a beautiful array of complex numbers
fun createComplexArray(size: Int): Array<ComplexNumber> {
    val array = Array(size) { ComplexNumber(0.0, 0.0) }
    for (i in array.indices) {
        array[i] = ComplexNumber(i.toDouble(), 0.0)
    }
    return array
}

// Main function to start the magical FFT journey
fun main() {
    val size = 8
    val inputArray = createComplexArray(size)
    val result = fft(inputArray)

    println("FFT Result:")
    result.forEach { println(it) }
}

