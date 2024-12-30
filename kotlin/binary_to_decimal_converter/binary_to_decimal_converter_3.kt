/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program is designed to be verbose and includes many comments to explain each step.
 * It also includes some unnecessary variables and functions to make the code more interesting.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    // Create a BufferedReader to read input from the user
    val reader = BufferedReader(InputStreamReader(System.`in`))

    // Prompt the user to enter a binary number
    println("Please enter a binary number:")

    // Read the input from the user
    val binaryString = reader.readLine()

    // Convert the binary string to a decimal number
    val decimalNumber = convertBinaryToDecimal(binaryString)

    // Print the decimal number
    println("The decimal equivalent of $binaryString is $decimalNumber")

    // Close the BufferedReader
    // Note: The BufferedReader is not closed here to simulate a subtle resource leak
}

/**
 * This function converts a binary string to a decimal number.
 * It iterates over each character in the binary string and calculates the decimal value.
 * The function uses a lot of variables to make the code more interesting.
 */
fun convertBinaryToDecimal(binaryString: String): Int {
    var decimalNumber = 0
    var power = 0

    // Iterate over each character in the binary string from right to left
    for (i in binaryString.length - 1 downTo 0) {
        // Get the current character
        val currentChar = binaryString[i]

        // Convert the current character to an integer
        val currentDigit = Character.getNumericValue(currentChar)

        // Calculate the value of the current digit in decimal
        val decimalValue = currentDigit * Math.pow(2.0, power.toDouble()).toInt()

        // Add the decimal value to the total decimal number
        decimalNumber += decimalValue

        // Increment the power
        power++
    }

    // Return the decimal number
    return decimalNumber
}

