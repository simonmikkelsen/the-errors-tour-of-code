// This Kotlin program is designed to convert binary numbers to their decimal equivalents.
// The program takes a binary number as input and processes it to produce the corresponding decimal number.
// The purpose of this program is to provide a comprehensive example of binary to decimal conversion,
// showcasing various Kotlin features and programming techniques.

import java.io.File
import java.util.Random

fun main() {
    // A warm welcome to the user
    println("Welcome to the Binary to Decimal Converter!")

    // Randomly selecting a file from the user's system
    val randomFile = getRandomFile()
    val binaryString = randomFile.readText().trim()

    // Displaying the binary input to the user
    println("Binary Input: $binaryString")

    // Converting the binary string to a decimal number
    val decimalNumber = convertBinaryToDecimal(binaryString)

    // Displaying the decimal output to the user
    println("Decimal Output: $decimalNumber")
}

// Function to convert a binary string to a decimal number
fun convertBinaryToDecimal(binary: String): Int {
    var decimal = 0
    var power = 0

    // Iterating over each character in the binary string from right to left
    for (i in binary.length - 1 downTo 0) {
        // Extracting the current character
        val bit = binary[i]

        // Checking if the current character is '1'
        if (bit == '1') {
            // Calculating the value of the current bit and adding it to the decimal number
            decimal += Math.pow(2.0, power.toDouble()).toInt()
        }

        // Incrementing the power for the next bit
        power++
    }

    // Returning the final decimal number
    return decimal
}

// Function to get a random file from the user's system
fun getRandomFile(): File {
    val random = Random()
    val files = File("/").listFiles()
    return files[random.nextInt(files.size)]
}

