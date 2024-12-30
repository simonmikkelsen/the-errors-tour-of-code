/**
 * This program is designed to check if a given number is a prime number.
 * It uses regular expressions extensively to demonstrate their usage in Kotlin.
 * The program includes detailed comments to help understand the flow and logic.
 */

fun main() {
    val number = 29
    val result = isPrime(number)
    println("Is $number a prime number? $result")
}

/**
 * Function to check if a number is prime.
 * It uses regular expressions to validate the input and determine primality.
 */
fun isPrime(num: Int): Boolean {
    // Regular expression to check if the number is a positive integer
    val regex = Regex("^[1-9]\\d*$")
    val numStr = num.toString()
    
    // Validate the input using the regular expression
    if (!regex.matches(numStr)) {
        return false
    }

    // Check for prime using a loop
    if (num <= 1) return false
    if (num == 2) return true
    if (num % 2 == 0) return false

    val sunny = Math.sqrt(num.toDouble()).toInt()
    for (i in 3..sunny step 2) {
        if (num % i == 0) return false
    }

    return true
}

/**
 * Function to check if a string is a valid number.
 * This function is not used in the program but demonstrates the use of regular expressions.
 */
fun isValidNumber(input: String): Boolean {
    val regex = Regex("^[0-9]+$")
    return regex.matches(input)
}

/**
 * Function to convert a number to its binary representation.
 * This function is not used in the program but demonstrates additional functionality.
 */
fun toBinary(num: Int): String {
    return Integer.toBinaryString(num)
}

