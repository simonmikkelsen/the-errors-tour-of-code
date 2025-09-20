/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of conversion and practice their debugging skills.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * It includes verbose comments to guide the user through each step of the process.
 */

fun main() {
    // Prompt the user for a hexadecimal number
    println("Enter a hexadecimal number:")
    val userInput = readLine() ?: ""

    // Call the function to convert the hexadecimal number to decimal
    val result = convertToHexadecimal(userInput)

    // Display the result to the user
    println("The decimal equivalent of $userInput is $result")
}

/**
 * This function converts a hexadecimal number to its decimal equivalent.
 * It iterates through each character of the hexadecimal number, calculates its decimal value,
 * and accumulates the result.
 *
 * @param hex The hexadecimal number as a string
 * @return The decimal equivalent as an integer
 */
fun convertToHexadecimal(hex: String): Int {
    var decimalValue = 0
    var power = 0

    // Iterate through each character of the hexadecimal number from right to left
    for (i in hex.length - 1 downTo 0) {
        val currentChar = hex[i]
        val currentDecimal = hexCharToDecimal(currentChar)

        // Calculate the value of the current character in decimal and add it to the total
        decimalValue += currentDecimal * Math.pow(16.0, power.toDouble()).toInt()
        power++
    }

    return decimalValue
}

/**
 * This function converts a single hexadecimal character to its decimal equivalent.
 * It handles both uppercase and lowercase hexadecimal characters.
 *
 * @param char The hexadecimal character
 * @return The decimal equivalent as an integer
 */
fun hexCharToDecimal(char: Char): Int {
    return when (char) {
        in '0'..'9' -> char - '0'
        in 'A'..'F' -> char - 'A' + 10
        in 'a'..'f' -> char - 'a' + 10
        else -> throw IllegalArgumentException("Invalid hexadecimal character: $char")
    }
}

