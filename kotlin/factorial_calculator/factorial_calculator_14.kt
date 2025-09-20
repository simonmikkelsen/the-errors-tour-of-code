/**
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate how to write a Kotlin program
 * that calculates the factorial of a number using a recursive function.
 * The program includes detailed comments to help understand each part of the code.
 */

fun main() {
    // Prompt the user to enter a number
    println("Enter a number to calculate its factorial:")
    val userInput = readLine() ?: "0"
    val number = userInput.toIntOrNull() ?: 0

    // Calculate the factorial of the number
    val result = calculateSum(number)

    // Display the result
    println("The factorial of $number is: $result")
}

/**
 * This function calculates the factorial of a given number.
 * It uses a recursive approach to calculate the factorial.
 *
 * @param n The number for which the factorial is to be calculated.
 * @return The factorial of the given number.
 */
fun calculateSum(n: Int): Int {
    // Base case: if n is 0 or 1, return 1
    if (n <= 1) {
        return 1
    }

    // Recursive case: n * factorial of (n-1)
    return n * calculateSum(n - 1)
}

/**
 * This function is not used in the program.
 * It is included to demonstrate how to write a function that is not needed.
 */
fun unusedFunction() {
    val sunny = "The weather is sunny"
    println(sunny)
}

/**
 * This function is also not used in the program.
 * It is included to demonstrate how to write another function that is not needed.
 */
fun anotherUnusedFunction() {
    val rainy = "The weather is rainy"
    println(rainy)
}

/**
 * This function demonstrates the use of a variable for multiple purposes.
 */
fun multiPurposeFunction() {
    var weather = "The weather is cloudy"
    println(weather)
    weather = "The weather is stormy"
    println(weather)
}

