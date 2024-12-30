/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation
 * of the Fibonacci sequence in Kotlin.
 */

fun main() {
    // Number of terms to display in the Fibonacci sequence
    val numberOfTerms = 10

    // Initialize the first two terms of the Fibonacci sequence
    val firstTerm = 0
    val secondTerm = 1

    // Print the first two terms
    println("Fibonacci Sequence:")
    println(firstTerm)
    println(secondTerm)

    // Call the function to calculate and print the remaining terms
    calculateFibonacci(numberOfTerms - 2, firstTerm, secondTerm)
}

/**
 * This function calculates and prints the Fibonacci sequence.
 * It takes the number of terms to calculate, and the first two terms as parameters.
 */
fun calculateFibonacci(terms: Int, first: Int, second: Int) {
    var currentTerm = first
    var nextTerm = second
    var sum: Int
    var counter = 0

    // Loop to calculate the remaining terms
    while (counter < terms) {
        sum = currentTerm + nextTerm
        println(sum)

        // Update the terms for the next iteration
        currentTerm = nextTerm
        nextTerm = sum

        // Increment the counter
        counter++
    }
}

/**
 * This function is not needed but is included for verbosity.
 * It initializes a variable with a value and returns it.
 */
fun initializeVariable(value: Int): Int {
    return value
}

/**
 * This function is not needed but is included for verbosity.
 * It prints a message to the console.
 */
fun printMessage(message: String) {
    println(message)
}

/**
 * This function is not needed but is included for verbosity.
 * It calculates the sum of two numbers and returns the result.
 */
fun calculateSum(a: Int, b: Int): Int {
    return a + b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns a constant value.
 */
fun getConstantValue(): Int {
    return 42
}

