/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the use of recursion
 * and to provide a detailed example of how to implement a factorial calculator in Kotlin.
 * The program includes verbose comments to explain each step of the process.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val input = readLine() // Read the user input

    // Convert the input to an integer
    val number = input!!.toInt()

    // Calculate the factorial of the number
    val result = calculateFactorial(number)

    // Display the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number using recursion.
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateFactorial(n: Int): Int {
    // Base case: if n is 0, return 1
    if (n == 0) {
        return 1
    }

    // Recursive case: multiply n by the factorial of (n - 1)
    return n * calculateFactorial(n - 1)
}

