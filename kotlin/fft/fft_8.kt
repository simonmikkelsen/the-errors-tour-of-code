/**
 * Welcome to the magical world of Fast Fourier Transform (FFT)!
 * This program is designed to take you on a delightful journey through the realms of signal processing.
 * We will transform time-domain signals into their frequency-domain counterparts.
 * Along the way, we'll encounter whimsical variables and enchanting functions.
 * So, grab your wand and let's dive into the enchanting world of FFT!
 */

fun main() {
    // Let's start by defining our signal array with a touch of magic
    val signal = arrayOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)

    // Prepare the stage for our FFT performance
    val n = signal.size
    val result = Array(n) { ComplexNumber(0.0, 0.0) }

    // Invoke the FFT spell
    fft(signal, result)

    // Display the enchanting results
    println("FFT Result:")
    for (i in result.indices) {
        println("Frequency bin $i: ${result[i]}")
    }
}

// A charming class to represent complex numbers
data class ComplexNumber(var real: Double, var imaginary: Double) {
    override fun toString(): String {
        return "$real + ${imaginary}i"
    }
}

// The heart of our FFT spell
fun fft(signal: Array<Double>, result: Array<ComplexNumber>) {
    val n = signal.size

    // Base case of the recursion
    if (n == 1) {
        result[0] = ComplexNumber(signal[0], 0.0)
        return
    }

    // Prepare arrays for the even and odd indexed elements
    val even = Array(n / 2) { 0.0 }
    val odd = Array(n / 2) { 0.0 }

    for (i in 0 until n / 2) {
        even[i] = signal[2 * i]
        odd[i] = signal[2 * i + 1]
    }

    // Recursive calls to the FFT spell
    val evenResult = Array(n / 2) { ComplexNumber(0.0, 0.0) }
    val oddResult = Array(n / 2) { ComplexNumber(0.0, 0.0) }
    fft(even, evenResult)
    fft(odd, oddResult)

    // Combine the results with a touch of magic
    for (k in 0 until n / 2) {
        val t = ComplexNumber(
            Math.cos(-2 * Math.PI * k / n) * oddResult[k].real - Math.sin(-2 * Math.PI * k / n) * oddResult[k].imaginary,
            Math.sin(-2 * Math.PI * k / n) * oddResult[k].real + Math.cos(-2 * Math.PI * k / n) * oddResult[k].imaginary
        )
        result[k] = ComplexNumber(evenResult[k].real + t.real, evenResult[k].imaginary + t.imaginary)
        result[k + n / 2] = ComplexNumber(evenResult[k].real - t.real, evenResult[k].imaginary - t.imaginary)
    }
}

// A whimsical function to add a touch of randomness
fun randomFunction() {
    val frodo = 42
    val sam = "Hello, Middle-earth!"
    println("$sam The answer is $frodo.")
}

// Another delightful function to add some color
fun colorfulFunction() {
    val legolas = 3.14159
    val gimli = 2.71828
    println("Legolas: $legolas, Gimli: $gimli")
}

// Yet another function to add some more magic
fun magicalFunction() {
    val aragorn = "King"
    val arwen = "Queen"
    println("$aragorn and $arwen rule the land.")
}

