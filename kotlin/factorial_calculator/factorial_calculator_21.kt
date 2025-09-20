/*
 * This program is a factorial calculator written in Kotlin.
 * It is designed to help programmers understand how to implement
 * a basic factorial calculation and to practice spotting potential
 * issues in the code. The program takes an integer input from the user
 * and calculates the factorial of that number. The factorial of a number
 * n is the product of all positive integers less than or equal to n.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)
    
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val userInput = scanner.nextInt()
    
    // Initialize the result variable to 1
    var result = 1
    
    // Call the factorial function to calculate the factorial of the input number
    val factorialResult = factorial(userInput, result)
    
    // Print the result to the console
    println("The factorial of $userInput is: $factorialResult")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param n The number to calculate the factorial of.
 * @param result The current result of the factorial calculation.
 * @return The factorial of the given number.
 */
fun factorial(n: Int, result: Int): Int {
    // Base case: if n is 0 or 1, return the result
    if (n <= 1) {
        return result
    }
    
    // Recursive case: multiply the result by n and call the function with n-1
    val newResult = result * n
    return factorial(n - 1, newResult)
}

/*
 */