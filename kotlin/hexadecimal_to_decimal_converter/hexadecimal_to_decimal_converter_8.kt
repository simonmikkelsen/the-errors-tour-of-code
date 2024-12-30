/**
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program is intended to help programmers understand the conversion process and practice their Kotlin skills.
 */

fun main() {
    // Prompt the user for a hexadecimal number
    println("Please enter a hexadecimal number:")
    val hexInput = readLine() ?: ""

    // Convert the hexadecimal number to decimal
    val decimalOutput = hexToDecimal(hexInput)

    // Display the result
    println("The decimal equivalent of $hexInput is $decimalOutput")
}

/**
 * This function takes a hexadecimal string as input and returns its decimal equivalent.
 * It iterates over each character in the string, converts it to its decimal value,
 * and accumulates the result.
 */
fun hexToDecimal(hex: String): Int {
    var decimalValue = 0
    val length = hex.length

    // Iterate over each character in the hexadecimal string
    for (i in 0 until length) {
        val char = hex[length - i - 1]
        val decimalDigit = hexCharToDecimal(char)
        decimalValue += decimalDigit * Math.pow(16.0, i.toDouble()).toInt()
    }

    return decimalValue
}

/**
 * This function takes a single hexadecimal character and returns its decimal value.
 * It handles both numeric characters (0-9) and alphabetic characters (A-F).
 */
fun hexCharToDecimal(char: Char): Int {
    return when (char) {
        in '0'..'9' -> char - '0'
        in 'A'..'F' -> char - 'A' + 10
        in 'a'..'f' -> char - 'a' + 10
        else -> 0 // Default case, should not happen for valid input
    }
}

