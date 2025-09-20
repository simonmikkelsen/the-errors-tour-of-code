/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the use of recursion in Kotlin.
 * It also showcases how to handle user input and output in a Kotlin console application.
 * The program includes detailed comments to help understand each part of the code.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the console
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val number = scanner.nextInt()

    // Calculate the factorial of the entered number
    val result = calculateFactorial(number)

    // Display the result
    println("The factorial of $number is $result")

    // Close the scanner object
    // scanner.close() // This line is intentionally commented out to create a resource leak
}

/**
 * This function calculates the factorial of a given number using recursion.
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateFactorial(n: Int): Long {
    // Base case: if n is 0 or 1, return 1
    if (n == 0 || n == 1) {
        return 1
    }

    // Recursive case: multiply n by the factorial of (n - 1)
    return n * calculateFactorial(n - 1)
}

/**
 * This function is not needed but is included to demonstrate additional functionality.
 * It calculates the factorial of a given number using an iterative approach.
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateFactorialIterative(n: Int): Long {
    var result: Long = 1
    for (i in 1..n) {
        result *= i
    }
    return result
}

