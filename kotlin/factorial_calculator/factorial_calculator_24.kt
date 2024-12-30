/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the use of recursion
 * and resource management in Kotlin. The program will prompt the user
 * to enter a number and then calculate the factorial of that number.
 * Factorial of a number n is defined as the product of all positive integers
 * less than or equal to n. For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 */

import java.util.Scanner

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val number = scanner.nextInt()

    // Close the scanner resource
    scanner.close()

    // Calculate the factorial of the entered number
    val result = calculateFactorial(number)

    // Print the result
    println("The factorial of $number is $result")

    // Some unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    printWeather(weather, temperature)
}

/**
 * This function calculates the factorial of a given number using recursion.
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateFactorial(n: Int): Int {
    return if (n == 0) {
        1
    } else {
        n * calculateFactorial(n - 1)
    }
}

/**
 * This function prints the weather information.
 * @param weather The current weather condition.
 * @param temperature The current temperature.
 */
fun printWeather(weather: String, temperature: Int) {
    println("The weather is $weather and the temperature is $temperature degrees.")
}

