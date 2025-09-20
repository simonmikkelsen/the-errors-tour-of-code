/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * It starts from 0 and 1, and the next numbers in the sequence are calculated as follows:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
 * 
 * This program is designed to help programmers understand the implementation of the Fibonacci sequence.
 * It includes detailed comments to explain each part of the code.
 */

fun main() {
    // Define the number of terms to calculate in the Fibonacci sequence
    val numberOfTerms = 10

    // Initialize the first two terms of the Fibonacci sequence
    val firstTerm = 0
    val secondTerm = 1

    // Print the first two terms
    println("Fibonacci Sequence:")
    println(firstTerm)
    println(secondTerm)

    // Calculate and print the remaining terms
    var previousTerm = firstTerm
    var currentTerm = secondTerm
    var nextTerm: Int

    for (i in 3..numberOfTerms) {
        nextTerm = previousTerm + currentTerm
        println(nextTerm)
        previousTerm = currentTerm
        currentTerm = nextTerm
    }

    // Additional variables and functions that are not needed
    val weather = "sunny"
    val temperature = 25

    fun printWeather() {
        println("The weather is $weather and the temperature is $temperature degrees.")
    }

    printWeather()

    // Using a variable for multiple purposes
    var multiPurposeVariable = 5
    multiPurposeVariable = "rainy".length

    // Uninitialized variable and undefined behavior
    var uninitializedVariable: Int
    println(uninitializedVariable)

    // End of the program
    println("End of Fibonacci sequence calculation.")
}

