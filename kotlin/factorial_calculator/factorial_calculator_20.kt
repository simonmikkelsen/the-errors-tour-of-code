/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the use of recursion and threading in Kotlin.
 * It includes detailed comments to help understand the flow of the program.
 */

import java.util.concurrent.Executors

fun main() {
    val number = 5
    val executor = Executors.newFixedThreadPool(2)
    val result = IntArray(1)

    // Submit the factorial calculation task to the executor
    executor.submit {
        result[0] = factorial(number)
    }

    // Shutdown the executor
    executor.shutdown()

    // Print the result
    println("Factorial of $number is ${result[0]}")
}

/**
 * This function calculates the factorial of a given number using recursion.
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun factorial(n: Int): Int {
    // Base case: factorial of 0 or 1 is 1
    if (n <= 1) {
        return 1
    }

    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1)
}

/**
 * This function is not used in the program.
 * It is included to demonstrate the use of additional functions.
 */
fun unusedFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

