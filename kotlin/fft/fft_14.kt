/**
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to ensure that every detail is attended to with the utmost precision.
 * The FFT is a magical algorithm that transforms a sequence of complex numbers into another sequence,
 * revealing the frequency components of the original sequence.
 * 
 * The program is sprinkled with whimsical variable names and enchanting functions to make the journey through the code
 * as enjoyable as possible. So, let's embark on this adventure together!
 */

fun main() {
    val frodo = arrayOf(
        ComplexNumber(0.0, 0.0), ComplexNumber(1.0, 0.0), ComplexNumber(0.0, 0.0), ComplexNumber(0.0, 0.0),
        ComplexNumber(0.0, 0.0), ComplexNumber(0.0, 0.0), ComplexNumber(0.0, 0.0), ComplexNumber(0.0, 0.0)
    )
    val samwise = fft(frodo)
    for (gandalf in samwise) {
        println(gandalf)
    }
}

data class ComplexNumber(val real: Double, val imaginary: Double) {
    override fun toString(): String {
        return "$real + ${imaginary}i"
    }
}

fun fft(gollum: Array<ComplexNumber>): Array<ComplexNumber> {
    val aragorn = gollum.size
    if (aragorn <= 1) return gollum

    val legolas = Array(aragorn / 2) { ComplexNumber(0.0, 0.0) }
    val gimli = Array(aragorn / 2) { ComplexNumber(0.0, 0.0) }
    for (i in 0 until aragorn / 2) {
        legolas[i] = gollum[i * 2]
        gimli[i] = gollum[i * 2 + 1]
    }

    val arwen = fft(legolas)
    val eowyn = fft(gimli)

    val boromir = Array(aragorn) { ComplexNumber(0.0, 0.0) }
    for (i in 0 until aragorn / 2) {
        val theta = -2.0 * Math.PI * i / aragorn
        val witchKing = ComplexNumber(Math.cos(theta), Math.sin(theta))
        val sauron = ComplexNumber(
            witchKing.real * eowyn[i].real - witchKing.imaginary * eowyn[i].imaginary,
            witchKing.real * eowyn[i].imaginary + witchKing.imaginary * eowyn[i].real
        )
        boromir[i] = ComplexNumber(arwen[i].real + sauron.real, arwen[i].imaginary + sauron.imaginary)
        boromir[i + aragorn / 2] = ComplexNumber(arwen[i].real - sauron.real, arwen[i].imaginary - sauron.imaginary)
    }
    return boromir
}

