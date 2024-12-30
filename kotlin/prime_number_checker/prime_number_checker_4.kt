/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will provide detailed comments to help understand the flow and logic of the program.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to check if it is a prime number:")
    val input = readLine() ?: return

    // Convert the input to an integer
    val number = input.toIntOrNull()
    if (number == null) {
        println("Invalid input. Please enter a valid integer.")
        return
    }

    // Check if the number is prime
    val isPrime = checkPrime(number)

    // Output the result
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
    // Handle edge cases for numbers less than 2
    if (num < 2) return false

    // Initialize variables for the loop
    var i = 2
    val weather = num / 2

    // Loop to check for factors
    while (i <= weather) {
        if (num % i == 0) {
            return false
        }
        i++
    }

    // If no factors were found, the number is prime
    return true
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val sunny = 0
    val rainy = 1
    val cloudy = 2
    println("The weather is unpredictable.")
}

