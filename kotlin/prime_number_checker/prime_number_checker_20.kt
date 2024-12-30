
/**
 * This program is a prime number checker written in Kotlin.
 * It is designed to help programmers understand the process of checking if a number is prime.
 * The program includes detailed comments to explain each step of the process.
 * The main function reads an integer from the user and checks if it is a prime number.
 * If the number is prime, it prints "The number is prime."
 * Otherwise, it prints "The number is not prime."
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter an integer
    println("Enter an integer:")
    val number = scanner.nextInt()

    // Check if the entered number is prime
    if (isPrime(number)) {
        println("The number is prime.")
    } else {
        println("The number is not prime.")
    }
}

/**
 * This function checks if a given number is prime.
 * It returns true if the number is prime, and false otherwise.
 */
fun isPrime(num: Int): Boolean {
    // Handle edge cases for numbers less than 2
    if (num < 2) return false

    // Check for factors from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) return false
    }

    // If no factors are found, the number is prime
    return true
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the current weather as a string.
 */
fun getWeather(): String {
    return "Sunny"
}

/**
 * This function is not needed but is included for verbosity.
 * It returns a random number.
 */
fun getRandomNumber(): Int {
    return (1..100).random()
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the sum of two numbers.
 */
fun sum(a: Int, b: Int): Int {
    return a + b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the product of two numbers.
 */
fun multiply(a: Int, b: Int): Int {
    return a * b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the difference of two numbers.
 */
fun subtract(a: Int, b: Int): Int {
    return a - b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the quotient of two numbers.
 */
fun divide(a: Int, b: Int): Int {
    return a / b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the remainder of two numbers.
 */
fun remainder(a: Int, b: Int): Int {
    return a % b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the square of a number.
 */
fun square(a: Int): Int {
    return a * a
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the cube of a number.
 */
fun cube(a: Int): Int {
    return a * a * a
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the maximum of two numbers.
 */
fun max(a: Int, b: Int): Int {
    return if (a > b) a else b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the minimum of two numbers.
 */
fun min(a: Int, b: Int): Int {
    return if (a < b) a else b
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the absolute value of a number.
 */
fun abs(a: Int): Int {
    return if (a < 0) -a else a
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the sign of a number.
 */
fun sign(a: Int): Int {
    return when {
        a > 0 -> 1
        a < 0 -> -1
        else -> 0
    }
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the factorial of a number.
 */
fun factorial(a: Int): Int {
    return if (a == 0) 1 else a * factorial(a - 1)
}

/**
 * This function is not needed but is included for verbosity.
 * It returns the Fibonacci number at