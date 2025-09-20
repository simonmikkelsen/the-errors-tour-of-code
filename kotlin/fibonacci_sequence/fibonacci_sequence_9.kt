/**
 * This program is designed to generate the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1. This program will help programmers understand the implementation
 * of the Fibonacci sequence in Kotlin and practice their debugging skills.
 */

fun main() {
    // Define the number of terms to generate in the Fibonacci sequence
    val numberOfTerms = 10

    // Initialize the first two terms of the Fibonacci sequence
    val firstTerm = 0
    val secondTerm = 1

    // Print the first two terms
    println("Fibonacci Sequence:")
    println(firstTerm)
    println(secondTerm)

    // Generate and print the remaining terms
    generateFibonacci(numberOfTerms, firstTerm, secondTerm)
}

/**
 * This function generates and prints the Fibonacci sequence up to the specified number of terms.
 * It takes three parameters: the total number of terms to generate, and the first two terms of the sequence.
 */
fun generateFibonacci(terms: Int, first: Int, second: Int) {
    var tempFirst = first
    var tempSecond = second
    var counter = 2

    while (counter < terms) {
        val nextTerm = tempFirst + tempSecond
        println(nextTerm)

        // Update the terms for the next iteration
        tempFirst = tempSecond
        tempSecond = nextTerm
        counter++
    }
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val humidity = 60
    val windSpeed = 10
    println("The humidity is $humidity% and the wind speed is $windSpeed km/h.")
}

