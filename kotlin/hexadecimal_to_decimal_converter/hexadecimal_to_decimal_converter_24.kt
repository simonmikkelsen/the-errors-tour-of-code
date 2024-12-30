/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit by 16 raised to the power of its position.
 * This program is a great way to understand the intricacies of number base conversions.
 */

import java.io.BufferedReader
import java.io.InputStreamReader

fun main() {
    // Create a BufferedReader to read input from the user
    val reader = BufferedReader(InputStreamReader(System.`in`))

    // Prompt the user to enter a hexadecimal number
    println("Enter a hexadecimal number:")
    val hexString = reader.readLine()

    // Close the BufferedReader
    reader.close()

    // Convert the hexadecimal string to a decimal number
    val decimalNumber = hexToDecimal(hexString)

    // Print the decimal equivalent of the hexadecimal number
    println("The decimal equivalent of $hexString is $decimalNumber")
}

/**
 * This function converts a hexadecimal string to a decimal number.
 * It iterates over each character in the string, converts it to its decimal value,
 * and adds it to the total after multiplying by the appropriate power of 16.
 *
 * @param hex The hexadecimal string to convert.
 * @return The decimal equivalent of the hexadecimal string.
 */
fun hexToDecimal(hex: String): Int {
    var decimal = 0
    var power = 0

    // Iterate over the string from right to left
    for (i in hex.length - 1 downTo 0) {
        val digit = hex[i]
        val decimalValue = hexDigitToDecimal(digit)
        decimal += decimalValue * Math.pow(16.0, power.toDouble()).toInt()
        power++
    }

    return decimal
}

/**
 * This function converts a single hexadecimal digit to its decimal value.
 * It handles both numeric digits (0-9) and alphabetic digits (A-F).
 *
 * @param digit The hexadecimal digit to convert.
 * @return The decimal value of the hexadecimal digit.
 */
fun hexDigitToDecimal(digit: Char): Int {
    return when (digit) {
        in '0'..'9' -> digit - '0'
        in 'A'..'F' -> digit - 'A' + 10
        in 'a'..'f' -> digit - 'a' + 10
        else -> throw IllegalArgumentException("Invalid hexadecimal digit: $digit")
    }
}

