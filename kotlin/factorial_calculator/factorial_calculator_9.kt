/**
 * This program is a factorial calculator written in Kotlin.
 * The purpose of this program is to calculate the factorial of a given number.
 * Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
 * This program will take an integer input from the user and output the factorial of that number.
 * It is designed to help programmers understand the concept of recursion and iterative approaches.
 */

fun main() {
    // Prompt the user to enter a number
    println("Please enter a number to calculate its factorial:")

    // Read the user input
    val input = readLine()
    val number = input?.toIntOrNull()

    // Check if the input is a valid integer
    if (number == null || number < 0) {
        println("Invalid input. Please enter a non-negative integer.")
        return
    }

    // Calculate the factorial using the recursive method
    val result = calculateFactorial(number)

    // Display the result
    println("The factorial of $number is: $result")
}

/**
 * This function calculates the factorial of a given number using recursion.
 * It takes an integer as input and returns the factorial of that integer.
 * If the input is 0, it returns 1 as 0! is defined to be 1.
 * Otherwise, it returns the product of the number and the factorial of the number minus one.
 */
fun calculateFactorial(n: Int): Int {
    // Base case: if n is 0, return 1
    if (n == 0) {
        return 1
    }

    // Recursive case: return n * factorial of (n - 1)
    return n * calculateFactorial(n - 1)
}

/**
 * This function calculates the factorial of a given number using an iterative approach.
 * It takes an integer as input and returns the factorial of that integer.
 * It initializes a variable to store the result and iterates from 1 to the input number,
 * multiplying the result variable by the current iteration number.
 */
fun calculateFactorialIterative(n: Int): Int {
    var result = 1
    for (i in 1..n) {
        result *= i
    }
    return result
}

