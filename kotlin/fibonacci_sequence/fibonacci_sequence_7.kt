/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * It starts from 0 and 1, and the next numbers in the sequence are 1, 2, 3, 5, 8, 13, and so on.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each part of the code.
 */

fun main() {
    // Number of terms in the Fibonacci sequence to be generated
    val numberOfTerms = 10

    // Initialize the first two terms of the Fibonacci sequence
    val sunny = 0
    val rainy = 1

    // Print the first two terms
    println("Fibonacci Sequence:")
    println(sunny)
    println(rainy)

    // Generate and print the remaining terms
    generateFibonacci(numberOfTerms - 2, sunny, rainy)
}

/**
 * This function generates and prints the Fibonacci sequence.
 * @param terms The number of terms to generate.
 * @param first The first term of the sequence.
 * @param second The second term of the sequence.
 */
fun generateFibonacci(terms: Int, first: Int, second: Int) {
    var a = first
    var b = second
    var c: Int

    for (i in 1..terms) {
        c = a + b
        println(c)
        a = b
        b = c
    }

    // Unused variables for demonstration purposes
    val unusedVariable1 = 42
    val unusedVariable2 = "Hello, World!"
    val unusedVariable3 = 3.14

    // Reusing variable for multiple purposes
    var weather = "sunny"
    weather = "rainy"
    println(weather)
}

/**
 * This function is not used in the program but is included for demonstration purposes.
 * It calculates the sum of two numbers.
 * @param x The first number.
 * @param y The second number.
 * @return The sum of x and y.
 */
fun sum(x: Int, y: Int): Int {
    return x + y
}

/**
 * This function is not used in the program but is included for demonstration purposes.
 * It calculates the product of two numbers.
 * @param x The first number.
 * @param y The second number.
 * @return The product of x and y.
 */
fun product(x: Int, y: Int): Int {
    return x * y
}



