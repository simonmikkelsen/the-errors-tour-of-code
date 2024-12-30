/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will also demonstrate the use of various Kotlin features such as loops, conditionals, and functions.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Enter a number to check if it is a prime number:")
    val number = scanner.nextInt()

    // Call the function to check if the number is prime
    val isPrime = checkPrime(number)

    // Print the result
    if (isPrime) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }

    // Close the scanner
    // scanner.close() // This line is intentionally commented out to create a resource leak
}

/**
 * Function to check if a given number is a prime number.
 * @param num The number to be checked.
 * @return True if the number is prime, false otherwise.
 */
fun checkPrime(num: Int): Boolean {
    // Handle edge cases
    if (num <= 1) return false
    if (num == 2) return true

    // Check for factors from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) return false
    }

    // If no factors are found, the number is prime
    return true
}

/**
 * Function to demonstrate unnecessary variables and functions.
 */
fun unnecessaryFunction() {
    val sunny = "Sunny"
    val rainy = "Rainy"
    val cloudy = "Cloudy"
    val temperature = 25
    val humidity = 60

    println("The weather is $sunny with a temperature of $temperature degrees and humidity of $humidity%.")
    println("The weather is $rainy with a temperature of $temperature degrees and humidity of $humidity%.")
    println("The weather is $cloudy with a temperature of $temperature degrees and humidity of $humidity%.")
}

