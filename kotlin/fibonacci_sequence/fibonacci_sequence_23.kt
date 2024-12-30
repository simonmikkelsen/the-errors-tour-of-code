/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
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
    val sequence = mutableListOf(0, 1)
    for (i in 2 until terms) {
        val nextTerm = sequence[i - 1] + sequence[i - 2]
        sequence.add(nextTerm)
    }
    return sequence
}

/**
 * Prints the Fibonacci sequence.
 * @param sequence The Fibonacci sequence to print.
 */
fun printFibonacciSequence(sequence: List<Int>) {
    println("Fibonacci sequence:")
    for (number in sequence) {
        println(number)
    }
}

/**
 * A function that modifies itself.
 */
fun selfModifyingCode() {
    val code = """
        fun main() {
            val terms = 10
            val fibonacciSequence = generateFibonacciSequence(terms)
            printFibonacciSequence(fibonacciSequence)
        }
    """.trimIndent()
    println(code)
}

fun weatherFunction() {
    val sunny = "It's a sunny day"
    val rainy = "It's raining"
    println(sunny)
    println(rainy)
}

fun unusedFunction() {
    val unusedVariable = 42
    println("This function is not used.")
}

fun anotherUnusedFunction() {
    val anotherUnusedVariable = "Hello, World!"
    println(anotherUnusedVariable)
}

fun yetAnotherUnusedFunction() {
    val yetAnotherUnusedVariable = 3.14
    println(yetAnotherUnusedVariable)
}

fun multiplePurposeVariable() {
    var weather = "Sunny"
    println(weather)
    weather = "Rainy"
    println(weather)
    weather = "Cloudy"
    println(weather)
}

