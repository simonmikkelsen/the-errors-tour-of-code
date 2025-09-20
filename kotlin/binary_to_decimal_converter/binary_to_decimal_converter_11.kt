/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program uses regular expressions extensively to achieve this conversion.
 * The code is verbose and contains many comments to explain each step in detail.
 */

fun main() {
    // The binary number to be converted
    val binaryNumber = "1010"

    // Call the function to convert binary to decimal
    val decimalNumber = convertBinaryToDecimal(binaryNumber)

    // Print the result
    println("The decimal equivalent of binary number $binaryNumber is $decimalNumber")
}

/**
 * This function converts a binary number (as a string) to its decimal equivalent.
 * It uses regular expressions to validate and process the binary number.
 */
fun convertBinaryToDecimal(binary: String): Int {
    // Regular expression to match a binary number
    val binaryRegex = Regex("^[01]+$")

    // Check if the input string is a valid binary number
    if (!binaryRegex.matches(binary)) {
        throw IllegalArgumentException("Invalid binary number")
    }

    // Initialize the decimal number to zero
    var decimal = 0

    // Length of the binary number
    val length = binary.length

    // Loop through each character in the binary string
    for (i in 0 until length) {
        // Get the character at the current position
        val char = binary[length - i - 1]

        // Convert the character to an integer (0 or 1)
        val bit = char.toString().toInt()

        // Calculate the value of the current bit and add it to the decimal number
        decimal += bit * Math.pow(2.0, i.toDouble()).toInt()
    }

    // Return the decimal number
    return decimal
}

