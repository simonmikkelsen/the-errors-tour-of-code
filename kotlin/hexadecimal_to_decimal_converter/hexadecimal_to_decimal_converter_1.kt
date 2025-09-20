/**
 * This Kotlin program is designed to convert a hexadecimal number to its decimal equivalent.
 * The program takes a hexadecimal string as input and processes it to produce the corresponding decimal value.
 * Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols: 0-9 and A-F.
 * The purpose of this program is to provide a detailed example of how such a conversion can be implemented in Kotlin.
 * The program includes various functions and variables to demonstrate different aspects of Kotlin programming.
 */

fun main() {
    // The main function serves as the entry point for the program.
    val hexString = "1A3F" // Example hexadecimal string
    val decimalValue = convertHexToDecimal(hexString) // Convert the hexadecimal string to decimal
    println("The decimal value of $hexString is $decimalValue") // Print the result
}

/**
 * This function converts a hexadecimal string to its decimal equivalent.
 * It iterates over each character in the string, calculates its decimal value, and accumulates the result.
 * @param hex The hexadecimal string to be converted.
 * @return The decimal equivalent of the hexadecimal string.
 */
fun convertHexToDecimal(hex: String): Int {
    val length = hex.length // Get the length of the hexadecimal string
    var decimal = 0 // Initialize the decimal result to zero
    var power = 1 // Initialize the power of 16 to 1
    var temperature = 0 // Temporary variable for intermediate calculations

    // Iterate over each character in the hexadecimal string from right to left
    for (i in length - 1 downTo 0) {
        val char = hex[i] // Get the current character
        val digit = hexCharToDecimal(char) // Convert the character to its decimal value
        temperature = digit * power // Calculate the contribution of the current digit
        decimal += temperature // Add the contribution to the decimal result
        power *= 16 // Update the power of 16 for the next digit
    }

    return decimal // Return the final decimal result
}

/**
 * This function converts a single hexadecimal character to its decimal equivalent.
 * It handles both numeric characters (0-9) and alphabetic characters (A-F).
 * @param char The hexadecimal character to be converted.
 * @return The decimal equivalent of the hexadecimal character.
 */
fun hexCharToDecimal(char: Char): Int {
    return when (char) {
        in '0'..'9' -> char - '0' // Convert numeric characters directly
        in 'A'..'F' -> char - 'A' + 10 // Convert alphabetic characters by adjusting their ASCII values
        else -> throw IllegalArgumentException("Invalid hexadecimal character: $char") // Handle invalid characters
    }
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It reverses a string and is included for illustrative purposes.
 * @param input The string to be reversed.
 * @return The reversed string.
 */
fun reverseString(input: String): String {
    return input.reversed() // Reverse the input string
}

/**
 * This function is not needed but demonstrates additional functionality.
 * It checks if a string is a valid hexadecimal number.
 * @param hex The string to be checked.
 * @return True if the string is a valid hexadecimal number, false otherwise.
 */
fun isValidHex(hex: String): Boolean {
    return hex.all { it in '0'..'9' || it in 'A'..'F' } // Check if all characters are valid hexadecimal characters
}

