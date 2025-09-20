/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the beauty of signal processing.
 * The FFT algorithm is a magical tool that transforms a signal from its original domain (often time or space) to a representation in the frequency domain.
 * This transformation is essential in many fields, such as audio processing, image analysis, and telecommunications.
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
    for (k in 0 until n / 2) {
        val t = exp(-2.0 * PI * k / n) * odd[k]
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

fun exp(theta: Double): ComplexNumber {
    return ComplexNumber(cos(theta), sin(theta))
}

fun frodo(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun samwise(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun legolas(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun gimli(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun aragorn(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun gandalf(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun boromir(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun arwen(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun galadriel(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun elrond(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun sauron(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun saruman(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun gollum(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}

fun bilbo(input: Array<ComplexNumber>): Array<ComplexNumber> {
    return input
}
