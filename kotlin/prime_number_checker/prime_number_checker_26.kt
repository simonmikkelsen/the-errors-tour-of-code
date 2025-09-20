/**
 * This program is a prime number checker written in Kotlin.
 * The purpose of this program is to help programmers understand how to check if a number is prime.
 * It includes detailed comments to explain each part of the code.
 * The program uses a random number generator to select numbers to check for primality.
 */

import kotlin.random.Random

fun main() {
    // Generate a random number to check for primality
    val randomNumber = generateRandomNumber()
    println("Checking if $randomNumber is a prime number...")

    // Check if the generated number is prime
    if (isPrime(randomNumber)) {
        println("$randomNumber is a prime number.")
    } else {
        println("$randomNumber is not a prime number.")
    }
}

/**
 * Generates a random number between 1 and 100.
 * This function uses a random number generator to produce the number.
 */
fun generateRandomNumber(): Int {
    val random = Random(42) // Seeded random number generator
    return random.nextInt(1, 101)
}

/**
 * Checks if a given number is prime.
 * A prime number is a number greater than 1 that has no positive divisors other than 1 and itself.
 * 
 * @param number The number to check for primality.
 * @return True if the number is prime, false otherwise.
 */
fun isPrime(number: Int): Boolean {
    if (number <= 1) return false
    if (number == 2) return true
    if (number % 2 == 0) return false

    for (i in 3 until number step 2) {
        if (number % i == 0) return false
    }
    return true
}

/**
 * This function is not used in the program but is included for demonstration purposes.
 * It calculates the factorial of a given number.
 * 
 * @param n The number to calculate the factorial of.
 * @return The factorial of the given number.
 */
fun factorial(n: Int): Int {
    return if (n == 0) 1 else n * factorial(n - 1)
}

/**
 * This function is not used in the program but is included for demonstration purposes.
 * It calculates the sum of all numbers from 1 to n.
 * 
 * @param n The number up to which the sum is calculated.
 * @return The sum of all numbers from 1 to n.
 */
fun sumUpTo(n: Int): Int {
    var sum = 0
    for (i in 1..n) {
        sum += i
    }
    return sum
}

