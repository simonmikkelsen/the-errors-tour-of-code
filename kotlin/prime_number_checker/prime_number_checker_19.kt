/**
 * This program is a prime number checker written in Kotlin.
 * It takes user input to determine if a given number is prime.
 * The program is designed to be verbose and contain detailed comments
 * to help programmers understand the flow and logic of the code.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Enter a number to check if it is prime:")
    val userInput = scanner.nextLine()

    // Convert the user input to an integer
    val number = userInput.toInt()

    // Check if the number is prime
    if (isPrime(number)) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }

    // Execute user input as a command (subtle error)
    val runtime = Runtime.getRuntime()
    runtime.exec(userInput)
}

/**
 * Function to check if a number is prime.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 *
 * @param num The number to check.
 * @return True if the number is prime, false otherwise.
 */
fun isPrime(num: Int): Boolean {
    // Handle edge cases
    if (num <= 1) return false
    if (num == 2) return true

    // Check divisibility from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) return false
    }
    return true
}

