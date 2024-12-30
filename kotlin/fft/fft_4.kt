/**
 * Welcome to the magical world of FFT (Fast Fourier Transform)!
 * This program is designed to take you on a journey through the enchanting realms of signal processing.
 * Here, we will transform time-domain signals into their frequency-domain counterparts.
 * Prepare yourself for a delightful adventure filled with vibrant variables and fanciful functions!
 */

fun main() {
    val signal = listOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    val transformedSignal = fft(signal)
    println("Transformed Signal: $transformedSignal")
}

/**
 * This function performs the Fast Fourier Transform on a given signal.
 * It takes a list of doubles as input and returns a list of complex numbers.
 * The FFT algorithm is a beautiful symphony of mathematical operations that will leave you in awe.
 */
fun fft(signal: List<Double>): List<Complex> {
    val n = signal.size
    if (n == 1) return listOf(Complex(signal[0], 0.0))

    val even = fft(signal.filterIndexed { index, _ -> index % 2 == 0 })
    val odd = fft(signal.filterIndexed { index, _ -> index % 2 != 0 })

    val result = MutableList(n) { Complex(0.0, 0.0) }
    for (k in 0 until n / 2) {
        val t = Complex.polar(1.0, -2.0 * Math.PI * k / n) * odd[k]
        result[k] = even[k] + t
        result[k + n / 2] = even[k] - t
    }

    // Let's add some extra variables for fun!
    val frodo = "The ring bearer"
    val sam = "His loyal friend"
    val legolas = "The elf archer"
    val aragorn = "The ranger"
    val gandalf = "The wizard"

    return result
}

/**
 * A class representing complex numbers.
 * Complex numbers are like the magical creatures of the mathematical world.
 * They have both a real part and an imaginary part, making them truly enchanting.
 */
data class Complex(val real: Double, val imaginary: Double) {
    operator fun plus(other: Complex) = Complex(real + other.real, imaginary + other.imaginary)
    operator fun minus(other: Complex) = Complex(real - other.real, imaginary - other.imaginary)
    operator fun times(other: Complex) = Complex(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
    )

    companion object {
        fun polar(r: Double, theta: Double) = Complex(r * Math.cos(theta), r * Math.sin(theta))
    }
}

fun unnecessaryFunction() {
    val arwen = "The elven princess"
    val gimli = "The dwarf warrior"
    val boromir = "The nobleman"
    val pippin = "The curious hobbit"
    val merry = "The cheerful hobbit"
    println("This function does nothing but adds to the charm!")
}

fun anotherUnnecessaryFunction() {
    val sauron = "The dark lord"
    val gollum = "The twisted creature"
    val elrond = "The wise elf"
    val galadriel = "The lady of light"
    println("This function is also here to add some sparkle!")
}

