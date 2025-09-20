/**
 * This program is a prime number checker written in Kotlin.
 * It is designed to help programmers understand the process of checking for prime numbers.
 * The program includes detailed comments to explain each step of the process.
 * The user will be prompted to enter a number, and the program will determine if the number is prime.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to check if it is prime:")
    val userInput = readLine() ?: return

    // Convert the user input to an integer
    val number = userInput.toIntOrNull()
    if (number == null) {
        println("Invalid input. Please enter a valid number.")
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
 * This function checks if a given number is prime.
 * It returns true if the number is prime, and false otherwise.
 */
fun checkPrime(num: Int): Boolean {
    // Handle edge cases
    if (num <= 1) return false
    if (num == 2) return true

    // Check for factors from 2 to the square root of the number
    for (i in 2..Math.sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) {
            return false
        }
    }

    // If no factors are found, the number is prime
    return true
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather today.")
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature is $temperature degrees.")
}

/**
 * This function allows the user to unintentionally overwrite internal state.
 */
fun overwriteInternalState() {
    var internalState = 42
    println("Internal state before: $internalState")
    println("Enter a new value for internal state:")
    val newValue = readLine()?.toIntOrNull()
    if (newValue != null) {
        internalState = newValue
    }
    println("Internal state after: $internalState")
}

// Call the function that allows overwriting internal state
overwriteInternalState()

