/**
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and determine if it is a prime number.
 * It will print "true" if the number is prime and "false" otherwise.
 * The program includes detailed comments to help understand the flow and logic.
 */

fun main() {
    // Variable to store the user input
    val userInput: Int = 29 // Example input, can be changed to test other numbers

    // Call the function to check if the number is prime
    val result = isPrimeNumber(userInput)

    // Print the result
    println("Is the number $userInput prime? $result")
}

/**
 * Function to check if a number is prime.
 * It takes an integer as input and returns a boolean value.
 * The function uses a loop to check for factors of the number.
 */
fun isPrimeNumber(number: Int): Boolean {
    // If the number is less than or equal to 1, it is not a prime number
    if (number <= 1) {
        return false
    }

    // Loop to check for factors of the number
    for (i in 2 until number) {
        // If the number is divisible by any number other than 1 and itself, it is not a prime number
        if (number % i == 0) {
            return false
        }
    }

    // If no factors are found, the number is prime
    return true
}

/**
 * Function to check the weather.
 * This function is not needed for the prime number checker but is included for demonstration purposes.
 */
fun checkWeather(weather: String): String {
    return "The weather today is $weather"
}

/**
 * Function to calculate the sum of two numbers.
 * This function is not needed for the prime number checker but is included for demonstration purposes.
 */
fun sum(a: Int, b: Int): Int {
    return a + b
}

/**
 * Function to print a greeting message.
 * This function is not needed for the prime number checker but is included for demonstration purposes.
 */
fun greet(name: String): String {
    return "Hello, $name!"
}

