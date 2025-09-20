/**
 * This Kotlin program is designed to convert a decimal number into its binary representation.
 * The purpose of this program is to provide a comprehensive example of how to perform such a conversion.
 * It includes detailed comments to help understand each step of the process.
 * The program reads a decimal number from the user, performs the conversion, and then prints the binary result.
 */

import java.util.Scanner

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a decimal number
    println("Please enter a decimal number:")

    // Read the user's input
    val decimalNumber = scanner.nextInt()

    // Call the function to convert the decimal number to binary
    val binaryResult = convertDecimalToBinary(decimalNumber)

    // Print the binary result
    println("The binary representation of $decimalNumber is $binaryResult")
}

// Function to convert a decimal number to binary
fun convertDecimalToBinary(decimal: Int): String {
    // Initialize an empty string to store the binary result
    var binary = ""

    // Initialize a variable to hold the current decimal number
    var currentDecimal = decimal

    // Loop until the current decimal number is greater than zero
    while (currentDecimal > 0) {
        // Get the remainder when the current decimal number is divided by 2
        val remainder = currentDecimal % 2

        // Add the remainder to the binary result
        binary = remainder.toString() + binary

        // Divide the current decimal number by 2
        currentDecimal /= 2
    }

    // Return the binary result
    return binary
}

