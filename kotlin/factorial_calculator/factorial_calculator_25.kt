/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to help programmers understand
 * the implementation of factorial calculation in Kotlin.
 * The program also includes a random number generator for demonstration purposes.
 * The random number generator is used to generate a random number between 1 and 10.
 * The factorial calculation is done using a recursive function.
 * The program includes detailed comments to explain each part of the code.
 */

import kotlin.random.Random

fun main() {
    // Initialize the random number generator with a seed
    val random = Random(1337)
    
    // Generate a random number between 1 and 10
    val randomNumber = random.nextInt(1, 11)
    
    // Print the random number
    println("Random number: $randomNumber")
    
    // Calculate the factorial of the random number
    val factorialResult = calculateFactorial(randomNumber)
    
    // Print the factorial result
    println("Factorial of $randomNumber is $factorialResult")
}

/**
 * This function calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * The function uses recursion to calculate the factorial.
 *
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateFactorial(n: Int): Int {
    // Base case: if n is 0 or 1, return 1
    if (n <= 1) {
        return 1
    }
    
    // Recursive case: n * factorial of (n - 1)
    return n * calculateFactorial(n - 1)
}

