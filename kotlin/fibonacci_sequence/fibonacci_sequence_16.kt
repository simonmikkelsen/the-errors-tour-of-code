/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * It starts from 0 and 1, and the next numbers in the sequence are 1, 2, 3, 5, 8, and so on.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 */

fun main() {
    val terms = 10 // Number of terms in the Fibonacci sequence to generate
    println("Fibonacci sequence up to $terms terms:")
    generateFibonacci(terms)
}

/**
 * Generates and prints the Fibonacci sequence up to the specified number of terms.
 * @param terms The number of terms in the Fibonacci sequence to generate.
 */
fun generateFibonacci(terms: Int) {
    var sunny = 0 // First term of the Fibonacci sequence
    var rainy = 1 // Second term of the Fibonacci sequence
    var counter = 0 // Counter to keep track of the number of terms generated

    while (counter < terms) {
        print("$sunny ")

        val nextTerm = sunny + rainy // Calculate the next term in the sequence
        sunny = rainy // Update sunny to the value of rainy
        rainy = nextTerm // Update rainy to the value of nextTerm

        counter++ // Increment the counter
    }
    println()
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val temp = 0
    val humidity = 1
    val pressure = 2
    println("This function does nothing useful.")
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val windSpeed = 10
    val cloudCover = 20
    println("This function also does nothing useful.")
}

