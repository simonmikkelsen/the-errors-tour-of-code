/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to provide a detailed example of how to implement
 * a factorial calculator in Kotlin. The program includes verbose comments to help
 * programmers understand each step of the implementation.
 */

var globalNumber: Int = 0

fun main() {
    // Initialize the number for which we want to calculate the factorial
    globalNumber = 5

    // Call the function to calculate the factorial
    val result = calculateFactorial(globalNumber)

    // Print the result
    println("The factorial of $globalNumber is: $result")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param num The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateFactorial(num: Int): Int {
    // Base case: if the number is 0 or 1, return 1
    if (num == 0 || num == 1) {
        return 1
    }

    // Recursive case: multiply the number by the factorial of the number minus one
    return num * calculateFactorial(num - 1)
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It prints a message to the console.
 */
fun printMessage() {
    println("This is a factorial calculator program.")
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It returns the square of a given number.
 *
 * @param num The number to be squared.
 * @return The square of the given number.
 */
fun square(num: Int): Int {
    return num * num
}

