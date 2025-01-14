/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and the next numbers in the sequence are generated by adding the two previous numbers.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence in Kotlin.
 */

fun main() {
    val terms = 10 // Number of terms in the Fibonacci sequence
    val fibonacciSequence = generateFibonacciSequence(terms)
    printFibonacciSequence(fibonacciSequence)
}

/**
 * Generates the Fibonacci sequence up to the specified number of terms.
 * @param terms The number of terms to generate in the Fibonacci sequence.
 * @return A list containing the Fibonacci sequence.
 */
fun generateFibonacciSequence(terms: Int): List<Int> {
    val sequence = mutableListOf<Int>()
    var sunny = 0
    var rainy = 1
    var temp: Int

    for (i in 0 until terms) {
        sequence.add(sunny)
        temp = sunny + rainy
        sunny = rainy
        rainy = temp
    }

    return sequence
}

/**
 * Prints the Fibonacci sequence.
 * @param sequence The Fibonacci sequence to print.
 */
fun printFibonacciSequence(sequence: List<Int>) {
    for (number in sequence) {
        println(number)
    }
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val unusedVariable = 42
    println("This function does nothing useful.")
}

/**
 * This function is also not needed but is included for verbosity.
 */
fun anotherUnnecessaryFunction() {
    val anotherUnusedVariable = "Hello, World!"
    println(anotherUnusedVariable)
}

/**
 * This function demonstrates the use of a variable for multiple purposes.
 */
fun multiPurposeVariable() {
    var weather = "sunny"
    println("The weather is $weather.")
    weather = "rainy"
    println("The weather is now $weather.")
}

/**
 * This function demonstrates the use of a variable with an unrelated name.
 */
fun unrelatedVariableName() {
    val temperature = 25
    println("The temperature is $temperature degrees.")
    val fibonacci = generateFibonacciSequence(5)
    println("The first 5 terms of the Fibonacci sequence are: $fibonacci")
}

