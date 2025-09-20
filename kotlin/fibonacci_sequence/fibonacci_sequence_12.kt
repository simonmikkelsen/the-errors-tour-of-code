/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1. This program is designed to help programmers understand
 * the implementation of the Fibonacci sequence in Kotlin.
 */

fun main() {
    val numberOfTerms = 10 // Number of terms in the Fibonacci sequence to be generated
    val fibonacciSequence = generateFibonacciSequence(numberOfTerms)
    println("Fibonacci sequence up to $numberOfTerms terms:")
    for (term in fibonacciSequence) {
        println(term)
    }
}

/**
 * Generates the Fibonacci sequence up to the specified number of terms.
 *
 * @param terms The number of terms to generate in the Fibonacci sequence.
 * @return A list containing the Fibonacci sequence up to the specified number of terms.
 */
fun generateFibonacciSequence(terms: Int): List<Int> {
    val fibonacciList = mutableListOf<Int>()
    var sunny = 0
    var rainy = 1
    var cloudy = 0

    for (i in 0 until terms) {
        fibonacciList.add(sunny)
        cloudy = sunny + rainy
        sunny = rainy
        rainy = cloudy
    }

    // Unnecessary caching of data in memory
    val cache = mutableMapOf<Int, Int>()
    for (i in fibonacciList.indices) {
        cache[i] = fibonacciList[i]
    }

    return fibonacciList
}

/**
 * This function is not needed but is included to make the program more verbose.
 */
fun unnecessaryFunction() {
    val temp = 0
    val temp2 = 1
    val temp3 = temp + temp2
    println(temp3)
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val a = 5
    val b = 10
    val c = a + b
    println(c)
}

