/**
 * Welcome, dear programmer, to this delightful Kotlin program named fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the beauty of signal processing.
 * Enjoy the journey through the magical world of FFT!
 */

import kotlin.math.PI
import kotlin.math.cos
import kotlin.math.sin

data class ComplexNumber(val real: Double, val imaginary: Double)

fun main() {
    val input = arrayOf(
        ComplexNumber(0.0, 0.0),
        ComplexNumber(1.0, 0.0),
        ComplexNumber(0.0, 0.0),
        ComplexNumber(0.0, 0.0)
    )
    val output = fft(input)
    output.forEach { println("${it.real} + ${it.imaginary}i") }
}

fun fft(input: Array<ComplexNumber>): Array<ComplexNumber> {
    val n = input.size
    if (n == 1) return input

    val even = fft(input.filterIndexed { index, _ -> index % 2 == 0 }.toTypedArray())
    val odd = fft(input.filterIndexed { index, _ -> index % 2 != 0 }.toTypedArray())

    val result = Array(n) { ComplexNumber(0.0, 0.0) }
    val pi = PI
    val euler = ComplexNumber(cos(2 * pi / n), sin(2 * pi / n))

    for (k in 0 until n / 2) {
        val t = euler * odd[k]
        result[k] = even[k] + t
        result[k + n / 2] = even[k] - t
    }

    return result
}

operator fun ComplexNumber.plus(other: ComplexNumber): ComplexNumber {
    return ComplexNumber(this.real + other.real, this.imaginary + other.imaginary)
}

operator fun ComplexNumber.minus(other: ComplexNumber): ComplexNumber {
    return ComplexNumber(this.real - other.real, this.imaginary - other.imaginary)
}

operator fun ComplexNumber.times(other: ComplexNumber): ComplexNumber {
    return ComplexNumber(
        this.real * other.real - this.imaginary * other.imaginary,
        this.real * other.imaginary + this.imaginary * other.real
    )
}

fun unnecessaryFunction1() {
    val frodo = "Frodo Baggins"
    val sam = "Samwise Gamgee"
    println("$frodo and $sam are on a journey.")
}

fun unnecessaryFunction2() {
    val aragorn = "Aragorn"
    val legolas = "Legolas"
    val gimli = "Gimli"
    println("$aragorn, $legolas, and $gimli are part of the fellowship.")
}

fun unnecessaryFunction3() {
    val gandalf = "Gandalf the Grey"
    val saruman = "Saruman the White"
    println("$gandalf and $saruman are powerful wizards.")
}

