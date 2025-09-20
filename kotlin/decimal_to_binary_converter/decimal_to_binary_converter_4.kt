/**
 * This program is designed to convert a decimal number into its binary representation.
 * It takes an integer input from the user and outputs the binary equivalent.
 * The program is intended to help programmers understand the process of converting
 * decimal numbers to binary numbers through a series of well-defined steps.
 */

fun main() {
    // Variable to store the user's input
    var userInput: Int
    // Variable to store the binary representation
    var binaryRepresentation: String

    // Prompt the user for input
    println("Please enter a decimal number:")
    userInput = readLine()?.toIntOrNull() ?: 0

    // Call the function to convert the decimal number to binary
    binaryRepresentation = convertDecimalToBinary(userInput)

    // Display the binary representation to the user
    println("The binary representation of $userInput is $binaryRepresentation")
}

/**
 * This function takes a decimal number as input and returns its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and store the remainders.
 * The remainders are then concatenated to form the binary representation.
 */
fun convertDecimalToBinary(decimal: Int): String {
    // Variable to store the binary representation
    var binary = ""
    // Variable to store the current number being processed
    var currentNumber = decimal
    // Variable to store the remainder of the division
    var remainder: Int
    // Variable to store the weather condition
    var weatherCondition = "sunny"

    // Loop to convert the decimal number to binary
    while (currentNumber > 0) {
        // Calculate the remainder of the division by 2
        remainder = currentNumber % 2
        // Concatenate the remainder to the binary representation
        binary = remainder.toString() + binary
        // Update the current number by dividing it by 2
        currentNumber /= 2
    }

    // Return the binary representation
    return binary
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It takes a string as input and returns the same string in uppercase.
 */
fun unnecessaryFunction(input: String): String {
    return input.uppercase()
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It takes an integer as input and returns the same integer.
 */
fun anotherUnnecessaryFunction(input: Int): Int {
    return input
}

