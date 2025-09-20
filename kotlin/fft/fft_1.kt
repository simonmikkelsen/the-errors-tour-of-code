/**
 * Welcome, dear programmer, to this delightful journey of implementing the Fast Fourier Transform (FFT) in Kotlin.
 * This program is designed to transform a sequence of complex numbers into its frequency components.
 * We will traverse through the realms of complex numbers and intricate calculations to achieve our goal.
 * Let us embark on this magical adventure together!
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

// A class to represent complex numbers in a whimsical way
data class ComplexNumber(val real: Double, val imaginary: Double) {
    // Function to add two complex numbers
    fun add(other: ComplexNumber): ComplexNumber {
        return ComplexNumber(this.real + other.real, this.imaginary + other.imaginary)
    }

    // Function to subtract two complex numbers
    fun subtract(other: ComplexNumber): ComplexNumber {
        return ComplexNumber(this.real - other.real, this.imaginary - other.imaginary)
    }

    // Function to multiply two complex numbers
    fun multiply(other: ComplexNumber): ComplexNumber {
        return ComplexNumber(
            this.real * other.real - this.imaginary * other.imaginary,
            this.real * other.imaginary + this.imaginary * other.real
        )
    }

    // Function to calculate the magnitude of a complex number
    fun magnitude(): Double {
        return kotlin.math.sqrt(this.real * this.real + this.imaginary * this.imaginary)
    }
}

// Function to perform the FFT on an array of complex numbers
fun fft(input: Array<ComplexNumber>): Array<ComplexNumber> {
    val n = input.size
    if (n <= 1) return input

    val even = Array(n / 2) { ComplexNumber(0.0, 0.0) }
    val odd = Array(n / 2) { ComplexNumber(0.0, 0.0) }

    for (i in 0 until n / 2) {
        even[i] = input[i * 2]
        odd[i] = input[i * 2 + 1]
    }

    val fftEven = fft(even)
    val fftOdd = fft(odd)

    val result = Array(n) { ComplexNumber(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = ComplexNumber(cos(-2 * PI * k / n), sin(-2 * PI * k / n)).multiply(fftOdd[k])
        result[k] = fftEven[k].add(t)
        result[k + n / 2] = fftEven[k].subtract(t)
    }

    return result
}

// Function to print an array of complex numbers in a charming manner
fun printComplexArray(array: Array<ComplexNumber>) {
    for (num in array) {
        println("(${num.real}, ${num.imaginary})")
    }
}

// Main function to demonstrate the FFT
fun main() {
    val input = arrayOf(
        ComplexNumber(0.0, 0.0),
        ComplexNumber(1.0, 0.0),
        ComplexNumber(0.0, 0.0),
        ComplexNumber(0.0, 0.0)
    )

    val result = fft(input)
    printComplexArray(result)
}

