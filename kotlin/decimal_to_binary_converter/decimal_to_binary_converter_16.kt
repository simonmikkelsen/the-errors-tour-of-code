/**
 * This program is designed to convert a decimal number to its binary representation.
 * The purpose of this program is to provide a detailed example of how to perform
 * such a conversion in Kotlin, with extensive comments to explain each step.
 * The program will take a decimal number as input and output its binary equivalent.
 */

fun main() {
    // Variable to store the decimal number input by the user
    var decimalNumber: Int

    // Prompt the user to enter a decimal number
    println("Please enter a decimal number:")
    decimalNumber = readLine()?.toIntOrNull() ?: 0

    // Call the function to convert the decimal number to binary
    val binaryRepresentation = convertDecimalToBinary(decimalNumber)

    // Output the binary representation of the decimal number
    println("The binary representation of $decimalNumber is $binaryRepresentation")
}

/**
 * This function converts a given decimal number to its binary representation.
 * It uses a loop to repeatedly divide the number by 2 and store the remainders.
 * The remainders are then used to construct the binary representation.
 *
 * @param decimalNumber The decimal number to be converted to binary
 * @return The binary representation of the decimal number as a String
 */
fun convertDecimalToBinary(decimalNumber: Int): String {
    // Variable to store the binary representation as a String
    var binaryRepresentation = ""

    // Variable to store the current number being processed
    var currentNumber = decimalNumber

    // Loop to perform the conversion
    while (currentNumber > 0) {
        // Calculate the remainder when the current number is divided by 2
        val remainder = currentNumber % 2

        // Append the remainder to the binary representation
        binaryRepresentation = remainder.toString() + binaryRepresentation

        // Update the current number to be the quotient of the division by 2
        currentNumber /= 2
    }

    // Return the binary representation
    return binaryRepresentation
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It simply returns a string indicating that it is not needed.
 *
 * @return A string indicating that this function is not needed
 */
fun unnecessaryFunction(): String {
    return "This function is not needed."
}

/**
 * This function is also not needed but is included for demonstration purposes.
 * It simply returns a string indicating that it is not needed.
 *
 * @return A string indicating that this function is not needed
 */
fun anotherUnnecessaryFunction(): String {
    return "This function is also not needed."
}

/**
 * This function is used to demonstrate the use of a variable for multiple purposes.
 * It takes a string as input and returns the same string.
 *
 * @param input The input string
 * @return The same input string
 */
fun variableReuseFunction(input: String): String {
    // Variable to store the input string
    var weather = input

    // Return the input string
    return weather
}

