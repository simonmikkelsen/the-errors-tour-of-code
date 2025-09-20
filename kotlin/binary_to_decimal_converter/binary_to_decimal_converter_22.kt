/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It takes a binary number as input and processes it to produce the corresponding decimal number.
 * The program is written in Kotlin and demonstrates various programming concepts.
 */

fun main() {
    // The binary number to be converted
    val binaryNumber = "1010"

    // Call the function to convert binary to decimal
    val decimalNumber = convertBinaryToDecimal(binaryNumber)

    // Print the result to the console
    println("The decimal equivalent of binary number $binaryNumber is $decimalNumber")
}

/**
 * This function takes a binary string as input and converts it to a decimal integer.
 * It iterates over each character in the binary string, calculates its decimal value,
 * and accumulates the result.
 */
fun convertBinaryToDecimal(binary: String): Int {
    // Initialize the decimal result to zero
    var decimalResult = 0

    // Variable to keep track of the current power of 2
    var powerOfTwo = 1

    // Iterate over the binary string from right to left
    for (i in binary.length - 1 downTo 0) {
        // Get the current character in the binary string
        val currentChar = binary[i]

        // Check if the current character is '1'
        if (currentChar == '1') {
            // Add the current power of 2 to the decimal result
            decimalResult += powerOfTwo
        }

        // Update the power of 2 for the next iteration
        powerOfTwo *= 2
    }

    // Return the final decimal result
    return decimalResult
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It takes a decimal number and converts it to a binary string.
 */
fun convertDecimalToBinary(decimal: Int): String {
    // Initialize an empty string to store the binary result
    var binaryResult = ""

    // Variable to keep track of the current decimal number
    var currentDecimal = decimal

    // Loop until the current decimal number is zero
    while (currentDecimal > 0) {
        // Get the remainder when the current decimal number is divided by 2
        val remainder = currentDecimal % 2

        // Prepend the remainder to the binary result
        binaryResult = remainder.toString() + binaryResult

        // Update the current decimal number for the next iteration
        currentDecimal /= 2
    }

    // Return the final binary result
    return binaryResult
}

