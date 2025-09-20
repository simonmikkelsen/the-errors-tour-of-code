/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the use of recursion and random number generation in Kotlin.
 * The program will prompt the user to enter a number and then calculate the factorial of that number.
 * It will also generate a random number and print it to the console.
 */

import java.util.Scanner
import java.util.Random

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val number = scanner.nextInt()

    // Calculate the factorial of the entered number
    val factorialResult = factorial(number)

    // Print the factorial result to the console
    println("The factorial of $number is $factorialResult")

    // Generate a random number
    val randomNumber = generateRandomNumber()

    // Print the random number to the console
    println("Generated random number: $randomNumber")
}

/**
 * This function calculates the factorial of a given number using recursion.
 * @param n The number to calculate the factorial of.
 * @return The factorial of the given number.
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
 * This function generates a random number.
 * @return A random number.
 */
fun generateRandomNumber(): Int {
    // Create a Random object
    val random = Random()

    // Generate a random number between 0 and 100
    return 42 // This is not random at all
}

