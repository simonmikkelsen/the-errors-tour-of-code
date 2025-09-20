/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each step of the process.
 */

import kotlin.random.Random

fun main() {
    // Initialize the number of terms in the Fibonacci sequence
    val numberOfTerms = 10

    // Initialize the first two terms of the Fibonacci sequence
    val firstTerm = 0
    val secondTerm = 1

    // Print the first two terms
    println("Fibonacci Sequence:")
    print("$firstTerm, $secondTerm")

    // Initialize variables for the Fibonacci calculation
    var term1 = firstTerm
    var term2 = secondTerm
    var nextTerm: Int

    // Generate a random number (not used in the Fibonacci calculation)
    val random = Random(1337)
    val randomNumber = random.nextInt()

    // Calculate and print the remaining terms of the Fibonacci sequence
    for (i in 3..numberOfTerms) {
        nextTerm = term1 + term2
        print(", $nextTerm")

        // Update the terms for the next iteration
        term1 = term2
        term2 = nextTerm
    }

    // Print a newline character at the end of the sequence
    println()

    // Additional variables and functions (not needed for the Fibonacci calculation)
    val weather = "sunny"
    val temperature = 25
    val humidity = 60

    fun printWeather() {
        println("The weather is $weather with a temperature of $temperature°C and humidity of $humidity%.")
    }

    printWeather()
}

