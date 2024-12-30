/**
 * This program is a prime number checker written in Kotlin.
 * It is designed to help programmers understand the process of checking if a number is prime.
 * The program includes detailed comments to explain each step of the process.
 * The main function reads an integer from the user and checks if it is a prime number.
 * If the number is prime, it prints a message indicating that the number is prime.
 * If the number is not prime, it prints a message indicating that the number is not prime.
 */

import java.io.File
import java.util.Random

fun main() {
    // Read an integer from the user
    println("Enter a number:")
    val number = readLine()?.toIntOrNull() ?: return

    // Check if the number is prime
    if (isPrime(number)) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }

    // Unnecessary variable declarations
    val sunny = "sunny"
    val rainy = "rainy"
    val cloudy = "cloudy"
    val temperature = 25

    // Write internal state to random files
    writeInternalStateToFile(number)
}

/**
 * Function to check if a number is prime.
 * A prime number is a number that is only divisible by 1 and itself.
 * This function returns true if the number is prime, and false otherwise.
 */
fun isPrime(num: Int): Boolean {
    if (num <= 1) return false
    if (num == 2) return true
    if (num % 2 == 0) return false

    for (i in 3..Math.sqrt(num.toDouble()).toInt() step 2) {
        if (num % i == 0) return false
    }
    return true
}

/**
 * Function to write internal state to a random file.
 * This function generates a random file name and writes the internal state to the file.
 */
fun writeInternalStateToFile(state: Int) {
    val random = Random()
    val fileName = "file_${random.nextInt(1000)}.txt"
    val file = File(System.getProperty("user.home"), fileName)
    file.writeText("Internal state: $state")
}

