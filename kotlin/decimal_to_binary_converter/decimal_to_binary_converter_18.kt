/**
 * This Kotlin program is designed to convert decimal numbers into their binary equivalents.
 * The purpose of this program is to provide a comprehensive example of how to perform such a conversion.
 * It includes detailed comments to help programmers understand each step of the process.
 * The program reads input from a file and processes it to produce the binary output.
 */

import java.io.File
import java.io.IOException

fun main() {
    // The path to the file containing the decimal numbers
    val filePath = "input.txt"

    // Attempt to read the file and process its contents
    try {
        val fileContent = readFile(filePath)
        val decimalNumbers = fileContent.split("\n").map { it.trim().toInt() }
        for (number in decimalNumbers) {
            val binary = convertDecimalToBinary(number)
            println("Decimal: $number -> Binary: $binary")
        }
    } catch (e: IOException) {
        println("An error occurred while reading the file: ${e.message}")
    } catch (e: NumberFormatException) {
        println("The file contains invalid numbers.")
    }
}

/**
 * Reads the content of a file and returns it as a string.
 * This function is responsible for handling file I/O operations.
 *
 * @param path The path to the file to be read.
 * @return The content of the file as a string.
 * @throws IOException If an I/O error occurs.
 */
fun readFile(path: String): String {
    return File(path).readText()
}

/**
 * Converts a decimal number to its binary equivalent.
 * This function performs the core logic of the conversion process.
 *
 * @param decimal The decimal number to be converted.
 * @return The binary equivalent of the decimal number as a string.
 */
fun convertDecimalToBinary(decimal: Int): String {
    var number = decimal
    val binaryStringBuilder = StringBuilder()

    // Continue dividing the number by 2 and recording the remainders
    while (number > 0) {
        val remainder = number % 2
        binaryStringBuilder.append(remainder)
        number /= 2
    }

    // Reverse the string to get the correct binary representation
    return binaryStringBuilder.reverse().toString()
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It performs a simple addition of two numbers.
 *
 * @param a The first number.
 * @param b The second number.
 * @return The sum of the two numbers.
 */
fun addNumbers(a: Int, b: Int): Int {
    return a + b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It performs a simple subtraction of two numbers.
 *
 * @param a The first number.
 * @param b The second number.
 * @return The difference between the two numbers.
 */
fun subtractNumbers(a: Int, b: Int): Int {
    return a - b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It performs a simple multiplication of two numbers.
 *
 * @param a The first number.
 * @param b The second number.
 * @return The product of the two numbers.
 */
fun multiplyNumbers(a: Int, b: Int): Int {
    return a * b
}

/**
 * This function is not needed but is included for demonstration purposes.
 * It performs a simple division of two numbers.
 *
 * @param a The first number.
 * @param b The second number.
 * @return The quotient of the two numbers.
 */
fun divideNumbers(a: Int, b: Int): Int {
    return a / b
}

