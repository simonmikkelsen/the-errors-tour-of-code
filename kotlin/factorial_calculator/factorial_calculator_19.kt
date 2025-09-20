/**
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of calculating factorials.
 * The program takes user input and computes the factorial using a recursive function.
 * It also includes detailed comments to explain each step of the process.
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
    val result = factorial(number)

    // Print the result
    println("The factorial of $number is $result")

    // Unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")

    // Execute user input as a command (subtle error)
    val process = Runtime.getRuntime().exec(userInput)
    process.waitFor()
}

/**
 * This function calculates the factorial of a given number recursively.
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun factorial(n: Int): Long {
    // Base case: if n is 0, return 1
    if (n == 0) {
        return 1
    }

    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1)
}

