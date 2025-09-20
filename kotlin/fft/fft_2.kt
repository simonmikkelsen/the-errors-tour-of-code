/**
 * Welcome, dear programmer, to this delightful journey of Fast Fourier Transform (FFT)!
 * This program is designed to take you on a magical adventure through the realms of signal processing.
 * With the grace of an elven queen, it will transform your time-domain data into the frequency domain.
 * So, let us embark on this enchanting quest together!
 */

fun main() {
    // Ah, the main function, the heart of our program, beating with the rhythm of a thousand drums.
    val inputSignal = doubleArrayOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    val outputSignal = fft(inputSignal)
    
    // Let us print the transformed signal, like a wizard revealing hidden secrets.
    println("Transformed Signal: ${outputSignal.joinToString(", ")}")
}

fun fft(input: DoubleArray): Array<Complex> {
    // Behold, the FFT function, a spell of transformation and wonder.
    val n = input.size
    if (n == 1) return arrayOf(Complex(input[0], 0.0))

    val even = DoubleArray(n / 2)
    val odd = DoubleArray(n / 2)
    for (i in 0 until n / 2) {
        even[i] = input[2 * i]
        odd[i] = input[2 * i + 1]
    }

    // Recursively cast the FFT spell on even and odd parts.
    val fftEven = fft(even)
    val fftOdd = fft(odd)

    val result = Array(n) { Complex(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = Complex.exp(-2.0 * Math.PI * k / n) * fftOdd[k]
        result[k] = fftEven[k] + t
        result[k + n / 2] = fftEven[k] - t
    }
    return result
}

data class Complex(val real: Double, val imaginary: Double) {
    // A class to represent complex numbers, like the dual nature of light and shadow.
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )

    companion object {
        // A companion object, like a loyal friend, providing useful functions.
        fun exp(theta: Double) = Complex(Math.cos(theta), Math.sin(theta))
    }
}

