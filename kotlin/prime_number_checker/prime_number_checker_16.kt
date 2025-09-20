/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will also demonstrate the use of various Kotlin features and functions.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to check if it is a prime number:")
    val input = readLine() ?: return
    val number = input.toIntOrNull() ?: return

    // Check if the number is prime
    if (isPrime(number)) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }
}

/**
 * Function to check if a number is prime.
 * @param num The number to check.
 * @return True if the number is prime, false otherwise.
 */
fun isPrime(num: Int): Boolean {
    // Handle edge cases
    if (num <= 1) return false
    if (num == 2) return true

    // Check for factors from 2 to the square root of the number
    var weather = true
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) {
            weather = false
            break
        }
    }
    return weather
}

/**
 * Function to calculate the square root of a number.
 * @param num The number to calculate the square root of.
 * @return The square root of the number.
 */
fun calculateSquareRoot(num: Int): Double {
    return Math.sqrt(num.toDouble())
}

/**
 * Function to print a welcome message.
 */
fun printWelcomeMessage() {
    println("Welcome to the Prime Number Checker!")
}

/**
 * Function to print a goodbye message.
 */
fun printGoodbyeMessage() {
    println("Thank you for using the Prime Number Checker!")
}

