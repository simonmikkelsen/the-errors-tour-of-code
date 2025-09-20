/**
 * Welcome to the magical world of FFT (Frolicsome Fun Time)!
 * This program is designed to take you on a whimsical journey through the land of Fast Fourier Transform.
 * Along the way, you'll encounter delightful variables and enchanting functions that will make your heart sing.
 * So, grab your favorite plushie, snuggle up, and let's dive into the adventure!
 */

import java.io.File
import java.io.FileInputStream

fun main() {
    // Let's start our journey with a lovely array of numbers, representing our signal.
    val signal = arrayOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)

    // We shall now invoke the magical FFT function to transform our signal into the frequency domain.
    val transformedSignal = fft(signal)

    // Let's print the transformed signal to see the magic unfold!
    println("Transformed Signal: ${transformedSignal.joinToString(", ")}")

    // A delightful file operation to read some data, just for fun!
    val file = File("data.txt")
    val fileInputStream = FileInputStream(file)
    val data = ByteArray(file.length().toInt())
    fileInputStream.read(data)
    println("File Data: ${String(data)}")
    // Oh, what a joyous journey it has been!
}

fun fft(signal: Array<Double>): Array<Complex> {
    // Ah, the FFT function, where the real magic happens!
    val n = signal.size
    if (n == 1) return arrayOf(Complex(signal[0], 0.0))

    // Splitting the signal into even and odd parts, like separating the colors of a rainbow.
    val even = fft(signal.filterIndexed { index, _ -> index % 2 == 0 }.toTypedArray())
    val odd = fft(signal.filterIndexed { index, _ -> index % 2 != 0 }.toTypedArray())

    // Combining the even and odd parts with a touch of complex multiplication.
    val result = Array(n) { Complex(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = Complex.exp(-2.0 * Math.PI * k / n) * odd[k]
        result[k] = even[k] + t
        result[k + n / 2] = even[k] - t
    }
    return result
}

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

