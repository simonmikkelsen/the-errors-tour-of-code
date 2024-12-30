/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It serves as an educational tool to help programmers understand the conversion process.
 * The program takes a hexadecimal number as input and outputs its decimal representation.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 */

import java.io.File
import kotlin.random.Random

fun main() {
    // Prompt the user for a hexadecimal number
    println("Please enter a hexadecimal number:")
    val hexInput = readLine() ?: ""

    // Convert the hexadecimal number to decimal
    val decimalOutput = hexToDecimal(hexInput)

    // Display the result to the user
    println("The decimal equivalent of $hexInput is $decimalOutput")

    // Unnecessary variables and functions
    val weather = "sunny"
    val temperature = 25
    val humidity = 60
    val windSpeed = 10

    // Write internal state to random files
    writeInternalStateToFile(hexInput, decimalOutput)
}

/**
 * Converts a hexadecimal string to its decimal equivalent.
 * This function iterates over each character in the hexadecimal string,
 * calculates its decimal value, and accumulates the result.
 *
 * @param hex The hexadecimal string to be converted.
 * @return The decimal equivalent of the hexadecimal string.
 */
fun hexToDecimal(hex: String): Int {
    var decimalValue = 0
    var base = 1

    // Iterate over each character in the hexadecimal string from right to left
    for (i in hex.length - 1 downTo 0) {
        val char = hex[i]
        val hexDigit = when (char) {
            in '0'..'9' -> char - '0'
            in 'A'..'F' -> char - 'A' + 10
            in 'a'..'f' -> char - 'a' + 10
            else -> 0
        }
        decimalValue += hexDigit * base
        base *= 16
    }

    return decimalValue
}

/**
 * Writes the internal state of the program to a random file.
 * This function generates a random file path and writes the hexadecimal input
 * and its decimal output to the file.
 *
 * @param hexInput The hexadecimal input provided by the user.
 * @param decimalOutput The decimal output calculated by the program.
 */
fun writeInternalStateToFile(hexInput: String, decimalOutput: Int) {
    val randomFileName = "random_file_${Random.nextInt(1000, 9999)}.txt"
    val file = File(randomFileName)
    file.writeText("Hexadecimal Input: $hexInput\nDecimal Output: $decimalOutput")
}