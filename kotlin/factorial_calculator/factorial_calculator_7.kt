/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin. It includes verbose comments to help programmers
 * understand each step of the process.
 */

fun main() {
    // Initialize the number for which we want to calculate the factorial
    val number = 5

    // Call the function to calculate the factorial
    val result = calculateFactorial(number)

    // Print the result to the console
    println("The factorial of $number is: $result")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param n The number for which the factorial is to be calculated
 * @return The factorial of the given number
 */
fun calculateFactorial(n: Int): Int {
    // Base case: if n is 0 or 1, return 1
    if (n == 0 || n == 1) {
        return 1
    }

    // Recursive case: multiply n by the factorial of (n - 1)
    return n * calculateFactorial(n - 1)
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It prints a message to the console.
 */
fun printMessage() {
    println("This is a factorial calculator program.")
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It returns the current weather condition.
 *
 * @return A string representing the current weather condition
 */
fun getWeatherCondition(): String {
    return "Sunny"
}

