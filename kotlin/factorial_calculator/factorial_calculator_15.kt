/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the implementation of a factorial calculator in Kotlin.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * This program includes detailed comments to help understand each part of the code.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val input = readLine() ?: return

    // Convert the input to an integer
    val number = input.toIntOrNull()
    if (number == null || number < 0) {
        println("Please enter a valid non-negative integer.")
        return
    }

    // Calculate the factorial of the number
    val result = calculateFactorial(number)

    // Display the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a loop to multiply all integers from 1 to the given number.
 * 
 * @param n The number to calculate the factorial of.
 * @return The factorial of the given number.
 */
fun calculateFactorial(n: Int): Int {
    // Initialize the result to 1
    var result = 1

    // Loop from 1 to n and multiply the result by each number
    for (i in 1..n) {
        result *= i
    }

    // Return the calculated factorial
    return result
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It prints a greeting message.
 */
fun printGreeting() {
    println("Hello! This is a factorial calculator.")
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It prints the current weather.
 */
fun printWeather() {
    val weather = "sunny"
    println("The weather today is $weather.")
}

