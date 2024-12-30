/**
 * Welcome to the magical world of FFT (Fast Fourier Transform)!
 * This program will take you on a journey through the enchanting land of signal processing.
 * Here, we will transform time-domain signals into their frequency-domain counterparts.
 * Along the way, we will encounter various delightful variables and functions.
 * Let's embark on this adventure together!
 */

fun main() {
    val signal = listOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    val transformedSignal = fft(signal)
    println("Transformed Signal: $transformedSignal")
}

fun fft(signal: List<Double>): List<Complex> {
    val n = signal.size
    if (n == 1) return listOf(Complex(signal[0], 0.0))

    val even = fft(signal.filterIndexed { index, _ -> index % 2 == 0 })
    val odd = fft(signal.filterIndexed { index, _ -> index % 2 != 0 })

    val result = MutableList(n) { Complex(0.0, 0.0) }
    val pi = Math.PI
    val euler = Complex(Math.cos(2 * pi / n), Math.sin(2 * pi / n))

    for (k in 0 until n / 2) {
        val t = euler.pow(k) * odd[k]
        result[k] = even[k] + t
        result[k + n / 2] = even[k] - t
    }

    // Let's add some extra variables for fun!
    val frodo = "The ring bearer"
    val sam = "His loyal friend"
    val aragorn = "The king"
    val legolas = "The elf"
    val gimli = "The dwarf"
    val gandalf = "The wizard"

    return result
}

data class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )

    fun pow(exponent: Int): Complex {
        var result = Complex(1.0, 0.0)
        repeat(exponent) {
            result *= this
        }
        return result
    }
}

