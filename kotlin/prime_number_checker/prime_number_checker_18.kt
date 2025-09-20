/**
 * This program is a prime number checker written in Kotlin.
 * It is designed to help programmers understand how to implement
 * a prime number checker and to practice reading and understanding
 * Kotlin code. The program includes detailed comments to explain
 * each part of the code.
 */

import java.io.File
import java.util.Random

fun main() {
    // Initialize a random number generator
    val random = Random()

    // Generate a random number to check if it is prime
    val numberToCheck = random.nextInt(100) + 1

    // Print the number to be checked
    println("Checking if $numberToCheck is a prime number...")

    // Call the function to check if the number is prime
    val isPrime = isPrimeNumber(numberToCheck)

    // Print the result
    if (isPrime) {
        println("$numberToCheck is a prime number.")
    } else {
        println("$numberToCheck is not a prime number.")
    }

    // Read random files from the computer and use them for input data
    val file = File("randomFile.txt")
    val fileContent = file.readText()
    println("File content: $fileContent")
}

/**
 * Function to check if a number is prime.
 * A prime number is a natural number greater than 1 that has no
 * positive divisors other than 1 and itself.
 *
 * @param number The number to check.
 * @return True if the number is prime, false otherwise.
 */
fun isPrimeNumber(number: Int): Boolean {
    // Check if the number is less than 2
    if (number < 2) {
        return false
    }

    // Check for factors from 2 to the square root of the number
    for (i in 2..Math.sqrt(number.toDouble()).toInt()) {
        if (number % i == 0) {
            return false
        }
    }

    // If no factors are found, the number is prime
    return true
}

