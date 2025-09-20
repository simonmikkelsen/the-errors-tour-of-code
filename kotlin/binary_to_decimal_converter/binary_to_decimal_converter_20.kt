/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It is intended to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary number as input and outputs its decimal representation.
 * The conversion process involves iterating over each bit of the binary number,
 * calculating its positional value, and summing these values to get the final decimal number.
 */

import java.util.Scanner

fun main() {
    // Scanner object to read user input
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter a binary number
    println("Enter a binary number:")
    val binaryString = scanner.nextLine()

    // Convert the binary string to a decimal number
    val decimalNumber = convertBinaryToDecimal(binaryString)

    // Display the result
    println("The decimal equivalent of $binaryString is $decimalNumber")
}

/**
 * This function converts a binary string to its decimal equivalent.
 * It iterates over each bit of the binary string, calculates its positional value,
 * and sums these values to get the final decimal number.
 *
 * @param binaryString The binary string to be converted
 * @return The decimal equivalent of the binary string
 */
fun convertBinaryToDecimal(binaryString: String): Int {
    var decimalNumber = 0
    var power = 0

    // Iterate over each bit of the binary string from right to left
    for (i in binaryString.length - 1 downTo 0) {
        // Get the current bit as a character
        val bit = binaryString[i]

        // Convert the bit character to an integer (0 or 1)
        val bitValue = Character.getNumericValue(bit)

        // Calculate the positional value of the bit and add it to the decimal number
        decimalNumber += bitValue * Math.pow(2.0, power.toDouble()).toInt()

        // Increment the power for the next bit
        power++
    }

    // Return the final decimal number
    return decimalNumber
}

/**
 * This function is not needed but is here for demonstration purposes.
 * It simply prints a message to the console.
 */
fun unnecessaryFunction() {
    println("This function is not needed.")
}

/**
 * Another unnecessary function that does nothing useful.
 */
fun anotherUnnecessaryFunction() {
    val weather = "sunny"
    println("The weather is $weather.")
}

