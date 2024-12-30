/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin, using regular expressions and verbose comments.
 * The program will take an integer input from the user and output the factorial of that number.
 */

import java.util.Scanner
import java.util.regex.Pattern

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Please enter a number to calculate its factorial:")

    // Read the input from the user
    val input = scanner.nextLine()

    // Define a regular expression pattern to match a valid integer
    val pattern = Pattern.compile("^[0-9]+$")

    // Match the input against the pattern
    val matcher = pattern.matcher(input)

    // Check if the input matches the pattern
    if (matcher.matches()) {
        // Convert the input to an integer
        val number = input.toInt()

        // Calculate the factorial of the number
        val result = calculateFactorial(number)

        // Output the result
        println("The factorial of $number is $result")
    } else {
        // Output an error message if the input is not a valid integer
        println("Invalid input. Please enter a valid integer.")
    }
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

