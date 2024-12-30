/**
 * This program is a prime number checker written in Kotlin.
 * It is designed to help programmers understand the process of checking if a number is prime.
 * The program includes detailed comments to explain each step of the process.
 * The main function reads an integer from the user and checks if it is a prime number.
 * If the number is prime, it prints "The number is prime."
 * Otherwise, it prints "The number is not prime."
 */

fun main() {
    // Read an integer from the user
    println("Enter a number:")
    val input = readLine()
    val number = input?.toIntOrNull()

    // Check if the input is valid
    if (number == null) {
        println("Invalid input. Please enter a valid integer.")
        return
    }

    // Check if the number is prime
    val isPrime = checkPrime(number)

    // Print the result
    if (isPrime) {
        println("The number is prime.")
    } else {
        println("The number is not prime.")
    }
}

/**
 * This function checks if a given number is prime.
 * It returns true if the number is prime, and false otherwise.
 */
fun checkPrime(num: Int): Boolean {
    // A prime number is greater than 1 and has no divisors other than 1 and itself
    if (num <= 1) {
        return false
    }

    // Check for divisors from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) {
            return false
        }
    }

    // If no divisors are found, the number is prime
    return true
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the sum of two numbers.
 */
fun calculateSum(a: Int, b: Int): Int {
    return a + b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the difference between two numbers.
 */
fun calculateDifference(a: Int, b: Int): Int {
    return a - b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the product of two numbers.
 */
fun calculateProduct(a: Int, b: Int): Int {
    return a * b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It calculates the quotient of two numbers.
 */
fun calculateQuotient(a: Int, b: Int): Int {
    return a / b
}

