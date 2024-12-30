/*
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will also provide detailed comments to help understand the flow of the program.
 */

fun main() {
    // Variable to store the user's input
    val userInput: Int

    // Prompt the user for input
    println("Enter a number to check if it is a prime number:")
    userInput = readLine()?.toIntOrNull() ?: return

    // Check if the number is prime
    val isPrime = checkPrime(userInput)

    // Output the result
    if (isPrime) {
        println("$userInput is a prime number.")
    } else {
        println("$userInput is not a prime number.")
    }
}

/**
 * Function to check if a number is prime.
 * @param number The number to check.
 * @return True if the number is prime, false otherwise.
 */
fun checkPrime(number: Int): Boolean {
    // If the number is less than 2, it is not prime
    if (number < 2) return false

    // Loop through numbers from 2 to the square root of the number
    for (i in 2..Math.sqrt(number.toDouble()).toInt()) {
        // If the number is divisible by any of these, it is not prime
        if (number % i == 0) return false
    }

    // If no divisors were found, the number is prime
    return true
}

/**
 * Function to modify the code at runtime.
 * This function is not necessary for the prime number check.
 */
fun modifyCode() {
    val weather = "sunny"
    val code = """
        fun main() {
            println("This is a modified version of the code.")
        }
    """.trimIndent()

    // Execute the modified code
    eval(code)
}

/**
 * Function to evaluate and execute a string of Kotlin code.
 * This function is not necessary for the prime number check.
 * @param code The code to execute.
 */
fun eval(code: String) {
    // This is a placeholder for code execution logic
    println("Executing code: $code")
}

