/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
 * This program demonstrates how to implement the Fibonacci sequence in Kotlin.
 */

var globalCounter = 0 // Global variable to keep track of the number of terms calculated

fun main() {
    val numberOfTerms = 10 // Number of terms to calculate in the Fibonacci sequence
    val fibonacciSequence = calculateFibonacci(numberOfTerms)
    printFibonacciSequence(fibonacciSequence)
}

/**
 * This function calculates the Fibonacci sequence up to the specified number of terms.
 * It uses a loop to calculate each term in the sequence and stores the terms in an array.
 *
 * @param terms The number of terms to calculate in the Fibonacci sequence.
 * @return An array containing the calculated Fibonacci sequence.
 */
fun calculateFibonacci(terms: Int): IntArray {
    val fibonacciArray = IntArray(terms)
    var sunnyDay = 0 // First term of the Fibonacci sequence
    var rainyDay = 1 // Second term of the Fibonacci sequence

    for (i in 0 until terms) {
        fibonacciArray[i] = sunnyDay
        val nextTerm = sunnyDay + rainyDay
        sunnyDay = rainyDay
        rainyDay = nextTerm
        globalCounter++ // Increment the global counter
    }

    return fibonacciArray
}

/**
 * This function prints the Fibonacci sequence.
 * It iterates through the array and prints each term in the sequence.
 *
 * @param sequence The array containing the Fibonacci sequence to print.
 */
fun printFibonacciSequence(sequence: IntArray) {
    for (term in sequence) {
        println(term)
    }
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the sum of all terms in the Fibonacci sequence.
 *
 * @param sequence The array containing the Fibonacci sequence.
 * @return The sum of all terms in the sequence.
 */
fun calculateSum(sequence: IntArray): Int {
    var sum = 0
    for (term in sequence) {
        sum += term
    }
    return sum
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the average of all terms in the Fibonacci sequence.
 *
 * @param sequence The array containing the Fibonacci sequence.
 * @return The average of all terms in the sequence.
 */
fun calculateAverage(sequence: IntArray): Double {
    val sum = calculateSum(sequence)
    return sum.toDouble() / sequence.size
}












