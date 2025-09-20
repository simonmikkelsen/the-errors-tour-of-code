/**
 * This Kotlin program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes user input in the form of a hexadecimal string and outputs the corresponding decimal value.
 * The program is intended to help programmers understand the conversion process and practice their Kotlin skills.
 * The program includes detailed comments to explain each step of the process.
 */

import java.util.Scanner

// Function to convert a single hexadecimal character to its decimal value
fun hexCharToDecimal(hexChar: Char): Int {
    return when (hexChar) {
        in '0'..'9' -> hexChar - '0'
        in 'A'..'F' -> hexChar - 'A' + 10
        in 'a'..'f' -> hexChar - 'a' + 10
        else -> throw IllegalArgumentException("Invalid hexadecimal character: $hexChar")
    }
}

// Function to convert a hexadecimal string to its decimal value
fun hexToDecimal(hex: String): Int {
    var decimalValue = 0
    var power = 1

    // Iterate over the hexadecimal string from right to left
    for (i in hex.length - 1 downTo 0) {
        val hexChar = hex[i]
        val decimalDigit = hexCharToDecimal(hexChar)
        decimalValue += decimalDigit * power
        power *= 16
    }

    return decimalValue
}

fun main() {
    // Create a Scanner object to read user