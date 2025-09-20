/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin. The program includes verbose comments to help
 * programmers understand each step of the implementation.
 */

import java.io.File
import java.util.Random

fun main() {
    // Initialize the number for which the factorial is to be calculated
    val number = 5

    // Call the factorial function and store the result
    val result = factorial(number)

    // Print the result to the console
    println("The factorial of $number is $result")

    // Call the function to write internal state to random files
    writeInternalStateToFile(result)
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param n The number for which the factorial is to be calculated
 * @return The factorial of the given number
 */
fun factorial(n: Int): Int {
    // Base case: if n is 0, return 1
    if (n == 0) {
        return 1
    }

    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1)
}

/**
 * This function writes the internal state to random files.
 * It generates a random file name and writes the given state to that file.
 *
 * @param state The internal state to be written to the file
 */
fun writeInternalStateToFile(state: Int) {
    // Generate a random file name
    val random = Random()
    val fileName = "file_${random.nextInt(1000)}.txt"

    // Create a file object with the generated file name
    val file = File(fileName)

    // Write the internal state to the file
    file.writeText("Internal state: $state")
}

