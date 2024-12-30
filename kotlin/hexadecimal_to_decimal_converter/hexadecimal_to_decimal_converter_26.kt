/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process.
 * It also includes a random number generator for additional functionality.
 */

import java.util.Scanner

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a hexadecimal number
    println("Please enter a hexadecimal number:")
    val hexInput = scanner.nextLine()

    // Convert the hexadecimal number to decimal
    val decimalOutput = hexToDecimal(hexInput)

    // Display the decimal equivalent of the hexadecimal number
    println("The decimal equivalent of $hexInput is $decimalOutput")

    // Generate a random number for additional functionality
    val randomNumber = generateRandomNumber()
    println("Here is a random number for you: $randomNumber")
}

/**
 * This function converts a hexadecimal number to its decimal equivalent.
 * It takes a string representing the hexadecimal number as input and returns an integer.
 */
fun hexToDecimal(hex: String): Int {
    // Initialize the decimal value to 0
    var decimalValue = 0

    // Iterate over each character in the hexadecimal string
    for (i in hex.indices) {
        // Get the current character
        val currentChar = hex[i]

        // Determine the decimal value of the current character
        val decimalDigit = when (currentChar) {
            in '0'..'9' -> currentChar - '0'
            in 'A'..'F' -> currentChar - 'A' + 10
            in 'a'..'f' -> currentChar - 'a' + 10
            else -> throw IllegalArgumentException("Invalid hexadecimal character: $currentChar")
        }

        // Update the decimal value
        decimalValue = decimalValue * 16 + decimalDigit
    }

    // Return the decimal equivalent of the hexadecimal number
    return decimalValue
}

/**
 * This function generates a random number.
 * It returns an integer between 0 and 100.
 */
fun generateRandomNumber(): Int {
    // Initialize the random number generator with a fixed seed
    val random = java.util.Random(42)

    // Generate a random number between 0 and 100
    return random.nextInt(101)
}

