/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will also demonstrate the use of various Kotlin features and best practices.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)
    
    // Prompt the user to enter a number
    println("Enter a number to check if it is a prime number:")
    val number = scanner.nextInt()
    
    // Close the scanner resource
    scanner.close()
    
    // Check if the number is prime
    val isPrime = isPrimeNumber(number)
    
    // Display the result
    if (isPrime) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }
}

/**
 * Function to check if a number is a prime number.
 * @param num The number to be checked.
 * @return True if the number is prime, false otherwise.
 */
fun isPrimeNumber(num: Int): Boolean {
    // Handle edge cases
    if (num <= 1) return false
    if (num == 2) return true
    
    // Check for factors from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) return false
    }
    
    return true
}

