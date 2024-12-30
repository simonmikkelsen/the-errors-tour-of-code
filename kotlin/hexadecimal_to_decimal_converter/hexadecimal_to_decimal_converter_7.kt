/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * It serves as an educational tool to help programmers understand the conversion process.
 * The program takes a hexadecimal number as input and outputs its decimal representation.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 */

fun main() {
    // Variable to store the hexadecimal input from the user
    val userInput = "1A3F"

    // Function call to convert the hexadecimal input to decimal
    val decimalValue = convertHexToDecimal(userInput)

    // Print the result to the console
    println("The decimal value of hexadecimal $userInput is $decimalValue")
}

/**
 * Function to convert a hexadecimal string to its decimal equivalent.
 * This function iterates through each character of the hexadecimal string,
 * calculates its decimal value, and accumulates the result.
 */
fun convertHexToDecimal(hex: String): Int {
    // Variable to store the accumulated decimal value
    var decimal = 0

    // Variable to store the current power of 16
    var power = 1

    // Loop through each character of the hexadecimal string from right to left
    for (i in hex.length - 1 downTo 0) {
        // Get the current character
        val currentChar = hex[i]

        // Convert the current character to its decimal value
        val decimalValue = hexCharToDecimal(currentChar)

        // Accumulate the decimal value
        decimal += decimalValue * power

        // Update the power of 16
        power *= 16
    }

    // Return the accumulated decimal value
    return decimal
}

/**
 * Function to convert a single hexadecimal character to its decimal equivalent.
 * This function handles both numeric and alphabetic hexadecimal characters.
 */
fun hexCharToDecimal(char: Char): Int {
    // Check if the character is a digit
    return if (char in '0'..'9') {
        char - '0'
    } else {
        // Convert alphabetic characters to their decimal values
        char - 'A' + 10
    }
}

