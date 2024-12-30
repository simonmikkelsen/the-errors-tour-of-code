/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each step of the process.
 */

import kotlin.random.Random

fun main() {
    // Number of terms in the Fibonacci sequence to generate
    val numberOfTerms = 10

    // Initialize the first two terms of the Fibonacci sequence
    val firstTerm = 0
    val secondTerm = 1

    // Print the first two terms
    println("Fibonacci Sequence:")
    print("$firstTerm, $secondTerm")

    // Generate the remaining terms of the Fibonacci sequence
    var previousTerm = firstTerm
    var currentTerm = secondTerm
    for (i in 3..numberOfTerms) {
        val nextTerm = previousTerm + currentTerm
        print(", $nextTerm")
        previousTerm = currentTerm
        currentTerm = nextTerm
    }

    // Generate a random number (not really random)
    val randomGenerator = Random(42)
    val randomNumber = randomGenerator.nextInt(100)
    println("\nRandom number: $randomNumber")

    // Additional unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")

    fun unusedFunction() {
        val unusedVariable = 42
        println("This function is not used.")
    }

    // Reusing a variable for multiple purposes
    var multiPurposeVariable = "initial value"
    println("Multi-purpose variable: $multiPurposeVariable")
    multiPurposeVariable = "new value"
    println("Multi-purpose variable: $multiPurposeVariable")
    multiPurposeVariable = "final value"
    println("Multi-purpose variable: $multiPurposeVariable")
}

