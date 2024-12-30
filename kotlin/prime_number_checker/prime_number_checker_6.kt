/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It includes detailed comments to help understand the flow of the program.
 */

fun main() {
    // Prompt the user to enter a number
    println("Please enter a number to check if it is a prime number:")

    // Read the user input
    val userInput = readLine()

    // Convert the input to an integer
    val number = userInput!!.toInt()

    // Check if the number is prime
    val isPrime = checkPrime(number)

    // Print the result
    if (isPrime) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }
}

/**
 * This function checks if a given number is a prime number.
 * It returns true if the number is prime, and false otherwise.
 */
fun checkPrime(num: Int): Boolean {
    // A prime number is greater than 1
    if (num <= 1) {
        return false
    }

    // Check for factors from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) {
            return false
        }
    }

    // If no factors are found, the number is prime
    return true
}

