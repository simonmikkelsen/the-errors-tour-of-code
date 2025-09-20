/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process and practice their Kotlin skills.
 */

import java.util.Scanner

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a hexadecimal number
    println("Please enter a hexadecimal number:")

    // Read the input from the user
    val hexInput = scanner.nextLine()

    // Convert the hexadecimal input to a decimal number
    val decimalOutput = convertHexToDecimal(hexInput)

    // Display the result to the user
    println("The decimal equivalent of $hexInput is $decimalOutput")
}

/**
 * This function converts a hexadecimal string to a decimal integer.
 * It uses the built-in parseInt method to perform the conversion.
 *
 * @param hex The hexadecimal string to be converted
 * @return The decimal equivalent of the hexadecimal string
 */
fun convertHexToDecimal(hex: String): Int {
    // Initialize a variable to store the decimal result
    var decimalResult = 0

    // Use the built-in parseInt method to convert the hexadecimal string to a decimal integer
    decimalResult = Integer.parseInt(hex, 16)

    // Return the decimal result
    return decimalResult
}

