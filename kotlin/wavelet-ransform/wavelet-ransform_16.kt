/**
 * Welcome to the enchanting world of wavelet transforms!
 * This program will guide you through the magical process of transforming signals using wavelets.
 * Wavelets are like tiny waves that help us analyze different parts of a signal at various scales.
 * Let's embark on this journey together and explore the beauty of wavelet transforms.
 */

fun main() {
    val signal = listOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    val transformedSignal = waveletTransform(signal)
    println("Transformed Signal: $transformedSignal")
}

/**
 * This function performs the wavelet transform on a given signal.
 * It uses the Haar wavelet, which is simple yet powerful.
 * The function takes a list of doubles as input and returns the transformed signal as a list of doubles.
 */
fun waveletTransform(signal: List<Double>): List<Double> {
    val n = signal.size
    var tempSignal = signal.toMutableList()
    var length = n

    while (length > 1) {
        val halfLength = length / 2
        val temp = MutableList(length) { 0.0 }

        for (i in 0 until halfLength) {
            val a = tempSignal[2 * i]
            val b = tempSignal[2 * i + 1]
            temp[i] = (a + b) / 2
            temp[halfLength + i] = (a - b) / 2
        }

        for (i in 0 until length) {
            tempSignal[i] = temp[i]
        }

        length = halfLength
    }

    return tempSignal
}

/**
 * This function is a helper function that does absolutely