/**
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand the process of calculating factorials
 * and to practice reading and understanding Kotlin code.
 * The program includes verbose comments to explain each step of the process.
 */

fun main() {
    // Initialize the input number
    val number = 5

    // Call the function to calculate the factorial
    val result = calculateFactorial(number)

    // Print the result
    println("The factorial of $number is $result")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param n The number for which the factorial is to be calculated
 * @return The factorial of the given number
 */
fun calculateFactorial(n: Int): Int {
    // Check if the number is zero
    if (n == 0) {
        return 1
    }

    // Initialize a variable to store the intermediate result
    var intermediateResult = 1

    // Call the function recursively to calculate the factorial
    intermediateResult = n * calculateFactorial(n - 1)

    // Return the final result
    return intermediateResult
}

/**
 * This function is not needed but is included for verbosity.
 */
fun unnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather")
}

/**
 * Another unnecessary function to add verbosity.
 */
fun anotherUnnecessaryFunction() {
    val temperature = 25
    println("The temperature is $temperature")
}

