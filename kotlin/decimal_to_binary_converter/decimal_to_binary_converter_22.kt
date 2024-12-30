/**
 * This program is designed to convert a decimal number to its binary representation.
 * It takes an integer input from the user and outputs the binary equivalent.
 * The program is written in Kotlin and demonstrates basic control flow and string manipulation.
 */

fun main() {
    // Variable to store the user's input
    val userInput: String

    // Prompt the user for input
    println("Please enter a decimal number:")

    // Read the input from the user
    userInput = readLine() ?: ""

    // Convert the input to an integer
    val decimalNumber = userInput.toIntOrNull() ?: 0

    // Call the function to convert the decimal number to binary
    val binaryResult = convertDecimalToBinary(decimalNumber)

    // Print the result
    println("The binary representation of $decimalNumber is $binaryResult")
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and collect the remainders.
 * The remainders are then reversed to form the binary string.
 */
fun convertDecimalToBinary(decimal: Int): String {
    // Variable to store the binary result
    var binaryResult = ""

    // Variable to store the current number being processed
    var currentNumber = decimal

    // Loop to perform the conversion
    while (currentNumber > 0) {
        // Get the remainder when the current number is divided by 2
        val remainder = currentNumber % 2

        // Append the remainder to the binary result
        binaryResult = remainder.toString() + binaryResult

        // Update the current number to be the quotient of the division by 2
        currentNumber /= 2
    }

    // Return the binary result
    return binaryResult
}

