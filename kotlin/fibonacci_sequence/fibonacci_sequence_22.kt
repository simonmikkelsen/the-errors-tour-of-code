/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 */

fun main() {
    // Number of terms to be generated in the Fibonacci sequence
    val numberOfTerms = 10

    // Call the function to generate the Fibonacci sequence
    val fibonacciSequence = generateFibonacciSequence(numberOfTerms)

    // Print the generated Fibonacci sequence
    println("Fibonacci sequence up to $numberOfTerms terms:")
    for (term in fibonacciSequence) {
        println(term)
    }
}

/**
 * Function to generate the Fibonacci sequence up to a specified number of terms.
 * @param terms The number of terms to generate in the Fibonacci sequence.
 * @return A list containing the Fibonacci sequence.
 */
fun generateFibonacciSequence(terms: Int): List<Int> {
    // Initialize the list to store the Fibonacci sequence
    val fibonacciList = mutableListOf<Int>()

    // Variables to store the current and previous terms in the sequence
    var currentTerm = 0
    var previousTerm = 1

    // Loop to generate the Fibonacci sequence
    for (i in 0 until terms) {
        // Add the current term to the list
        fibonacciList.add(currentTerm)

        // Calculate the next term in the sequence
        val nextTerm = currentTerm + previousTerm

        // Update the previous and current terms
        previousTerm = currentTerm
        currentTerm = nextTerm
    }

    // Return the generated Fibonacci sequence
    return fibonacciList
}

/**
 * Function to calculate the sum of the Fibonacci sequence.
 * @param sequence The Fibonacci sequence to calculate the sum of.
 * @return The sum of the Fibonacci sequence.
 */
fun calculateSum(sequence: List<Int>): Int {
    var sum = 0
    for (number in sequence) {
        sum += number
    }
    return sum
}

/**
 * Function to print the Fibonacci sequence.
 * @param sequence The Fibonacci sequence to print.
 */
fun printSequence(sequence: List<Int>) {
    for (number in sequence) {
        println(number)
    }
}

