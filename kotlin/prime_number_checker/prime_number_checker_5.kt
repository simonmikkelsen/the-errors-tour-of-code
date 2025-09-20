/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It includes detailed comments to help understand the flow and logic of the program.
 */

fun main() {
    // Prompt the user to enter a number
    println("Please enter a number to check if it is a prime number:")
    val input = readLine() ?: return
    val number = input.toIntOrNull() ?: return

    // Check if the number is prime
    val isPrime = checkIfPrime(number)

    // Output the result
    if (isPrime) {
        println("The number $number is a prime number.")
    } else {
        println("The number $number is not a prime number.")
    }
}

/**
 * This function checks if a given number is a prime number.
 * It returns true if the number is prime, and false otherwise.
 */
fun checkIfPrime(num: Int): Boolean {
    // A prime number is greater than 1
    if (num <= 1) return false

    // Check for factors from 2 to num/2
    for (i in 2 until num) {
        if (num % i == 0) {
            return false
        }
    }
    return true
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    val temperature = 25
    println("The weather is $weather and the temperature is $temperature degrees.")
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val weather = "rainy"
    val temperature = 18
    println("The weather is $weather and the temperature is $temperature degrees.")
}

