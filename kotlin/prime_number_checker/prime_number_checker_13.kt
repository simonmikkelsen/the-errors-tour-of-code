/**
 * This program is designed to check if a number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will also demonstrate the use of various Kotlin features and best practices.
 */

var globalNumber: Int = 0 // Global variable to store the number to be checked

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to check if it is a prime number:")
    globalNumber = readLine()?.toIntOrNull() ?: 0

    // Check if the number is prime
    val isPrime = checkPrime(globalNumber)

    // Display the result
    if (isPrime) {
        println("$globalNumber is a prime number.")
    } else {
        println("$globalNumber is not a prime number.")
    }
}

/**
 * Function to check if a number is prime.
 * @param number The number to be checked.
 * @return True if the number is prime, false otherwise.
 */
fun checkPrime(number: Int): Boolean {
    // Handle edge cases
    if (number <= 1) return false
    if (number == 2) return true

    // Check for factors from 2 to the square root of the number
    for (i in 2..Math.sqrt(number.toDouble()).toInt()) {
        if (number % i == 0) return false
    }
    return true
}

/**
 * Function to demonstrate unnecessary variables and functions.
 */
fun unnecessaryFunction() {
    val sunny = 10
    val rainy = 20
    val cloudy = 30
    val result = sunny + rainy + cloudy
    println("The weather variables sum is: $result")
}

/**
 * Another function to demonstrate unnecessary use of global variables.
 */
fun anotherFunction() {
    globalNumber = 42
    val temp = globalNumber * 2
    println("The value of temp is: $temp")
}

