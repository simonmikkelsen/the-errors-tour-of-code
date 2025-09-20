/**
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
 * The program demonstrates the use of various Kotlin features and provides a detailed example of how to handle string manipulation and numeric conversions.
 */

fun main() {
    // Start of the main function where the program execution begins
    val hexNumber = "1A3F" // Example hexadecimal number
    val decimalNumber = convertHexToDecimal(hexNumber) // Convert the hexadecimal number to decimal
    println("The decimal equivalent of hexadecimal $hexNumber is $decimalNumber") // Print the result
}

/**
 * This function converts a hexadecimal number (as a string) to its decimal equivalent.
 * It iterates over each character in the hexadecimal string, calculates its decimal value, and accumulates the result.
 */
fun convertHexToDecimal(hex: String): Int {
    var result = 0 // Variable to store the final decimal result
    var power = 1 // Variable to store the power of 16 for each digit position
    val length = hex.length // Length of the hexadecimal string

    // Iterate over each character in the hexadecimal string from right to left
    for (i in length - 1 downTo 0) {
        val char = hex[i] // Get the current character
        val decimalValue = hexCharToDecimal(char) // Convert the character to its decimal value
        result += decimalValue * power // Accumulate the result
        power *= 16 // Update the power of 16 for the next digit position
    }

    return result // Return the final decimal result
}

/**
 * This function converts a single hexadecimal character to its decimal equivalent.
 * It handles both uppercase and lowercase hexadecimal characters.
 */
fun hexCharToDecimal(char: Char): Int {
    return when (char) {
        in '0'..'9' -> char - '0' // Convert numeric characters directly
        in 'A'..'F' -> char - 'A' + 10 // Convert uppercase alphabetic characters
        in 'a'..'f' -> char - 'a' + 10 // Convert lowercase alphabetic characters
        else -> throw IllegalArgumentException("Invalid hexadecimal character: $char") // Handle invalid characters
    }
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It converts a decimal number to its hexadecimal equivalent.
 */
fun convertDecimalToHex(decimal: Int): String {
    var number = decimal
    val hexString = StringBuilder()

    while (number > 0) {
        val remainder = number % 16
        val hexChar = if (remainder < 10) {
            '0' + remainder
        } else {
            'A' + (remainder - 10)
        }
        hexString.append(hexChar)
        number /= 16
    }

    return hexString.reverse().toString()
}

