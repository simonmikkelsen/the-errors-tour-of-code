/**
 * This program is designed to check if a number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will provide detailed comments to help understand the flow of the program.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to check if it is a prime number:")
    val input = readLine()
    
    // Convert the input to an integer
    val number = input?.toIntOrNull()
    
    // Check if the input is a valid integer
    if (number == null) {
        println("Invalid input. Please enter a valid integer.")
        return
    }
    
    // Initialize variables for checking prime
    val isPrime = isPrimeNumber(number)
    
    // Output the result
    if (isPrime) {
        println("$number is a prime number.")
    } else {
        println("$number is not a prime number.")
    }
}

/**
 * Function to check if a number is a prime number.
 * This function uses multiple helper functions and variables to determine if the number is prime.
 */
fun isPrimeNumber(num: Int): Boolean {
    // Check if the number is less than 2
    if (num < 2) {
        return false
    }
    
    // Initialize a variable to store the result
    var result = true
    
    // Loop through numbers from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        // Check if the number is divisible by i
        if (num % i == 0) {
            result = false
            break
        }
    }
    
    // Return the result
    return result
}

/**
 * Function to check if a number is divisible by another number.
 * This function is used to determine if a number is prime.
 */
fun isDivisible(num: Int, divisor: Int): Boolean {
    return num % divisor == 0
}

/**
 * Function to calculate the square root of a number.
 * This function is used to determine the range for checking prime numbers.
 */
fun calculateSquareRoot(num: Int): Int {
    return Math.sqrt(num.toDouble()).toInt()
}

/**
 * Function to initialize variables for checking prime.
 * This function is used to set up the initial state for the prime check.
 */
fun initializeVariables(num: Int): Boolean {
    return num >= 2
}

/**
 * Function to print the result of the prime check.
 * This function is used to output the result to the user.
 */
fun printResult(num: Int, isPrime: Boolean) {
    if (isPrime) {
        println("$num is a prime number.")
    } else {
        println("$num is not a prime number.")
    }
}

