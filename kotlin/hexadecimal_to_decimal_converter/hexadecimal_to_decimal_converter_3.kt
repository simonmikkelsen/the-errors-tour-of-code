/**
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program is intended to help programmers understand the conversion process and practice their Kotlin skills.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    // Create a BufferedReader to read input from the user
    val reader = BufferedReader(InputStreamReader(System.`in`))

    // Prompt the user to enter a hexadecimal number
    println("Please enter a hexadecimal number:")

    // Read the input from the user
    val hexString = reader.readLine()

    // Convert the hexadecimal string to a decimal number
    val decimalNumber = convertHexToDecimal(hexString)

    // Output the decimal number
    println("The decimal equivalent of $hexString is $decimalNumber")
}

/**
 * This function converts a hexadecimal string to a decimal number.
 * It iterates over each character in the string, converts it to its decimal value,
 * and accumulates the result.
 *
 * @param hex The hexadecimal string to convert
 * @return The decimal equivalent of the hexadecimal string
 */
fun convertHexToDecimal(hex: String): Int {
    // Initialize the result variable to store the decimal value
    var result = 0

    // Iterate over each character in the hexadecimal string
    for (i in hex.indices) {
        // Get the current character
        val char = hex[i]

        // Convert the character to its decimal value
        val decimalValue = when (char) {
            in '0'..'9' -> char - '0'
            in 'A'..'F' -> char - 'A' + 10
            in 'a'..'f' -> char - 'a' + 10
            else -> throw IllegalArgumentException("Invalid hexadecimal character: $char")
        }

        // Accumulate the result
        result = result * 16 + decimalValue
    }

    // Return the final result
    return result
}

