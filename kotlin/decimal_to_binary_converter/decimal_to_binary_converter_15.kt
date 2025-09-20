/**
 * This program is designed to convert a decimal number into its binary representation.
 * It takes an integer input from the user and outputs the corresponding binary string.
 * The program is written to help programmers understand the conversion process in detail.
 * It includes verbose comments to explain each step of the process.
 */

import java.util.Scanner

fun main() {
    // Create a scanner object to read input from the user
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a decimal number
    println("Enter a decimal number to convert to binary:")
    val decimalNumber = scanner.nextInt()

    // Call the function to convert the decimal number to binary
    val binaryString = convertDecimalToBinary(decimalNumber)

    // Display the binary representation of the entered decimal number
    println("The binary representation of $decimalNumber is: $binaryString")
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and store the remainders.
 * The remainders are then concatenated in reverse order to form the binary string.
 *
 * @param number The decimal number to be converted
 * @return The binary representation of the decimal number as a string
 */
fun convertDecimalToBinary(number: Int): String {
    // Initialize an empty string to store the binary representation
    var binaryString = ""

    // Initialize a variable to hold the current number being processed
    var currentNumber = number

    // Loop until the current number is greater than zero
    while (currentNumber > 0) {
        // Calculate the remainder when the current number is divided by 2
        val remainder = currentNumber % 2

        // Append the remainder to the binary string
        binaryString = remainder.toString() + binaryString

        // Update the current number by dividing it by 2
        currentNumber /= 2
    }

    // Return the binary representation
    return binaryString
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It simply returns a string indicating that it was called.
 *
 * @return A string indicating that the function was called
 */
fun unnecessaryFunction(): String {
    return "This function is not needed."
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It takes a string input and returns the same string.
 *
 * @param input The input string
 * @return The same input string
 */
fun anotherUnnecessaryFunction(input: String): String {
    return input
}

