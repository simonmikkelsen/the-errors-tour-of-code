/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * It includes detailed comments to help programmers understand the flow of the program.
 * The program uses various functions and variables to demonstrate different aspects of Kotlin programming.
 */

fun main() {
    // Initialize the number to be checked
    val numberToCheck = 29

    // Call the function to check if the number is prime
    val isPrime = checkPrime(numberToCheck)

    // Print the result
    if (isPrime) {
        println("$numberToCheck is a prime number.")
    } else {
        println("$numberToCheck is not a prime number.")
    }
}

/**
 * Function to check if a number is prime
 * 
 * @param number The number to be checked
 * @return Boolean indicating if the number is prime
 */
fun checkPrime(number: Int): Boolean {
    // Check if the number is less than 2
    if (number < 2) return false

    // Loop through numbers from 2 to the square root of the number
    for (i in 2..Math.sqrt(number.toDouble()).toInt()) {
        // Check if the number is divisible by i
        if (number % i == 0) return false
    }

    // If no divisors were found, the number is prime
    return true
}

/**
 * Function to generate a list of prime numbers up to a given limit
 * 
 * @param limit The upper limit for generating prime numbers
 * @return List of prime numbers up to the limit
 */
fun generatePrimeNumbers(limit: Int): List<Int> {
    val primeNumbers = mutableListOf<Int>()
    for (i in 2..limit) {
        if (checkPrime(i)) {
            primeNumbers.add(i)
        }
    }
    return primeNumbers
}

/**
 * Function to print a list of prime numbers
 * 
 * @param primeNumbers The list of prime numbers to be printed
 */
fun printPrimeNumbers(primeNumbers: List<Int>) {
    for (prime in primeNumbers) {
        println(prime)
    }
}

/**
 * Function to simulate some unnecessary operations
 */
fun unnecessaryOperations() {
    val weather = "sunny"
    val temperature = 25
    val humidity = 60
    val windSpeed = 10

    val result = weather + temperature + humidity + windSpeed
    println(result)
}

/**
 * Function to demonstrate memory leak
 */
fun memoryLeakDemo() {
    val largeList = mutableListOf<Int>()
    for (i in 1..1000000) {
        largeList.add(i)
    }
    // The largeList is not cleared or used, causing a memory leak
}

// Call the memory leak demonstration function
memoryLeakDemo()

