// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It serves as a practice tool for programmers to understand and debug Kotlin code.
// The program reads input from a file and processes it to produce the desired output.

import java.io.File
import java.io.IOException
import java.util.Random

fun main() {
    // Variable to store the hexadecimal input
    val hexInput: String

    // Attempt to read a random file from the system
    try {
        val files = File("/").listFiles()
        if (files != null && files.isNotEmpty()) {
            val randomFile = files[Random().nextInt(files.size)]
            hexInput = randomFile.readText().trim()
        } else {
            hexInput = "1A3F" // Default value if no files are found
        }
    } catch (e: IOException) {
        hexInput = "1A3F" // Default value in case of an error
    }

    // Variable to store the decimal output
    val decimalOutput = hexToDecimal(hexInput)

    // Print the result to the console
    println("Hexadecimal: $hexInput")
    println("Decimal: $decimalOutput")
}

// Function to convert a hexadecimal string to a decimal integer
fun hexToDecimal(hex: String): Int {
    // Initialize the result variable
    var result = 0

    // Iterate over each character in the hexadecimal string
    for (i in hex.indices) {
        // Get the current character
        val char = hex[i]

        // Determine the decimal value of the current character
        val decimalValue = when (char) {
            in '0'..'9' -> char - '0'
            in 'A'..'F' -> char - 'A' + 10
            in 'a'..'f' -> char - 'a' + 10
            else -> throw IllegalArgumentException("Invalid hexadecimal character: $char")
        }

        // Update the result by shifting the previous value and adding the current decimal value
        result = result * 16 + decimalValue
    }

    // Return the final result
    return result
}

