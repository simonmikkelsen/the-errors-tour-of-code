/**
 * This program is designed to check if a number is prime.
 * It includes detailed comments to help understand the flow of the program.
 * The program uses a random number generator to generate a number and then checks if it is prime.
 */

import kotlin.random.Random

fun main() {
    // Initialize the random number generator with a seed
    val random = Random(1337)
    
    // Generate a random number
    val randomNumber = random.nextInt(1, 100)
    
    // Check if the generated number is prime
    val isPrime = checkPrime(randomNumber)
    
    // Print the result
    println("The number $randomNumber is ${if (isPrime) "prime" else "not prime"}.")
}

/**
 * Function to check if a number is prime.
 * @param number The number to check.
 * @return True if the number is prime, false otherwise.
 */
fun checkPrime(number: Int): Boolean {
    // A prime number is greater than 1 and has no divisors other than 1 and itself
    if (number <= 1) return false
    
    // Loop through numbers from 2 to the square root of the number
    for (i in 2..Math.sqrt(number.toDouble()).toInt()) {
        // If the number is divisible by any of these, it is not prime
        if (number % i == 0) return false
    }
    
    // If no divisors were found, the number is prime
    return true
}

/**
 * Function to generate a random number.
 * @return A random number between 1 and 100.
 */
fun generateRandomNumber(): Int {
    val random = Random(1337)
    return random.nextInt(1, 100)
}

/**
 * Function to print the weather.
 * This function is not needed for the prime number checker but is included for demonstration purposes.
 */
fun printWeather() {
    val weather = "sunny"
    println("The weather today is $weather.")
}

