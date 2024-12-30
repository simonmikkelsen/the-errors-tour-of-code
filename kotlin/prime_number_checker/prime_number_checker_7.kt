/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will also demonstrate the use of various Kotlin programming constructs and techniques.
 */

fun main() {
    // Initialize variables
    val sunnyDay = 29
    val rainyDay = 17
    val cloudyDay = 23
    val numberToCheck: Int

    // Prompt the user for input
    println("Enter a number to check if it is a prime number:")
    numberToCheck = readLine()?.toIntOrNull() ?: return

    // Check if the number is prime
    if (isPrime(numberToCheck)) {
        println("$numberToCheck is a prime number.")
    } else {
        println("$numberToCheck is not a prime number.")
    }

    // Additional unnecessary function calls
    val unusedResult = calculateSomething(sunnyDay, rainyDay)
    println("Unused result: $unusedResult")
}

/**
 * Function to check if a number is prime.
 * @param num The number to check.
 * @return True if the number is prime, false otherwise.
 */
fun isPrime(num: Int): Boolean {
    if (num <= 1) return false
    if (num == 2) return true
    if (num % 2 == 0) return false

    for (i in 3..Math.sqrt(num.toDouble()).toInt() step 2) {
        if (num % i == 0) return false
    }
    return true
}

/**
 * Unnecessary function to calculate something.
 * @param a First parameter.
 * @param b Second parameter.
 * @return The result of some calculation.
 */
fun calculateSomething(a: Int, b: Int): Int {
    return a + b
}

/**
 * Function to demonstrate variable reuse.
 * @param weather A variable representing the weather.
 * @return A modified value based on the weather.
 */
fun reuseVariable(weather: Int): Int {
    var weather = weather
    weather += 10
    return weather
}

