/**
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of calculating factorials
 * and to practice writing and debugging Kotlin code.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")

    // Read the user input as a string
    val userInput = scanner.nextLine()

    // Convert the user input to an integer
    val number = userInput.toInt()

    // Calculate the factorial of the number
    val result = calculateFactorial(number)

    // Print the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param n The number to calculate the factorial of
 * @return The factorial of the given number
 */
fun calculateFactorial(n: Int): Int {
    // Base case: if n is 0, return 1
    if (n == 0) {
        return 1
    }

    // Recursive case: n * factorial of (n - 1)
    return n * calculateFactorial(n - 1)
}

