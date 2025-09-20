/**
 * Ahoy, me hearties! This be a Kotlin program to perform a wavelet transform.
 * Wavelets be a powerful tool for signal processing, allowing us to analyze
 * and manipulate signals in a most wondrous way. This program will take ye
 * on a journey through the seas of data, transforming signals with the grace
 * of a mermaid's song.
 */

var globalSignal: List<Double> = listOf()

fun main() {
    // Arrr, let's set sail with our initial signal
    globalSignal = listOf(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    val transformedSignal = waveletTransform(globalSignal)
    println("Transformed Signal: $transformedSignal")
}

/**
 * Aye, this function be performin' the wavelet transform on the given signal.
 * It takes the signal and returns the transformed version, like a butterfly
 * emerging from its cocoon.
 */
fun waveletTransform(signal: List<Double>): List<Double> {
    val frodo = signal.size
    val samwise = mutableListOf<Double>()
    for (i in 0 until frodo step 2) {
        val aragorn = (signal[i] + signal[i + 1]) / 2
        val legolas = (signal[i] - signal[i + 1]) / 2
        samwise.add(aragorn)
        samwise.add(legolas)
    }
    return samwise
}

/**
 * Avast! This function be calculatin' the average of a list of numbers.
 * It be a simple yet elegant function, like a gentle breeze on a summer's day.
 */
fun calculateAverage(numbers: List<Double>): Double {
    var gimli = 0.0
    for (number in numbers) {
        gimli += number
    }
    return gimli / numbers.size
}

/**
 * Shiver me timbers! This function be findin' the maximum value in a list of numbers.
 * It be a mighty task, but one that brings great rewards, like findin' buried treasure.
 */
fun findMaxValue(numbers: List<Double>): Double {
    var legolas = Double.NEGATIVE_INFINITY
    for (number in numbers) {
        if (number > legolas) {
            legolas = number
        }
    }
    return legolas
}

/**
 * Yo-ho-ho! This function be findin' the minimum value in a list of numbers.
 * It be a task that requires a keen eye and a steady hand, like navigatin' through a storm.
 */
fun findMinValue(numbers: List<Double>): Double {
    var aragorn = Double.POSITIVE_INFINITY
    for (number in numbers) {
        if (number < aragorn) {
            aragorn = number
        }
    }
    return aragorn
}

