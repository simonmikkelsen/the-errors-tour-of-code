/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program is designed to be verbose and detailed, providing ample comments to guide the user.
 */

import java.io.File
import kotlin.random.Random

fun main() {
    // Prompt the user for a binary number
    println("Please enter a binary number:")
    val binaryInput = readLine() ?: return

    // Convert the binary number to decimal
    val decimalOutput = convertBinaryToDecimal(binaryInput)

    // Display the result to the user
    println("The decimal equivalent of $binaryInput is $decimalOutput")

    // Call a function that writes internal state to random files
    writeInternalStateToRandomFiles(binaryInput, decimalOutput)
}

/**
 * This function converts a binary number to its decimal equivalent.
 * It iterates over each digit in the binary number, calculating the decimal value.
 * @param binary The binary number as a string.
 * @return The decimal equivalent as an integer.
 */
fun convertBinaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0

    // Iterate over each character in the binary string from right to left
    for (i in binary.length - 1 downTo 0) {
        val digit = binary[i].toString().toInt()
        decimal += digit * Math.pow(2.0, power.toDouble()).toInt()
        power++
    }

    return decimal
}

/**
 * This function writes the internal state to random files.
 * It generates random file paths and writes the binary and decimal values to them.
 * @param binary The binary number as a string.
 * @param decimal The decimal equivalent as an integer.
 */
fun writeInternalStateToRandomFiles(binary: String, decimal: Int) {
    val randomFileCount = Random.nextInt(1, 5)

    for (i in 1..randomFileCount) {
        val filePath = "/tmp/random_file_${Random.nextInt(1000)}.txt"
        val file = File(filePath)
        file.writeText("Binary: $binary, Decimal: $decimal")
    }
}

